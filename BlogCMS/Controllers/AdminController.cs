using BlogCMS.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BlogCMS.Model;

namespace BlogCMS.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        [Authorize(Roles="Admin")]
        public ActionResult Index()
        {
            var repo = new BlogPostRepo();
            var list = repo.GetAllBlogPosts();

            return View(list);
        }

        [Authorize(Roles = "Admin")]
        public ActionResult Publish(int ID)
        {
            var repo = new BlogPostRepo();
            repo.PublishPost(ID);
            return RedirectToAction("Index");
        }

        [Authorize(Roles = "Admin")]
        public ActionResult Unpublish(int ID)
        {
            var repo = new BlogPostRepo();
            repo.UnpublishPost(ID);
            return RedirectToAction("Index");
        }

        public ActionResult Category()
        {
            return View();
        }
    }
}