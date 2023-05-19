using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Piter_Retail_Gas_Station.Model
{

    public class Datum
    {
        public int ID_Data { get; set; }
        public string Name { get; set; }
        public double Price { get; set; }
        public int AmountOfFuel { get; set; }
        public int Station_ID { get; set; }
    }
}
