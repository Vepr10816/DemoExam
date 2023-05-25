using Fabric_Desktop.Utilities;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.IO;
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
        private Product Product { get; }
        private DataGrid DataGrid { get; }

        private string PhotoPath { get; set; }
        private string PhotoName { get; set; }
        public ManageProductPage(Product product, DataGrid dataGrid)
        {
            InitializeComponent();
            Product = product;
            DataGrid = dataGrid;
            DataContext = Product;
        }

        private void ImgProduct_MouseDown(object sender, MouseButtonEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog()
            {
                Filter = "Image Files| *.jpg; *.jpeg; *.png"
            };
            openFileDialog.Title = "Загрузите фотографию товара";
            if(openFileDialog.ShowDialog() == true)
            {
                ImgProduct.Source = new BitmapImage(new Uri(openFileDialog.FileName));
                Product.ProductPhoto = openFileDialog.SafeFileName;
                PhotoPath = openFileDialog.FileName;
                PhotoName = openFileDialog.SafeFileName;
            }

        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if(CheckTextboxes(new List<TextBox>() { TbArticle, TbCategory, TbDescription, TbManufacturer, TbProductName, TbQuantity, TbСost}) == false)
            {
                MessageBox.Show("Все поля должны быть заполнены!");
                return;
            }
            if (BaseModel.GetContext().Products.Where(p => p.ProductArticleNumber == Product.ProductArticleNumber).ToList().Count() == 0)
                BaseModel.GetContext().Products.Add(Product);
            try
            {
                BaseModel.GetContext().SaveChanges();
                if(PhotoPath != null)
                    File.Copy(PhotoPath, Directory.GetParent(Directory.GetParent(Environment.CurrentDirectory).ToString()) + $@"\Resources\{PhotoName}");
                DataGrid.ItemsSource = BaseModel.GetContext().Products.ToList();
                FrameManager.MainFrame.GoBack();
            }
            catch(Exception ex)
            {
                MessageBox.Show("Ошибка ввода данных\n" + ex);
            }
        }

        private bool CheckTextboxes(List<TextBox> textBoxes)
        {
            foreach(TextBox textBox in textBoxes)
            {
                if (string.IsNullOrWhiteSpace(textBox.Text))
                    return false;
            }
            return true;
        }
    }
}
