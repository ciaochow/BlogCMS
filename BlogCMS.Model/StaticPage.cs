using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogCMS.Model
{
    public class StaticPage
    {
        public int StaticPageID { get; set; }

        [Required(ErrorMessage = "Can't be blank")]
        public string LinkText { get; set; } //

        [Required(ErrorMessage = "Can't be blank")]
        public string Title { get; set; } //

        [Required(ErrorMessage = "Can't be blank")]
        public string Content { get; set; } // 

        public string ImageURL { get; set; } //

        public bool Active { get; set; }

    }
}
