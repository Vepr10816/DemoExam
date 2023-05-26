namespace DemoExam2023
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Book
    {
        [Key]
        public int IDBook { get; set; }

        [Required]
        public string BookName { get; set; }

        [Required]
        public string BookDescription { get; set; }

        public int BookPagesQuantity { get; set; }

        public int AuthourID { get; set; }

        public virtual Author Author { get; set; }
    }
}
