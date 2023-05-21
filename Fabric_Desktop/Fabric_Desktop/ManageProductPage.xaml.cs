using Microsoft.Win32;
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
    /// Логика взаимодействия для ManageProductPage.xaml
    /// </summary>
    public partial class ManageProductPage : Page
    {
        private static string _imgPath = "";

        private Product _currentProduct;
        private ProductPage _productPage;
        public ManageProductPage(Product product, ProductPage productPage)
        {
            InitializeComponent();
            _currentProduct = product;
            rtfDescription.AppendText(_currentProduct.ProductDescription);
            DataContext = _currentProduct;
            BtnManageProduct.Content = "Редактировать";
            _productPage = productPage;
        }

        public ManageProductPage(ProductPage productPage)
        {
            InitializeComponent();
            _currentProduct = new Product();
            BtnManageProduct.Content = "Добавить";
            _productPage = productPage;
            DataContext = _currentProduct;
        }
        private void ImgProduct_MouseDown(object sender, MouseButtonEventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog()
            {
                Filter = "Image Files| *.jpg; *.jpeg; *.png"
            };
            dialog.Title = "Choose backup file";
            if (dialog.ShowDialog() == true)
            {
                imgProduct.Source = new BitmapImage(new Uri(dialog.FileName));
                _imgPath = dialog.SafeFileName;
            }
        }

        private bool CheckTextBox(List<TextBox> textBoxList)
        {
            if (textBoxList.Where(p => string.IsNullOrEmpty(p.Text) == true).ToList().Count() > 0)
            {
                MessageBox.Show("Все данные должны быть заполнены");
                return false;
            }
            return true;
        }

        private void BtnManageProduct_Click(object sender, RoutedEventArgs e)
        {
            if (CheckTextBox(new List<TextBox> { tbArticleProduct, tbCategory, tbCoast, tbManufacturer, tbName, tbQuantyty }) == false)
            {
                MessageBox.Show("Все поля обязательны к заполнению!!!!!!!!!!!!!!!!!");
                return;
            }
            try
            {
                _currentProduct.ProductDescription = new TextRange(rtfDescription.Document.ContentStart, rtfDescription.Document.ContentEnd).Text;
                if (TradeEntities.GetContext().Product.ToList().Where(p => p == _currentProduct).ToList().Count == 0)
                    TradeEntities.GetContext().Product.Add(_currentProduct);
                TradeEntities.GetContext().SaveChanges();
                _productPage.UpdateDataGrid(TradeEntities.GetContext().Product.ToList());
                FrameManager.MainFrame.GoBack();

            }
            catch(Exception ex)
            {
                MessageBox.Show("Неверный тип данных\n" + ex.ToString());
            }

        }
    }
}
