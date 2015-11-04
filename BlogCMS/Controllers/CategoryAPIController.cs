using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BlogCMS.Data;
using BlogCMS.Model;

namespace BlogCMS.Controllers
{
    public class CategoryAPIController : ApiController
    {
        CategoryRepo crepo = new CategoryRepo();

        public List<Category> Get()
        {
            List<Category> categories = crepo.GetAllCategories();

            return categories;
        }
    }
}
