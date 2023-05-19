using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Piter_Retail_Central_Server.Entities;
using Piter_Retail_Central_Server.Models;

namespace Piter_Retail_Central_Server.Controllers
{
    public class StationsController : ApiController
    {
        private Piter_Retail_DBEntities db = new Piter_Retail_DBEntities();

        // GET: api/Stations
        [ResponseType(typeof(List<ResponseStation>))]
        public IHttpActionResult GetStations()
        {
            return Ok(db.Stations.ToList().ConvertAll(p => new ResponseStation(p)));
        }

        [Route("api/stations")]
        public IHttpActionResult GetStationsFuel(string fuel)
        {
            List<Station> stationsList = db.Stations.ToList();
            List<ResponseStationFuel> response = new List<ResponseStationFuel>();
            foreach (var station in stationsList)
            {
                foreach(var data in station.Data)
                {
                    if (data.Name == fuel)
                    {
                        response.Add(new ResponseStationFuel
                        {
                            ID_Station = station.ID_Station,
                            Address = data.Station.Address,
                            Price = data.Price
                        });
                    }
                }
            }
            return Ok(response);
        }

        [Route("api/getStationInfo")]
        public IHttpActionResult GetStationInfo(int id)
        {
            return Ok(db.Stations.ToList().Where(p => p.ID_Station == id).FirstOrDefault());
        }


        // PUT: api/Stations/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutStation(int id, Station station)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != station.ID_Station)
            {
                return BadRequest();
            }

            db.Entry(station).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StationExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // GET: api/Stations/5
        [ResponseType(typeof(Station))]
        [Route("api/GetStation/{id}", Name = "GetStationById")]
        public IHttpActionResult GetStation(int id)
        {
            Station station = db.Stations.Find(id);
            if (station == null)
            {
                return NotFound();
            }

            return Ok(station);
        }

        // POST: api/Stations
        [Route("api/setStation")]
        [ResponseType(typeof(Station))]
        public IHttpActionResult PostStation(Station station)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var existingStation = db.Stations.FirstOrDefault(p => p.ID_Station == station.ID_Station);
            if (existingStation != null)
            {
                existingStation.Address = station.Address;
                var existingData = existingStation.Data.ToList();
                var data = station.Data.ToList();
                for(int i=0;i<existingData.Count();i++)
                {
                    existingData[i].AmountOfFuel = data[i].AmountOfFuel;
                    existingData[i].Price = data[i].Price;
                }
            }
            else
            {
                db.Stations.Add(station);
            }

            try
            {
                db.SaveChanges();
            }
            catch
            {
                return BadRequest("Некорректный ввод данных");
            }

            return CreatedAtRoute("GetStationById", new { id = station.ID_Station }, station);
        }

        // DELETE: api/Stations/5
        [ResponseType(typeof(Station))]
        public IHttpActionResult DeleteStation(int id)
        {
            Station station = db.Stations.Find(id);
            if (station == null)
            {
                return NotFound();
            }

            db.Stations.Remove(station);
            db.SaveChanges();

            return Ok(station);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool StationExists(int id)
        {
            return db.Stations.Count(e => e.ID_Station == id) > 0;
        }
    }
}