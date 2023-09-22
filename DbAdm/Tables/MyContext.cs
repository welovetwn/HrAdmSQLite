using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DbAdm.Tables
{
    public partial class MyContext : DbContext
    {
        public MyContext()
        {
        }

        public MyContext(DbContextOptions<MyContext> options)
            : base(options)
        {
        }
        public virtual DbSet<Column> Column { get; set; }
        public virtual DbSet<Crud> Crud { get; set; }
        public virtual DbSet<CrudEitem> CrudEitem { get; set; }
        public virtual DbSet<CrudEtable> CrudEtable { get; set; }
        public virtual DbSet<CrudQitem> CrudQitem { get; set; }
        public virtual DbSet<CrudRitem> CrudRitem { get; set; }
        public virtual DbSet<Project> Project { get; set; }
        public virtual DbSet<Table> Table { get; set; }
        public virtual DbSet<XpCode> XpCode { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlite("Name=FunConfig:Db");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
