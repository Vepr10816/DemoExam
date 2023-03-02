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

namespace lohovskayaProga
{
    /// <summary>
    /// Логика взаимодействия для EditRole.xaml
    /// </summary>
    public partial class EditRole : Window
    {
        User user = new User();
        public EditRole(User _currentUser)
        {
            InitializeComponent();
            cbOffice.ItemsSource = Session1_05Entities.GetContext().Offices.ToList();
            DataContext = _currentUser;
            user = _currentUser;
            if (_currentUser.RoleID == 2)
                rbUser.IsChecked = true;
            else
                rbAdmin.IsChecked = true;
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            AdminMainMenu adminMainMenu = new AdminMainMenu();
            adminMainMenu.Show();
            this.Close();
        }

        private void ApplyButton_Click(object sender, RoutedEventArgs e)
        {
            if (rbUser.IsChecked == true)
                user.RoleID = 2;
            else
                user.RoleID = 1;
            try
            {
                Session1_05Entities.GetContext().SaveChanges();
                MessageBox.Show("Successfull");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
