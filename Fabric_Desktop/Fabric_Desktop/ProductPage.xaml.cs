using Fabric_Desktop.Utilities;
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
        private int UserId{get;}

        public ProductPage(int userId)
        {
            InitializeComponent();
            UserId = userId;
            if (userId == 1)
            {
                BtnAddProduct.Visibility = Visibility.Visible;
                DgProduct.Columns[DgProduct.Columns.Count-1].Visibility = Visibility.Visible;
            }
            List<Product> productList = BaseModel.GetContext().Products.ToList();
            DgProduct.ItemsSource = productList;
            List<string> manafacturerList = new List<string>();
            foreach(Product product in productList)
            {
                if (!manafacturerList.Contains(product.ProductManufacturer))
                    manafacturerList.Add(product.ProductManufacturer);
            }
            CbManufacturer.ItemsSource = manafacturerList;
        }

        private void FilterProducts()
        {
            List<Product> productList = BaseModel.GetContext().Products.ToList();
            if (string.IsNullOrWhiteSpace(TbSearch.Text) == true && CbManufacturer.SelectedIndex != -1)
                productList = productList.Where(p => p.ProductManufacturer == CbManufacturer.Text).ToList();
            else if (CbManufacturer.SelectedIndex == -1 && string.IsNullOrWhiteSpace(TbSearch.Text) == false)
                productList = productList.Where(p => p.ProductName.Contains(TbSearch.Text) ||
                                                        p.ProductDescription.Contains(TbSearch.Text) || p.ProductCategory.Contains(TbSearch.Text)).ToList();
            else if (CbManufacturer.SelectedIndex != -1 && string.IsNullOrWhiteSpace(TbSearch.Text) == false)
            {
                productList = productList = productList.Where(p => p.ProductManufacturer == CbManufacturer.Text).ToList();
                productList = productList.Where(p => p.ProductName.Contains(TbSearch.Text) ||
                                                        p.ProductDescription.Contains(TbSearch.Text) || p.ProductCategory.Contains(TbSearch.Text)).ToList();
            }

            DgProduct.ItemsSource = productList;

        }
        private void TbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            FilterProducts();
        }

        private void CbManufacturer_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            FilterProducts();
        }

        private void BtnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            FrameManager.MainFrame.Navigate(new ManageProductPage(new Product(), DgProduct));
        }


        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            BaseModel.GetContext().Products.Remove((Product)DgProduct.SelectedItem);
            DgProduct.ItemsSource = BaseModel.GetContext().Products.ToList();
            BaseModel.GetContext().SaveChanges();
        }

        private void DgProduct_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (UserId == 1)
                FrameManager.MainFrame.Navigate(new ManageProductPage((Product)DgProduct.SelectedItem, DgProduct));
        }
    }
}
