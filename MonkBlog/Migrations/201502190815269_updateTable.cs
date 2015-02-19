namespace MonkBlog.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updateTable : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Articles", "Title", c => c.String(nullable: false));
            AlterColumn("dbo.Articles", "Description", c => c.String(nullable: false));
            AlterColumn("dbo.Comments", "Description", c => c.String(nullable: false));
            DropColumn("dbo.Users", "ConfirmPassword");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Users", "ConfirmPassword", c => c.String());
            AlterColumn("dbo.Comments", "Description", c => c.String());
            AlterColumn("dbo.Articles", "Description", c => c.String());
            AlterColumn("dbo.Articles", "Title", c => c.String());
        }
    }
}
