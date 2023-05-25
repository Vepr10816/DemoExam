using Fabric_Desktop.Utilities;
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
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MessageBox.Show(Directory.GetParent(Directory.GetParent(Environment.CurrentDirectory).ToString()) + $@"\Resources\123.png");
            FrameManager.MainFrame = MainFrame;
            MainFrame.Navigate(new ProductPage(1));
        }

        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {
            if(((Page)MainFrame.Content).Title.ToString() == "Авторизация")
            {
                BtnBack.Visibility = Visibility.Hidden;
                LbHeader.Content = "Авторизация";
            }

            if (((Page)MainFrame.Content).Title.ToString() == "ProductPage")
            {
                BtnBack.Visibility = Visibility.Visible;
                BtnBack.Content = "Выйти";
                LbHeader.Content = "Товары";
            }
            if (((Page)MainFrame.Content).Title.ToString() == "ManageProductPage")
            {
                BtnBack.Content = "Назад";
                LbHeader.Content = "Менеджмент товара";
            }
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            if (MainFrame.CanGoBack)
                MainFrame.GoBack();
        }
    }
}
