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
using System.Windows.Shapes;

namespace DemoExam2023
{
    /// <summary>
    /// Логика взаимодействия для ManageBookWindow.xaml
    /// </summary>
    public partial class ManageBookWindow : Window
    {
        private Book Book { get; }
        public ManageBookWindow(Book book)
        {
            InitializeComponent();
            Book = book;
            DataContext = Book;
            CbAuthor.ItemsSource = BaseModel.GetContext().Authors.ToList();
            CbAuthor.SelectedItem = Book.Author;
            CbAuthor.DisplayMemberPath = "AthorLastName";
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (BaseModel.GetContext().Books.Where(x => x.IDBook == Book.IDBook).ToList().Count == 0)
                BaseModel.GetContext().Books.Add(Book);
            try
            {
                Book.Author = (Author)CbAuthor.SelectedItem;
                Book.AuthourID = ((Author)CbAuthor.SelectedItem).IDAuthor;
                BaseModel.GetContext().SaveChanges();
                MainWindow mainWindow = new MainWindow();
                mainWindow.Show();
                this.Close();
            }
            catch(Exception ex)
            {
                MessageBox.Show("Невернй тип даннх", ex.ToString());
            }

        }

        private void BtnCreatePDF_Click(object sender, RoutedEventArgs e)
        {
            PrintDialog printDialog = new PrintDialog();
            if (printDialog.ShowDialog() == true)
            {
                printDialog.PrintVisual(WrpPrintPanel, "Формирование талона");
            }
        }
    }
}
