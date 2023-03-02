using System;
using System.Collections.Generic;
using System.Data;
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

namespace lohovskayaProga
{
    /// <summary>
    /// Логика взаимодействия для AdminMainMenu.xaml
    /// </summary>
    public partial class AdminMainMenu : Window
    {
        public AdminMainMenu()
        {
            InitializeComponent();
            UpdateWindow();
        }

        private void UpdateWindow()
        {
            List<User> users = Session1_05Entities.GetContext().Users.ToList();
            foreach (User item in users)
            {
                //int age = DateTime.Today.Year - item.Birthdate.Value.Year;
                //if (item.Birthdate.Value > DateTime.Today.AddYears(-age)) age--;
                //item.Age = age;
                int year = 365;
                if (DateTime.IsLeapYear(DateTime.Now.Year))
                    year = 366;
                item.Age = DateTime.Now.Subtract(item.Birthdate.Value).Days / year;
            }
            DGridUsers.ItemsSource = users;
            cbOffice.ItemsSource = Session1_05Entities.GetContext().Offices.ToList();
        }

        private void AddUserButton_Click(object sender, RoutedEventArgs e)
        {
            AddUser addUser = new AddUser();
            addUser.Show();
            this.Close();
        }

        private void ChangeRoleButton_Click(object sender, RoutedEventArgs e)
        {
            if(DGridUsers.SelectedIndex!=-1)
            {
                EditRole editRole = new EditRole((User)DGridUsers.SelectedItem);
                editRole.Show();
                this.Close();
            }
        }

        private void cbOffice_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            List<User> users = Session1_05Entities.GetContext().Users.ToList();
            DGridUsers.ItemsSource = users.Where(user => user.Office.Equals(cbOffice.SelectedItem)).ToList();
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.Show();
            this.Close();
        }

        private void btnUpd_Click(object sender, RoutedEventArgs e)
        {
            if (DGridUsers.SelectedIndex != -1)
            {
                User _currentUser = (User)DGridUsers.SelectedItem;
                _currentUser.Active = !_currentUser.Active;

                try
                {
                    Session1_05Entities.GetContext().SaveChanges();
                    UpdateWindow();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
    }
}
