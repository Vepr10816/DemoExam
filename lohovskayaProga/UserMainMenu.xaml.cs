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
    /// Логика взаимодействия для UserMainMenu.xaml
    /// </summary>
    public partial class UserMainMenu : Window
    {
        public UserMainMenu(User _currentUser)
        {
            InitializeComponent();
            lbHello.Content = lbHello.Content.ToString().Replace("Aboba", _currentUser.FirstName);
            DGridSession.ItemsSource = Session1_05Entities.GetContext().Trackings.ToList().Where(tracking => tracking.UsersID == _currentUser.ID).ToList();
            lbNumCrashes.Content += " " + Session1_05Entities.GetContext().Trackings.ToList().Where(tracking => tracking.LogoutTime == null).ToList().Count.ToString();
            DateTime timeSpent = DateTime.MinValue;
            foreach(Tracking item in Session1_05Entities.GetContext().Trackings.ToList())
            {
                if(DateTime.Now.Subtract(item.Date).Days <=30)
                {
                    timeSpent += Convert.ToDateTime(item.TimeSpentOnSystem).TimeOfDay;
                }
            }
            lbTimeSpent.Content += " " + timeSpent.TimeOfDay.ToString().Substring(0, 5);
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            LoginWindow loginWindow = new LoginWindow();
            loginWindow.Show();
            this.Close();
        }
    }
}
