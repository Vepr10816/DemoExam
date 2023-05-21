using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Fabric_Desktop
{
    /// <summary>
    /// Логика взаимодействия для Authorization.xaml
    /// </summary>
    public partial class Authorization : Page
    {
        int _tryCounter = 0; 
        public Authorization()
        {
            InitializeComponent();
        }

        private void BtnSignIn_Click(object sender, RoutedEventArgs e)
        {
            if(_tryCounter >= 2)
            {
                MessageBox.Show("Повторная попытка входа возможна через 10 секнуд");
                Thread.Sleep(10000);
                _tryCounter = 0;
                return;
            }
            if (string.IsNullOrEmpty(tbLogin.Text.Replace(" ", "")) && string.IsNullOrEmpty(tbPassword.Text.Replace(" ", "")))
            {
                MessageBox.Show("Заполните все поля!");
                return;
            }
            User user = TradeEntities.GetContext().User.ToList().Where(p => p.UserLogin == tbLogin.Text && p.UserPassword == tbPassword.Text).FirstOrDefault();
            if(user != null)
            {
                FrameManager.MainFrame.Navigate(new ProductPage(user.UserRole));
            }
            else
            {
                _tryCounter +=1;
                CaphaWindow caphaWindow = new CaphaWindow(this);
                caphaWindow.Show();
                this.IsEnabled = false;
            }
        }
    }
}
