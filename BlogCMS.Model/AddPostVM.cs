using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace BlogCMS.Model
{
    public class AddPostVM
    {
        public BlogPost BlogPost { get; set; }
        public List<SelectListItem> CategoryList { get; set; }

        public AddPostVM()
        {
            BlogPost = new BlogPost();
            CategoryList = new List<SelectListItem>();
        }

        public void CreateCategoryList(List<Category> categories )
        { 
            foreach (var category in categories)
            {
                CategoryList.Add(new SelectListItem
                {
                    Value = category.CategoryID.ToString(),
                    Text = category.CategoryName
                });
            }

        } 
    }
}
