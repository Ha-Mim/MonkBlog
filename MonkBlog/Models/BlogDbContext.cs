using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Web;

namespace MonkBlog.Models
{
    public class BlogDbContext:DbContext
    {
        public BlogDbContext() : base("blogDb")
        {
            
        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Article>()
                .HasRequired(c => c.User)
                .WithMany(c => c.Articles)
                .HasForeignKey(c => c.UserId)
                .WillCascadeOnDelete(false);
           
        }
        public DbSet<User> Users { set; get; }
        public DbSet<Article> Articles { set; get; }
        public DbSet<Comment> Comments { set; get; } 

    }
}