using Newtonsoft.Json;
using Piter_Retail_Gas_Station.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
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

namespace Piter_Retail_Gas_Station
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        static Station station = new Station{Data = new List<Datum>()};
        public static readonly String SvcIP = "http://localhost:55473/api/";

        public MainWindow()
        {
            InitializeComponent();
        }

        async void LoadStation(string id)
        {
            // make an API request 
            using (HttpClient client = new HttpClient())
            {
                ClearValues();
                try
                {
                    station = new Station();
                    HttpResponseMessage response = await client.GetAsync(SvcIP+$"getStationInfo?id={id}");
                    response.EnsureSuccessStatusCode();
                    station = await response.Content.ReadAsAsync<Station>();
                    rtb_address.AppendText(station.Address);
                    tb_idStation.Text = station.ID_Station.ToString();
                    foreach(var data in station.Data)
                    {
                        DataFilterGet(data);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message + "Ошибка");
                }
            }
        }

        async void SetStation()
        {
            // make an API request 
            using (HttpClient client = new HttpClient())
            {
                try
                {
                    HttpResponseMessage response = await client.PostAsJsonAsync(SvcIP + $"setStation", station);
                    response.EnsureSuccessStatusCode();
                    station = await response.Content.ReadAsAsync<Station>();
                    tb_idStation.Text = station.ID_Station.ToString();
                    MessageBox.Show("Успешное сохранение данных");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message + "Ошибка");
                }
            }
        }

        private void BtnSearch_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Convert.ToInt32(tb_idStation.Text);
            }
            catch
            {
                MessageBox.Show("Неверный формат ID");
                return;
            }
            LoadStation(tb_idStation.Text);
        }

        private void BtnNew_Click(object sender, RoutedEventArgs e)
        {
            station = new Station{ Data = new List<Datum>()};
            ClearValues();
        }

        public void ClearValues()
        {
            tb_amount92.Clear();
            tb_prise92.Clear();
            tb_amount98.Clear();
            tb_prise98.Clear();
            tb_amount95.Clear();
            tb_prise95.Clear();
            tb_amountDT.Clear();
            tb_priseDT.Clear();
            rtb_address.Document.Blocks.Clear();
            tb_idStation.Clear();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            TextRange textRange = new TextRange(
                rtb_address.Document.ContentStart,
                rtb_address.Document.ContentEnd
            );
            if (String.IsNullOrEmpty(tb_idStation.Text))
            {
                try
                {
                    station.Address = textRange.Text;
                    station.Data.Add(new Datum
                    {
                        Name = "92",
                        Price = Convert.ToDouble(tb_prise92.Text),
                        AmountOfFuel = Convert.ToInt32(tb_amount92.Text)
                    });
                    station.Data.Add(new Datum
                    {
                        Name = "95",
                        Price = Convert.ToDouble(tb_prise95.Text),
                        AmountOfFuel = Convert.ToInt32(tb_amount95.Text)
                    });
                    station.Data.Add(new Datum
                    {
                        Name = "98",
                        Price = Convert.ToDouble(tb_prise98.Text),
                        AmountOfFuel = Convert.ToInt32(tb_amount98.Text)
                    });
                    station.Data.Add(new Datum
                    {
                        Name = "Disel Fuel",
                        Price = Convert.ToDouble(tb_priseDT.Text),
                        AmountOfFuel = Convert.ToInt32(tb_amountDT.Text)
                    });
                }
                catch
                {
                    MessageBox.Show("Неверный формат данных");
                }
            }
            else
            {
                try
                {
                    Convert.ToInt32(tb_idStation.Text);
                }
                catch 
                {
                    MessageBox.Show("Неверный формат ID");
                    return;
                }
                station.ID_Station = Convert.ToInt32(tb_idStation.Text);
                station.Address = textRange.Text;
                foreach (var data in station.Data)
                {
                    DataFilterPost(data);
                }
            }
            SetStation();
        }

        public void DataFilterGet(Datum data)
        {

            if (data.Name.Contains("92"))
            {
                tb_amount92.Text = data.AmountOfFuel.ToString();
                tb_prise92.Text = data.Price.ToString();
            }
            if (data.Name.Contains("95"))
            {
                tb_amount95.Text = data.AmountOfFuel.ToString();
                tb_prise95.Text = data.Price.ToString();
            }
            if (data.Name.Contains("Disel Fuel"))
            {
                tb_amountDT.Text = data.AmountOfFuel.ToString();
                tb_priseDT.Text = data.Price.ToString();
            }
            if (data.Name.Contains("98"))
            {
                tb_amount98.Text = data.AmountOfFuel.ToString();
                tb_prise98.Text = data.Price.ToString();
            }
        }

        public void DataFilterPost(Datum data)
        {
            try
            {
                if (data.Name.Contains("92"))
                {
                    data.AmountOfFuel = Convert.ToInt32(tb_amount92.Text);
                    data.Price = Convert.ToDouble(tb_prise92.Text);
                }
                if (data.Name.Contains("95"))
                {
                    data.AmountOfFuel = Convert.ToInt32(tb_amount95.Text);
                    data.Price = Convert.ToDouble(tb_prise95.Text);
                }
                if (data.Name.Contains("Disel Fuel"))
                {
                    data.AmountOfFuel = Convert.ToInt32(tb_amountDT.Text);
                    data.Price = Convert.ToDouble(tb_priseDT.Text);
                }
                if (data.Name.Contains("98"))
                {
                    data.AmountOfFuel = Convert.ToInt32(tb_amount98.Text);
                    data.Price = Convert.ToDouble(tb_prise98.Text);
                }
            }
            catch
            {
                MessageBox.Show("Некорректный ввод данных");
            }
        }
    }
}
