using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace MonkBlog.Models
{
    public class Comment
    {
        public int CommentId { get; set; }
        [Required(ErrorMessage = "Please provide Description", AllowEmptyStrings = false)]
        [Display(Name = "Description")]
        [AllowHtml]
        public string Description { get; set; }
        public DateTime CommentDate { get; set; }
        public int ArticleId { get; set; }
        public int UserId { get; set; }


        public virtual Article Articles { get; set; }
        public virtual User User { get; set; }
    }
}