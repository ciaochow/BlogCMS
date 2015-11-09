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

        public ActionResult Edit(int BlogId)
        {
            var repo = new BlogPostRepo();
            var post = repo.GetBlogPostById(BlogId);

            return View(post);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(BlogPost post)
        {
            var repo = new BlogPostRepo();
            repo.EditBlogPost(post);

            return View();
        }

        public ActionResult Add()
        {
            CategoryRepo repo = new CategoryRepo();
            List<Category> categories = repo.GetAllCategories();

            AddPostVM vm = new AddPostVM();
            vm.CreateCategoryList(categories);

            return View(vm);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddBlog(AddPostVM vm)
        {
            var time = DateTime.Now;
            vm.BlogPost.DatePosted = time.Date;

            var repo = new BlogPostRepo();
            repo.AddBlogPost(vm.BlogPost);

            int blogId = repo.GetBlogId();
            repo.AddToArchieve(blogId);

            return RedirectToAction("Add");
        }

        //public ActionResult Add()
        //{

        //    var repo = new BlogPostRepo();
        //    var post = new BlogPost();

        //    return View(post);
        //}

        //[HttpPost]
        //[ValidateInput(false)]
        //public ActionResult Add(BlogPost p)
        //{
        //    var time = DateTime.Now;
        //    p.DatePosted = time.Date;
        //    var repo = new BlogPostRepo();
        //    repo.AddBlogPost(p);

        //    return View();
        //}

        //public ActionResult Remove()
        //{

        //    //var repo = new BlogPostRepo();
        //    var post = new BlogPost();

        //    return View(post);
        //}

        //[Authorize]
        //[ValidateInput(false)]
        public ActionResult Remove(int blogpostId)
        {
            var repo = new BlogPostRepo();
            repo.RemoveBlogPost(blogpostId);
            //ViewBag.Message = "The blogpost with Title(@)"
            return RedirectToAction("Index", "Admin", new {message="Blog Post has been deleted."});
        }

        public ActionResult AddCategory()
        {
            var crepo = new CategoryRepo();
            var list = crepo.GetAllCategories();
            return View(list);

        }

        [HttpPost]
        public ActionResult AddCategory(string Category)
        {
            var crepo = new CategoryRepo();
            crepo.AddCategory(Category);
            var list = crepo.GetAllCategories();
            return View(list);
        }
    }
}