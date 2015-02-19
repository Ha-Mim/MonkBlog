using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MonkBlog.Models;

namespace MonkBlog.Controllers
{
    public class HomeController : Controller
    {
        BlogDbContext _context = new BlogDbContext();
        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.recent = _context.Articles.OrderByDescending(c => c.ArticleId).Take(5).ToList();
            ViewBag.mostviewed = _context.Articles.OrderByDescending(c => c.NoOfView).Take(5).ToList();
            var articles = _context.Articles.OrderByDescending(a => a.ArticleId).Include(u => u.User).ToList();
            for (int i = 0; i < articles.Count; i++)
            {
                articles[i].Description = articles[i].Description.Take(100)
                    .Aggregate("", (current, ch) => current + ch);
            }

            return View(articles);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(string search)
        {

            if (search != null)
            {
                var article1 = _context.Articles.Where(x => x.Description.ToLower().Contains(search.ToLower()) || x.Title.ToLower().Contains(search.ToLower())).ToList();

                return View(article1);
            }

            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpGet]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
              
                return View("Index");
            }
            Article article = _context.Articles.Find(id);
            if (article == null)
            {
                return HttpNotFound();
            }
            article.NoOfView++;
            _context.Entry(article).State = EntityState.Modified;
            _context.SaveChanges();
            return View(article);
        }

        [HttpPost]
        public ActionResult Details(string comment, int id)
        {
            //if (id == null)
            //{
            //    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            //}
            Article article = _context.Articles.Find(id);
            //if (article == null)
            //{
            //    return HttpNotFound();
            //}
              
            Comment newComment = new Comment();

            newComment.UserId = Convert.ToInt32(Session["userid"]);
            newComment.Description = comment;
            newComment.ArticleId = id;
            newComment.CommentDate = DateTime.Now;
            _context.Comments.Add(newComment);
            _context.SaveChanges();

            var allPosts = _context.Articles;
            foreach (var post in allPosts)
            {
                post.User = _context.Users.Find(post.UserId);
                post.Comments = _context.Comments.Where(x => x.ArticleId == post.ArticleId).ToList();
                foreach (var showComment in post.Comments)
                {
                    showComment.User = _context.Users.Find(showComment.UserId);
                }
            }

            ViewBag.Result = "Comment Added";
            return View(_context.Articles.Find(id));
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Search(string search)
        {
            if (search != null)
            {
                var article1 = _context.Articles.Where(x => x.Description.ToLower().Contains(search.ToLower()) || x.Title.ToLower().Contains(search.ToLower())).ToList();

                return View(article1);
            }

            else
            {
                @ViewBag.Error = "Not Found";
                return View("Index");
            }

        }
     
        

        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {
            return View();
        }
    }
}