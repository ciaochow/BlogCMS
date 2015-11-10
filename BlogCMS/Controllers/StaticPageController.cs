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

        public ActionResult AddStatic()
        {
            var model = new StaticPage();

            return View(model);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult AddStatic(StaticPage page)
        {
            var brepo = new BlogPostRepo();
            brepo.AddStaticPage(page);

            return RedirectToAction("Index","Admin");
        }

        public ActionResult Show(int id)
        {
            var brepo = new BlogPostRepo();
            var page = brepo.GetPageById(id);

            return View(page);
        }

    }
}