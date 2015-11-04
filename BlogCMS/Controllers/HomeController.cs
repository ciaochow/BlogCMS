using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BlogCMS.Data;
using BlogCMS.Model;

namespace BlogCMS.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Test()
        {
            // request by Matt
            BlogPostRepo repo = new BlogPostRepo();
            var blogs = repo.GetAllBlogPosts();

            return View();
        }
    }
}