namespace ValidationService.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Card")]
    public partial class Card
    {
        public Guid Id { get; set; }

        public long Number { get; set; }

        [Column(TypeName = "date")]
        public DateTime ExpiryDate { get; set; }

        [Required]
        [StringLength(7)]
        public string CardType { get; set; }
    }
}
