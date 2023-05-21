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
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            FrameManager.MainFrame = MainFrame;
            MainFrame.Navigate(new Authorization());
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            if(FrameManager.MainFrame.CanGoBack)
                FrameManager.MainFrame.GoBack();
        }

        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {
            if (((Page)MainFrame.Content).Title.ToString() == "Authorization")
            {
                PageName.Content = "Авторизация";
                BtnBack.Visibility = Visibility.Hidden;
            }
            if (((Page)MainFrame.Content).Title.ToString() == "ProductPage")
            {
                PageName.Content = "Каталог";
                BtnBack.Content = "Выйти";
                BtnBack.Visibility = Visibility.Visible;
            }
            if (((Page)MainFrame.Content).Title.ToString() == "ManageProductPage")
            {
                PageName.Content = "Менеджмент товаров";
                BtnBack.Content = "Назад";
            }
        }
    }
}
