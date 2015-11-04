using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dapper;
using BlogCMS.Model;

namespace BlogCMS.Data
{
    public class BlogPostRepo
    {
        public List<BlogPost> GetAllBlogPosts()
        {
            List<BlogPost> categories = new List<BlogPost>();

            StringBuilder query = new StringBuilder();

            query.Append("select BlogID, u.FirstName, u.LastName, DatePosted, Title, c.TheContent as Content ");
            query.Append("from Blog b ");
            query.Append("inner join [User] u ");
            query.Append("on b.WriterID = u.UserID ");
            query.Append("inner join Content c ");
            query.Append("on b.ContentID = c.ContentID ");

            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                categories = cn.Query<BlogPost>(query.ToString()).ToList();
            }
            return categories;
        }
    }
}
