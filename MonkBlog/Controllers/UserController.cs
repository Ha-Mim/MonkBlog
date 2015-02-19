using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MonkBlog.Migrations;
using MonkBlog.Models;

namespace MonkBlog.Controllers
{
    public class UserController : Controller
    {
        private BlogDbContext _context = new BlogDbContext();
        public ActionResult Register()
        {
            return View();
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(User users)
        {
            if (ModelState.IsValid)
            {
                var userlist = _context.Users;
                if (userlist.FirstOrDefault(x => x.Email == users.Email) == null)
                {
                    using (_context)
                    {
                        _context.Users.Add(users);
                        _context.SaveChanges();
                        ModelState.Clear();
                        users = null;
                        ViewBag.Message = "Succesfully Done";
                    }
                }
                else
                {
                    ViewBag.Error = "Email must be unique";
                    return View();
                }
            }
            return View(users);
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string password)
        {

            if (ModelState.IsValid)
            {
                using (_context)
                {
                    var v = _context.Users.FirstOrDefault(a => a.Email.Equals(email) && a.Password.Equals(password));
                    if (v != null)
                    {
                        Session["userid"] = v.Id;
                        Session["name"] = v.GetFullName();
                        return RedirectToAction("Index", "Admin");
                    }
                    else
                    {
                        ViewBag.Error = "Invalid Email or Passward";
                        return View();
                    }
                }
            }
            return View();
        }
	}
}