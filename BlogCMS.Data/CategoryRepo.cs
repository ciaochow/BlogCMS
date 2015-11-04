using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using Dapper;
using BlogCMS.Model;

namespace BlogCMS.Data
{
    public class CategoryRepo
    {
        //private string connectionString;

        public CategoryRepo()
        {
           // connectionString = ConfigurationManager.ConnectionStrings["BlogCMS"].ConnectionString;
        }

        public List<Category> GetAllCategories()
        {
            List<Category> categories = new List<Category>();

            StringBuilder query = new StringBuilder();

            query.Append("select *  ");
            query.Append("from Category ");

            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                categories = cn.Query<Category>(query.ToString()).ToList();
            }
            return categories;
        }
    }
}
