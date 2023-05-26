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
            Book.Author = (Author)CbAuthor.SelectedItem;
            Book.AuthourID = ((Author)CbAuthor.SelectedItem).IDAuthor;

            /*var books = BaseModel.GetContext().Books.Where(x => x.IDBook == Book.IDBook).ToList();
            int counter = 0;
            for(int i = 0; i < books.Count(); i++)
            {
                if (books[i].IDBook == Book.IDBook)
                    counter += 1;
            }
            if(counter > 0)
                BaseModel.GetContext().Books.Add(Book);*/


            if (BaseModel.GetContext().Books.Where(x => x.IDBook == Book.IDBook).ToList().Count == 0)
                BaseModel.GetContext().Books.Add(Book);
            try
            {
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
    }
}
