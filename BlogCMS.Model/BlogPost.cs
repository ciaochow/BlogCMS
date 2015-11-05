using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;


namespace BlogCMS.Model
{
    public class BlogPost
    {
        public string BlogID { get; set; }

        [Required(ErrorMessage = "Can't be blank")]
        public string FirstName { get; set; } //

        [Required(ErrorMessage = "Can't be blank")]
        public string LastName { get; set; } //

        [DataType(DataType.Date)]
        public DateTime DatePosted { get; set; }

        [Required(ErrorMessage = "Can't be blank")]
        public string Title { get; set; } //

        [Required(ErrorMessage = "Can't be blank")]
        public string Content { get; set; } // 

        
        public string ImageURL { get; set; } //

        public int ContentId { get; set; }

    }
}
