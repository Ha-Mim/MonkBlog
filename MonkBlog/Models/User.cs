using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MonkBlog.Models
{
    public class User
    {
        public int Id { set; get; }
        [Required(ErrorMessage = "Please provide a username", AllowEmptyStrings = false)]
        [Display(Name = "Username")]
        public string Username { set; get; }
        [Required(ErrorMessage = "Please provide a password", AllowEmptyStrings = false)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Password)]
        [Display(Name = "Password")]
        [StringLength(50, MinimumLength = 6, ErrorMessage = "Password Must be 6 char long")]
        public string Password { set; get; }
       
        [Required(ErrorMessage = "Please provide an email address", AllowEmptyStrings = false)]
        [RegularExpression("^[a-zA-Z0-9_\\.-]+@([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$", ErrorMessage = "Please provide a valid E-mail address")]
        [Display(Name = "E-mail")]
        public string Email { set; get; }
        [Required(ErrorMessage = "Please provide your first name", AllowEmptyStrings = false)]
        [Display(Name = "First Name")]
        public string FirstName { set; get; }
        [Required(ErrorMessage = "Please provide your last name", AllowEmptyStrings = false)]
        [Display(Name = "Last Name")]
        public string LastName { set; get; }

        public virtual ICollection<Article> Articles { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }

        public string GetFullName()
        {
            return FirstName + " " + LastName;
        }

    }
}