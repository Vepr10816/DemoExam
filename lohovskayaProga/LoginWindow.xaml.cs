using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace lohovskayaProga
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        
        }
        int timer=10;
        private int numAttempts = 0;

        private async void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            User _currentUser = new User();
            try
            {
                _currentUser = Session1_05Entities.GetContext().Users.ToList().Where(user => user.Email.Equals(UsernameTB.Text)
                && user.Password.Equals(PasswordTB.Password)).ToList()[0];
                if (_currentUser.RoleID == 1)
                {
                    AdminMainMenu adminMainMenu = new AdminMainMenu();
                    adminMainMenu.Show();
                    this.Close();
                }
                else
                {
                    SessionDataStorage.loginDate = DateTime.Now;
                    SessionDataStorage.userID = _currentUser.ID;
                    //int a = 0;
                    //DateTime b = Convert.ToDateTime(a);
                    UserMainMenu userMainMenu = new UserMainMenu(_currentUser);
                    userMainMenu.Show();
                    this.Close();
                }
            }
            catch
            {
                //int a = 0;
                //DateTime b = Convert.ToDateTime(a);
                numAttempts++;
                if (numAttempts > 3)
                {
                    LoginButton.IsEnabled = false;
                    await Timer_Tick();
                }
                timer = 10;
            }
        }
     
        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Environment.Exit(0);
        }
        async Task Timer_Tick()
        {
            while (timer!=0)
            {
                ErrorLabel.Dispatcher.Invoke(() =>
                {
                    ErrorLabel.Content = $"До следующей попытки входа: {timer--}";
                });
                await Task.Delay(1000);
            }
            ErrorLabel.Content = "";
            LoginButton.IsEnabled = true;
        }

        
    }
}
