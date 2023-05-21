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
        Authorization _authorization;
        bool canClose = false;
        public CaphaWindow(Authorization authorization)
        {
            InitializeComponent();
            _authorization = authorization;
            LoadCapha();
        }

        public void LoadCapha()
        {
            string capchaLetters = "qwertyuiopasdfghjklzxcvbnm1234567890";
            char[] array = capchaLetters.ToCharArray();
            Random random = new Random();
            tblFirstLetter.Text = array[random.Next(0, capchaLetters.Count())].ToString();
            tblSecondLetter.Text = array[random.Next(0, capchaLetters.Count())].ToString();
            tblThirdLetter.Text = array[random.Next(0, capchaLetters.Count())].ToString();
            tblFourthLetter.Text = array[random.Next(0, capchaLetters.Count())].ToString();
        }

        private void BtnSignIn_Click(object sender, RoutedEventArgs e)
        {
            if (tbCapha.Text == tblFirstLetter.Text + tblSecondLetter.Text + tblThirdLetter.Text + tblFourthLetter.Text)
            {
                _authorization.IsEnabled = true;
                canClose = true;
                this.Close();
            }
            else
            {
                MessageBox.Show("Неверный ввод");
                LoadCapha();
            }
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if(canClose == false)
                e.Cancel = true;
        }
    }
}
