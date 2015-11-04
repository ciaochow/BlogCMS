using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

namespace BlogCMS.Data
{
    public class HTMLRepo
    {
        private string connectionString;

        public HTMLRepo()
        {
            connectionString = ConfigurationManager.ConnectionStrings["BlogCMS"].ConnectionString;
        }

        public string GetStaticPage()
        {
            string result = "";

            try
            {
                using (SqlConnection cn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = "SELECT * From TestHtml where TestHtmlID = 1";
                    cmd.Connection = cn;

                    cn.Open(); // must have open connection to query

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        //Read() returns false when there is no more data
                        while (dr.Read())
                        {
                            result = dr["TestHtml"].ToString();
                        }
                    }
                }
            }
            catch (Exception ex)
            {


            }
            return result;
        }
    }
}
