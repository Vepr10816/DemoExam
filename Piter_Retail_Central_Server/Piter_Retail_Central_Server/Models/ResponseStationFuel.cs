using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Piter_Retail_Central_Server.Models
{
    public class ResponseStationFuel
    {
        public int ID_Station { get; set; }
        public string Address { get; set; }
        public decimal Price { get; set; }
    }
}