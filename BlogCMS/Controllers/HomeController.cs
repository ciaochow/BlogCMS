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
        BlogPostRepo repo = new BlogPostRepo();

        public ActionResult Index()
        {
            //BlogPostRepo repo = new BlogPostRepo();
            var blogs = repo.GetAllPublishedBlogPosts();
            return View(blogs);
        }

        public ActionResult ListByCategory(string id)
        {
            int dummy;
            // teomporary solution to an unexplained error
            if (!int.TryParse(id, out dummy))
            {
                id = "1";
            }
            List<BlogPost> posts = repo.GetPostsByCategory(id);

            return View(posts);
        }

        public JsonResult GetCategoryName(string id)
        {
            CategoryRepo repo = new CategoryRepo();
            string category = repo.GetCategory(id);

            return Json(category, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ListByMonth(string id)
        {
            int dummy;
            // teomporary solution to an unexplained error
            if (!int.TryParse(id, out dummy))
            {
                id = "3";
            }
            List<BlogPost> posts = repo.GetPostsByMonth(id);

            return View(posts);
        }


        public ActionResult Test()
        {
            // request by Matt
            BlogPostRepo repo = new BlogPostRepo();
            var blogs = repo.GetAllBlogPosts();

            return View(blogs);
        }
    }
}