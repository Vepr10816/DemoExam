using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DemoExam2023
{
    public partial class BaseModel : DbContext
    {
        private static BaseModel _context;
        public BaseModel()
            : base("name=BaseModel")
        {
        }

        public static BaseModel GetContext()
        {
            if (_context == null)
                _context = new BaseModel();
            return _context;
        }

        public virtual DbSet<Author> Authors { get; set; }
        public virtual DbSet<Book> Books { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Author>()
                .HasMany(e => e.Books)
                .WithRequired(e => e.Author)
                .HasForeignKey(e => e.AuthourID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.Users)
                .WithRequired(e => e.Role)
                .HasForeignKey(e => e.RoleID)
                .WillCascadeOnDelete(false);
        }
    }
}
