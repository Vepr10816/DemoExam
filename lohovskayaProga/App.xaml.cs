using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Threading;

namespace lohovskayaProga
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        private void Application_Exit(object sender, ExitEventArgs e)
        {
            Tracking _currentTracking = new Tracking();
            _currentTracking.Date = SessionDataStorage.loginDate;
            _currentTracking.LoginTime = SessionDataStorage.loginDate.TimeOfDay.ToString().Substring(0, 5);
            _currentTracking.LogoutTime = DateTime.Now.TimeOfDay.ToString().Substring(0, 5);
            TimeSpan difference =DateTime.Now.TimeOfDay - SessionDataStorage.loginDate.TimeOfDay;
            _currentTracking.TimeSpentOnSystem = difference.ToString().Substring(0,5);
            _currentTracking.UsersID = SessionDataStorage.userID;
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

        }

        void App_DispatcherUnhandledException(object sender, DispatcherUnhandledExceptionEventArgs e)
        {
            LogoutDetect logoutDetect = new LogoutDetect(e.Exception.ToString(), e.Exception.GetType().ToString());
            logoutDetect.Show();
            e.Handled = true;
        }
    }
}
