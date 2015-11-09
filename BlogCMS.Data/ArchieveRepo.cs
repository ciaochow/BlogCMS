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
    public class ArchieveRepo
    {
        public List<Archieve> GetMonthList()
        {
            List<Archieve> archieves = new List<Archieve>();

            StringBuilder query = new StringBuilder();

            query.Append("select a.ArchieveID, a.[Month], a.[Year], Count(b.BlogID) as NumberOfPosts ");
            query.Append("from Archieve a ");
            query.Append("inner join ArchieveBlogs ab ");
            query.Append("on a.ArchieveID = ab.ArchieveID ");
            query.Append("inner join Blog b ");
            query.Append("on ab.BlogID = b.BlogID ");
            query.Append("Group by a.ArchieveID, a.[Month], a.[Year] ");

            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                archieves = cn.Query<Archieve>(query.ToString()).ToList();
            }
            return archieves;
        }


    }
}
