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

namespace Fabric_Desktop
{
    /// <summary>
    /// Логика взаимодействия для CaphaWindow.xaml
    /// </summary>
    public partial class CaphaWindow : Window
    {
        AuthorizationPage Authorization { get; }
        bool canClose = false;
        public CaphaWindow(AuthorizationPage authorization)
        {
            InitializeComponent();
            Authorization = authorization;
            GenerateCapha();
        }

        private void GenerateCapha()
        {
            string lettersCapha = "1234567890qwertyuiopasdfghjklzxcvbnm";
            char[] capchaArray = lettersCapha.ToCharArray();
            Random rnd = new Random();
            TbOne.Text = capchaArray[rnd.Next(0, capchaArray.Count())].ToString();
            TbTwo.Text = capchaArray[rnd.Next(0, capchaArray.Count())].ToString();
            TbThree.Text = capchaArray[rnd.Next(0, capchaArray.Count())].ToString();
            TbFour.Text = capchaArray[rnd.Next(0, capchaArray.Count())].ToString();
        }
        private void BtnCheckCapha_Click(object sender, RoutedEventArgs e)
        {
            if (TbUserCapcha.Text == $@"{TbOne.Text}{TbTwo.Text}{TbThree.Text}{TbFour.Text}")
            {
                Authorization.IsEnabled = true;
                canClose = true;
                this.Close();
            }
            else
            {
                MessageBox.Show("Неверный ввод");
                GenerateCapha();
            }
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (canClose == false)
                e.Cancel = true;
        }
    }
}
