namespace DemoExam2023
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        [Key]
        public int IDUser { get; set; }

        [Required]
        public string Login { get; set; }

        [Required]
        public string Password { get; set; }

        public int RoleID { get; set; }

        public virtual Role Role { get; set; }
    }
}
