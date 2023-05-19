using Piter_Retail_Central_Server.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Piter_Retail_Central_Server.Models
{
    public class ResponseDatum
    {
        public ResponseDatum(Datum datum)
        {
            ID_Data = datum.ID_Data;

            Name = datum.Name;

            Price = datum.Price;

            AmountOfFuel = datum.AmountOfFuel;

            Station_ID = datum.Station_ID;
        }

        public int ID_Data { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public long AmountOfFuel { get; set; }
        public int Station_ID { get; set; }
    }
}