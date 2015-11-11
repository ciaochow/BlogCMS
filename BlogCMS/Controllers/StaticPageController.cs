using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BlogCMS.Model;
using BlogCMS.Data;

namespace BlogCMS.Controllers
{
    public class StaticPageController : Controller
    {
        // GET: Page
        public ActionResult Index()
        {
            return View();
        }

        [Authorize(Roles = "Admin")]
        public ActionResult AddStatic()
        {
            var model = new StaticPage();

            return View(model);
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateInput(false)]
        public ActionResult AddStatic(StaticPage page)
        {
            var brepo = new BlogPostRepo();
            brepo.AddStaticPage(page);
            ViewBag.Message = "A new static page has been added.";
            return View("Success");
        }

        //[Authorize(Roles = "Admin")]
        public ActionResult Show(int id)
        {
            var brepo = new BlogPostRepo();
            var page = brepo.GetPageById(id);

            return View(page);
        }

        [Authorize(Roles = "Admin")]
        public ActionResult Deactivate(int id)
        {
            var brepo = new BlogPostRepo();
            brepo.DeactivatePageById(id);

            return RedirectToAction("ManagePages", "Admin");
        }

        [Authorize(Roles = "Admin")]
        public ActionResult Activate(int id)
        {
            var brepo = new BlogPostRepo();
            brepo.ActivatePageById(id);

            return RedirectToAction("ManagePages", "Admin");
        }

        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int id)
        {
            var brepo = new BlogPostRepo();
            var post = brepo.GetPageById(id);

            return View(post);

        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        [ValidateInput(false)]
        public ActionResult Edit(StaticPage page)
        {
            var brepo = new BlogPostRepo();
            brepo.UpdatePage(page);
            ViewBag.Message = "The static page has been edited successfully.";
            return View("Success");
            //return RedirectToAction("ManagePages", "Admin");
        }
    }
}