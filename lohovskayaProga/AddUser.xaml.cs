using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
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

namespace lohovskayaProga
{
    /// <summary>
    /// Логика взаимодействия для AddUser.xaml
    /// </summary>
    public partial class AddUser : Window
    {
        private User _currentUser = new User();
        public AddUser()
        {
            InitializeComponent();
            cbOffice.ItemsSource = Session1_05Entities.GetContext().Offices.ToList();
            DataContext = _currentUser;
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            AdminMainMenu adminMainMenu = new AdminMainMenu();
            adminMainMenu.Show();
            this.Close();
        }

        public string GetHash(string input)
        {
            var md5 = MD5.Create();
            var hash = md5.ComputeHash(Encoding.UTF8.GetBytes(input));

            return Convert.ToBase64String(hash);
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_currentUser.FirstName) || string.IsNullOrWhiteSpace(_currentUser.LastName)
                || string.IsNullOrWhiteSpace(_currentUser.Email) || string.IsNullOrWhiteSpace(_currentUser.Password))
                errors.AppendLine("Name, Last name, Password must not be null");
            if (_currentUser.Office == null)
                errors.AppendLine("Choose Office");
            if (errors.Length > 0)
                MessageBox.Show(errors.ToString());
            _currentUser.Password = GetHash(_currentUser.Password);
            _currentUser.RoleID = 2;
            _currentUser.Active = true;

            if (_currentUser.ID == 0)
                Session1_05Entities.GetContext().Users.Add(_currentUser);
            try
            {
                Session1_05Entities.GetContext().SaveChanges();
                MessageBox.Show("Successfull");
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
