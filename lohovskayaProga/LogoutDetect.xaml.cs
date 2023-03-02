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
    /// Логика взаимодействия для LogoutDetect.xaml
    /// </summary>
    public partial class LogoutDetect : Window
    {
        string error = "";
        int id = 1;
        public LogoutDetect(string errorMessage, string errorType)
        {
            InitializeComponent();
            error = errorMessage;
            lbError.Content += $"{SessionDataStorage.loginDate.Date.ToString().Substring(0,10).Replace(".","/")} at {SessionDataStorage.loginDate.TimeOfDay.ToString().Substring(0, 5)}";
            rtbError.AppendText(errorMessage);
            if (errorType.Contains("System"))
            {
                rbSystem.IsChecked = true;
                id = 2;
            }
            else
                rbSoftware.IsChecked = true;
        }

        private void ConfirmButton_Click(object sender, RoutedEventArgs e)
        {
            Tracking _currentTracking = new Tracking();
            _currentTracking.Date = SessionDataStorage.loginDate;
            _currentTracking.LoginTime = SessionDataStorage.loginDate.TimeOfDay.ToString().Substring(0, 5);
            _currentTracking.UsersID = SessionDataStorage.userID;
            _currentTracking.CrahTypeID = id;
            _currentTracking.UnsuccessfulLogoutReason = error;
            if (_currentTracking.ID == 0)
                Session1_05Entities.GetContext().Trackings.Add(_currentTracking);
            try
            {
                Session1_05Entities.GetContext().SaveChanges();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
            this.Close();
        }
    }
}
