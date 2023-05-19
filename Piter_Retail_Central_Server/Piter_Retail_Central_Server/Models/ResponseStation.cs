using Piter_Retail_Central_Server.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Piter_Retail_Central_Server.Models
{
    public class ResponseStation
    {
        public ResponseStation(Station station)
        {
            ID_Station = station.ID_Station;

            Address = station.Address;
        }

        public int ID_Station { get; set; }
        public string Address { get; set; }
    }
}