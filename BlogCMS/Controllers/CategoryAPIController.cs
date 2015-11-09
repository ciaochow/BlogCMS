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

        //public List<BlogPost> Get(string category)
        //{
        //    List<BlogPost> posts = new List<BlogPost>();

        //    posts = crepo.GetPostsByCategory(category);

        //    return posts;
        //}

        public void Post(string category)
        {
            crepo.AddCategory(category);

           // var response = Request.CreateResponse(HttpStatusCode.Created, category);

           // return response;
        }

        //public HttpResponseMessage Post(string category)
        //{
        //    crepo.AddCategory(category);

        //    var response = Request.CreateResponse(HttpStatusCode.Created, category);

        //    return response;
        //}

    }
}
