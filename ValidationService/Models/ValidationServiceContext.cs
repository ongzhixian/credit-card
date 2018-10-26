namespace ValidationService.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ValidationServiceContext : DbContext
    {
        public ValidationServiceContext()
            : base("name=ValidationServiceContext")
        {
        }

        public virtual DbSet<Card> Cards { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Card>()
                .Property(e => e.CardType)
                .IsUnicode(false);
        }
    }
}
