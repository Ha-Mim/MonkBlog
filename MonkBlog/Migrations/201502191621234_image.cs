namespace MonkBlog.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class image : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Articles", "Imagepath", c => c.String(maxLength: 100));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Articles", "Imagepath");
        }
    }
}
