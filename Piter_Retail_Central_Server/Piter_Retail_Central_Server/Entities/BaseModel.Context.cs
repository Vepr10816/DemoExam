﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Piter_Retail_Central_Server.Entities
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Piter_Retail_DBEntities : DbContext
    {
        public Piter_Retail_DBEntities()
            : base("name=Piter_Retail_DBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Datum> Data { get; set; }
        public virtual DbSet<Station> Stations { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
    }
}