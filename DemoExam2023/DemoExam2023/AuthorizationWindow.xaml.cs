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
    /// Логика взаимодействия для AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        public AuthorizationWindow()
        {
            InitializeComponent();
        }

        private void BtnAuth_Click(object sender, RoutedEventArgs e)
        {
            if(string.IsNullOrWhiteSpace(TbLogin.Text) || string.IsNullOrWhiteSpace(TbPassword.Text))
            {
                MessageBox.Show("Поля должны быть заполнены");
                return;
            }

            if (!int.TryParse(TbPassword.Text, out _))
            {
                MessageBox.Show("Должны быть введены цифры");
                return;
            }
            
            User user = BaseModel.GetContext().Users.Where(p => p.Login == TbLogin.Text && p.Password == TbPassword.Text).FirstOrDefault();
            if (user == null)
                MessageBox.Show("Неверный логин или пароль");
            else
            {
                MessageBox.Show(user.Role.RoleName);
                if (user.RoleID == 1)
                    new MainWindow().Show();
                else
                    new ManageBookWindow(new Book()).Show();
                this.Close();
            }
        }
    }
}
