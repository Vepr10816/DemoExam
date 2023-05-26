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

namespace DemoExam2023
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            LstBooks.ItemsSource =  BaseModel.GetContext().Books.ToList();
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            BaseModel.GetContext().Books.Remove((Book)LstBooks.SelectedItem);
            BaseModel.GetContext().SaveChanges();
            LstBooks.ItemsSource = BaseModel.GetContext().Books.ToList();
        }

        private void MenuItem_Click_1(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("не Добавлен в корзину");
        }

        private void BtnAddBook_Click(object sender, RoutedEventArgs e)
        {
            ManageBookWindow manageBookWindow = new ManageBookWindow(new Book());
            manageBookWindow.Show();
            this.Close();
        }

        private void LstBooks_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            ManageBookWindow manageBookWindow = new ManageBookWindow((Book)LstBooks.SelectedItem);
            manageBookWindow.Show();
            this.Close();
        }
    }
}
