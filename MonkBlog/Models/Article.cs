using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MonkBlog.Models
{
    public class Article
    {
        public int ArticleId { get; set; }
        [Required(ErrorMessage = "Please provide a Title", AllowEmptyStrings = false)]
        [Display(Name = "Title")]
        public string Title { get; set; }
        [Required(ErrorMessage = "Please provide Description", AllowEmptyStrings = false)]
        [Display(Name = "Description")]
        [AllowHtml]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }
        public System.DateTime PostedDate { get; set; }
        public int UserId { get; set; }
        
        [Display(Name = "Do you want to publish now ? ")]
        public bool IsPublished { get; set; }
        public int NoOfView { get; set; }
        [StringLength(100)]
        public string Imagepath { get; set; }

        public virtual ICollection<Comment> Comments { get; set; }
        public virtual User User { get; set; }
    }
}