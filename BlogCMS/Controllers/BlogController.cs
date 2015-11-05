using BlogCMS.Data;
using BlogCMS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BlogCMS.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Details(int id)
        {
            var repo = new BlogPostRepo();
            var post = repo.GetBlogPostById(id);

            return View(post);
        }

        public ActionResult Add()
        {

            //var repo = new BlogPostRepo();
            var post = new BlogPost();

            return View(post);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(BlogPost p)
        {
            var time = DateTime.Now;
            p.DatePosted = time.Date;
            var repo = new BlogPostRepo();
            repo.AddBlogPost(p);
            
            return View();
        }
    }
}