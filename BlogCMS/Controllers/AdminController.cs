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
        public ActionResult Index()
        {
            var repo = new BlogPostRepo();
            var list = repo.GetAllBlogPosts();

            return View(list);
        }
    }
}