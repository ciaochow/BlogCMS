using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BlogCMS.Model
{
    public class Archieve
    {
        public int ArchieveID { get; set; }
        public string Month { get; set; }
        public int Year { get; set; }
        public int NumberOfPosts { get; set; }
    }
}
