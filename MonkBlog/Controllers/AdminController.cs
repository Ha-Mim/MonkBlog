using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MonkBlog.Models;

namespace MonkBlog.Controllers
{
    public class AdminController : Controller
    {
        private BlogDbContext db = new BlogDbContext();

        // GET: /Admin/
        public ActionResult Index()
        {
            int id=Convert.ToInt32(Session["userid"]);
            var articles = db.Articles.Include(a => a.User);
            var specificArticle = articles.Where(a => a.UserId == id).ToList();
            for (int i = 0; i < specificArticle.Count; i++)
            {
                specificArticle[i].Description = specificArticle[i].Description.Take(100)
                    .Aggregate("", (current, ch) => current + ch);
            }

            return View(specificArticle);
        }

        // GET: /Admin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return View("Index");
            }
            Article article = db.Articles.Find(id);
            if (article == null)
            {
                return HttpNotFound();
            }
           
            return View(article);
        }
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Details (int id)
        //{

        //}
        // GET: /Admin/Create
        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.Users, "Id", "Username");
            return View();
        }

        // POST: /Admin/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Save(FormCollection formcollection)
        {
            if (ModelState.IsValid)
            {
                Article anArticle = new Article();
                anArticle.Imagepath = formcollection["imagepath"];
                anArticle.Title = formcollection["Title"];
                anArticle.Description = Server.HtmlDecode(formcollection["description"]);
                anArticle.UserId = Convert.ToInt32(Session["userid"]);
                anArticle.PostedDate = DateTime.Now;
                anArticle.IsPublished = Convert.ToBoolean(formcollection["IsPublished"]) ;
                anArticle.NoOfView = 0;
                db.Articles.Add(anArticle);
                db.SaveChanges();
                ViewBag.Message = "Successfully Saved";
                return RedirectToAction("Index");

            }

            //ViewBag.UserId = new SelectList(db.Users, "Id", "Username", anArticle.UserId);
            return View("Index");
        }

        // GET: /Admin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Article article = db.Articles.Find(id);
            if (article == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserId = new SelectList(db.Users, "Id", "Username", article.UserId);
            return View(article);
        }

        // POST: /Admin/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ArticleId,Title,Description,PostedDate,UserId,IsPublished,NoOfView")] Article article)
        {
            if (ModelState.IsValid)
            {
                db.Entry(article).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(db.Users, "Id", "Username", article.UserId);
            return View(article);
        }

        // GET: /Admin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Article article = db.Articles.Find(id);
            if (article == null)
            {
                return HttpNotFound();
            }
            return View(article);
        }

        // POST: /Admin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Article article = db.Articles.Find(id);
            db.Articles.Remove(article);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        
        public ActionResult Logout()
        {
            Session["userid"] = null;
            return RedirectToAction("Login", "User");
        }

        

    }
}
