using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogCMS.Model
{
    public class BlogPost
    {
        public string BlogID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime DatePosted { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
    }
}
