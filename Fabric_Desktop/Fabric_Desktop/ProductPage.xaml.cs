using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Fabric_Desktop
{
    /// <summary>
    /// Логика взаимодействия для ProductPage.xaml
    /// </summary>
    public partial class ProductPage : Page
    {
        public ProductPage(int roleID)
        {
            InitializeComponent();
            if(roleID == 1)
            {
                AddButtonColumn("Редактирование", "BtnUpdProduct", "Редактировать", BtnUpdProduct_Click);
                AddButtonColumn("Удаление", "BtnDelProduct", "Удалить", BtnDelProduct_Click);
                BtnAddProduct.Visibility = Visibility.Visible;
            }
            UpdateDataGrid(TradeEntities.GetContext().Product.ToList());
            
        }

        public void UpdateDataGrid(List<Product> productList)
        {
            dgProduct.ItemsSource = productList;
            lbQuantityProduct.Content = $@"{productList.Count()} из {productList.Count()}";
            List<string> manufacturerList = new List<string>();
            foreach (var product in productList)
            {
                if (!manufacturerList.Contains(product.ProductManufacturer))
                    manufacturerList.Add(product.ProductManufacturer);
            }
            CbManufacturer.ItemsSource = manufacturerList;
        }

        private void ProductFilter()
        {
            List<Product> productList = TradeEntities.GetContext().Product.ToList();
            lbQuantityProduct.Content = $@" из {productList.Count()}";
            if (string.IsNullOrEmpty(TbSearch.Text) && CbManufacturer.SelectedIndex != -1)
                productList = productList.Where(p => p.ProductManufacturer == CbManufacturer.SelectedValue.ToString()).ToList();
            else if (!string.IsNullOrEmpty(TbSearch.Text) && CbManufacturer.SelectedIndex == -1)
                productList = productList.Where(
                                p => p.ProductName.ToLower().Contains(TbSearch.Text.ToLower()) ||
                                p.ProductDescription.ToLower().Contains(TbSearch.Text.ToLower()) ||
                                p.ProductCategory.ToLower().Contains(TbSearch.Text.ToLower()) ||
                                p.ProductCost.ToString().ToLower().Contains(TbSearch.Text.ToLower())
                                ).ToList();
            else if(!string.IsNullOrEmpty(TbSearch.Text) && CbManufacturer.SelectedIndex != -1)
            {
                productList = productList.Where(p => p.ProductManufacturer == CbManufacturer.SelectedValue.ToString()).ToList();
                productList = productList.Where(
                                p => p.ProductName.ToLower().Contains(TbSearch.Text.ToLower()) ||
                                p.ProductDescription.ToLower().Contains(TbSearch.Text.ToLower()) ||
                                p.ProductCategory.ToLower().Contains(TbSearch.Text.ToLower()) ||
                                p.ProductCost.ToString().ToLower().Contains(TbSearch.Text.ToLower())
                                ).ToList();
            }
            lbQuantityProduct.Content = productList.Count.ToString() + lbQuantityProduct.Content;
            dgProduct.ItemsSource = productList;
        }

        private void AddButtonColumn(string header, string buttonName, string buttonContent, RoutedEventHandler routedEventHandler)
        {
            DataTemplate cellTemplate = new DataTemplate();
            FrameworkElementFactory buttonFactory = new FrameworkElementFactory(typeof(Button));
            buttonFactory.SetValue(Button.ContentProperty, buttonContent);
            buttonFactory.SetValue(Button.NameProperty, buttonName);
            buttonFactory.AddHandler(Button.ClickEvent, new RoutedEventHandler(routedEventHandler));
            cellTemplate.VisualTree = buttonFactory;

            DataGridTemplateColumn columnUpdateProduct = new DataGridTemplateColumn
            {
                Header = header,
                CellTemplate = cellTemplate
            };
            dgProduct.Columns.Add(columnUpdateProduct);
        }

        private void TbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            ProductFilter();
        }

        private void CbManufacturer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ProductFilter();
        }

        private void BtnUpdProduct_Click(object sender, RoutedEventArgs e)
        {
            if (dgProduct.SelectedIndex != -1)
            {
                FrameManager.MainFrame.Navigate(new ManageProductPage((Product)dgProduct.SelectedItem, this));
            }
        }

        private void BtnDelProduct_Click(object sender, RoutedEventArgs e)
        {
            Product product = (Product)dgProduct.SelectedItem;
            if (TradeEntities.GetContext().OrderProduct.ToList().Where(p => p.ProductArticleNumber == product.ProductArticleNumber).ToList().Count == 0)
            {
                TradeEntities.GetContext().Product.Remove(product);
                try
                {

                }
                catch(Exception ex)
                {
                    MessageBox.Show("Ошибка\n" + ex.ToString());
                }
            }
            else
                MessageBox.Show("Нельзя удалить товар т.к. он находится в заказе");
        }

        private void BtnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            FrameManager.MainFrame.Navigate(new ManageProductPage(this));
        }
    }
}
