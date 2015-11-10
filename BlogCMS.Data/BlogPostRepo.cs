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
    public class BlogPostRepo : IBlogPostRepo
    {
        public List<BlogPost> GetAllBlogPosts()
        {
            List<BlogPost> categories = new List<BlogPost>();

            StringBuilder query = new StringBuilder();

            query.Append("select BlogID, u.FirstName, u.LastName, DatePosted, Title,ImageURL, c.TheContent as Content,c.ContentId,b.StatusID ");
            query.Append("from Blog b ");
            query.Append("inner join [User] u ");
            query.Append("on b.WriterID = u.UserID ");
            query.Append("inner join Content c ");
            query.Append("on b.ContentID = c.ContentID ");
            query.Append("Order By b.StatusID ");

            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                categories = cn.Query<BlogPost>(query.ToString()).ToList();
            }
            return categories;
        }

        public StaticPage GetPageById(int id)
        {
            var page = new StaticPage();

            StringBuilder query = new StringBuilder();

            var pr = new DynamicParameters();
            pr.Add("StaticPageID",id);

            query.Append("select StaticPageID, TheContent as Content, Title, LinkText, ImageURL, Active ");
            query.Append("from Static ");
            query.Append("WHERE StaticPageID = @StaticPageID; ");

            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                page = cn.Query<StaticPage>(query.ToString(),pr).
                    First();
            }

            return page;
        }

        public List<StaticPage> GetAllStaticPages()
        {
            List<StaticPage> list = new List<StaticPage>();

            StringBuilder query = new StringBuilder();

            query.Append("select StaticPageID, LinkText ");
            query.Append("from Static s ");
            query.Append("WHERE s.Active = '1' ");

            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                list = cn.Query<StaticPage>(query.ToString()).ToList();
            }
            return list;


        }

        public List<BlogPost> GetAllPublishedBlogPosts()
        {
            List<BlogPost> categories = new List<BlogPost>();

            StringBuilder query = new StringBuilder();

            query.Append("select BlogID, u.FirstName, u.LastName, DatePosted, Title,ImageURL, c.TheContent as Content,c.ContentId ");
            query.Append("from Blog b ");
            query.Append("inner join [User] u ");
            query.Append("on b.WriterID = u.UserID ");
            query.Append("inner join Content c ");
            query.Append("on b.ContentID = c.ContentID ");
            query.Append("WHERE b.StatusID = '2'");

            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                categories = cn.Query<BlogPost>(query.ToString()).ToList();
            }
            return categories;
        }

        public void EditBlogPost(BlogPost p)
        {
            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                var pr = new DynamicParameters();
                pr.Add("Content", p.Content);
                //pr.Add("DatePosted", p.DatePosted);
                pr.Add("Title", p.Title);
                pr.Add("ImageURL", p.ImageURL);
                pr.Add("ContentId", p.ContentId);
                pr.Add("BlogID", p.BlogID);

                var sqlQuery = "UPDATE Content SET TheContent = @Content " +
                               "WHERE ContentID= @ContentId  " +
                               "UPDATE Blog SET Title = @Title, ImageURL = @ImageURL " +
                               "WHERE BlogID= @BlogID  ";


                cn.Execute(sqlQuery, pr);
            }
        }

        public void AddBlogPost(BlogPost p)
        {

            var pr = new DynamicParameters();
            pr.Add("Content", p.Content);
            pr.Add("DatePosted", p.DatePosted);
            pr.Add("Category", p.CategoryId);
            pr.Add("Title", p.Title);
            pr.Add("ImageURL", p.ImageURL);
            var sqlQuery = "DECLARE @id INT  " +
                           "INSERT INTO Content (TheContent) " +
                           "VALUES (@Content); " +
                           "SELECT @id = SCOPE_IDENTITY(); " +
                           "INSERT INTO Blog (WriterID,ContentID,DatePosted,Title,CategoryID,ImageURL,StatusID) " +
                           "VALUES ('1',@id,@DatePosted,@Title,@Category,@ImageURL,'1');";

            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                cn.Execute(sqlQuery, pr);
                //cn.Query<int>(sqlQuery, pr); 
            }
            
        }

        public BlogPost GetBlogPostById(int id)
        {
            BlogPost post = new BlogPost();
            StringBuilder query = new StringBuilder();

            query.Append("select BlogID, u.FirstName, u.LastName, DatePosted, Title,ImageURL, c.TheContent as Content,c.ContentID ");
            query.Append("from Blog b ");
            query.Append("inner join [User] u ");
            query.Append("on b.WriterID = u.UserID ");
            query.Append("inner join Content c ");
            query.Append("on b.ContentID = c.ContentID ");
            query.Append("WHERE BlogID = @Id");
            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                post = cn.Query<BlogPost>(query.ToString(), new { Id = id }).ToList().First();
            }

            return post;
        }

        public void RemoveBlogPost(int blogpostId)
        {
            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                BlogPost post = new BlogPost();
                var pr = new DynamicParameters();
                //pr .Add("Content", p.Content);
                //pr.Add("DatePosted", p.DatePosted);
                pr.Add("BlogpostId", blogpostId);
                //pr.Add("ImageURL", p.ImageURL);
                var sqlQuery = "UPDATE Blog " +
                               "SET StatusID = '5' " + 
                               "WHERE BlogID = @BlogpostId";
                    
                cn.Execute(sqlQuery, pr);
            }
        }

        // publish and add to archieve
        public void PublishPost(int id)
        {
            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                //BlogPost post = new BlogPost();
                var pr = new DynamicParameters();
                //pr .Add("Content", p.Content);
                //pr.Add("DatePosted", p.DatePosted);
                pr.Add("BlogpostId", id);
                //pr.Add("ImageURL", p.ImageURL);
                var sqlQuery = "UPDATE Blog " +
                               "SET StatusID = '2' " +
                               "WHERE BlogID = @BlogpostId";

                cn.Execute(sqlQuery, pr);
            }

            AddToArchieve(id);
        }

        public int GetBlogId()
        {
            int blogId;

            StringBuilder query = new StringBuilder();

            query.Append("Select Max( BlogID ) as blogId ");
            query.Append("From Blog ");

            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                blogId = cn.Query<int>(query.ToString()).ToList().FirstOrDefault();
            }

            return blogId;
        }

        public void AddToArchieve(int id)
        {
            string monthID;

            DateTime now = DateTime.Now;
            string monthNow = now.ToString("MMMM");

            StringBuilder query1 = new StringBuilder();

            query1.Append("Select ArchieveID ");
            query1.Append("from Archieve ");
            query1.Append("where Month = @month ");

            StringBuilder query2 = new StringBuilder();

            query2.Append("Insert Into ArchieveBlogs (ArchieveID, BlogID) ");
            query2.Append("Values ( @archieveid, @blogid ) ");
                
            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {

                monthID = cn.Query<string>(query1.ToString(), new { month = monthNow }).ToList().FirstOrDefault();

                cn.Execute(query2.ToString(), new { archieveid = monthID, blogid = id });
            }

        }

        public void UnpublishPost(int id)
        {
            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                BlogPost post = new BlogPost();
                var pr = new DynamicParameters();
                //pr .Add("Content", p.Content);
                //pr.Add("DatePosted", p.DatePosted);
                pr.Add("BlogpostId", id);
                //pr.Add("ImageURL", p.ImageURL);
                // This goes back to pending...
                var sqlQuery = "UPDATE Blog " +
                               "SET StatusID = '1' " +
                               "WHERE BlogID = @BlogpostId";

                cn.Execute(sqlQuery, pr);
            }
        }

        public List<BlogPost> GetPostsByCategory(string categoryid)
        {
            List<BlogPost> posts = new List<BlogPost>();

            StringBuilder query = new StringBuilder();

            query.Append("select BlogID, u.FirstName, u.LastName, DatePosted, Title,ImageURL, d.TheContent as Content, d.ContentId, b.StatusID ");
            query.Append("from Blog b ");
            query.Append("inner join [User] u ");
            query.Append("on b.WriterID = u.UserID ");
            query.Append("inner join Content d ");
            query.Append("on b.ContentID = d.ContentID ");
            query.Append("inner join Category c ");
            query.Append("on b.CategoryID = c.CategoryID ");
            query.Append("where c.CategoryID = @Categoryid ");

            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                posts = cn.Query<BlogPost>(query.ToString(), new { Categoryid = categoryid }).ToList();
            }

            return posts;
        }

        public List<BlogPost> GetPostsByMonth(string id)
        {
            List<BlogPost> posts = new List<BlogPost>();

            StringBuilder query = new StringBuilder();

            query.Append("select b.BlogID, u.FirstName, u.LastName, DatePosted, Title,ImageURL, d.TheContent as Content, d.ContentId, b.StatusID ");
            query.Append("from Blog b ");
            query.Append("inner join [User] u ");
            query.Append("on b.WriterID = u.UserID ");
            query.Append("inner join Content d ");
            query.Append("on b.ContentID = d.ContentID ");
            query.Append("inner join ArchieveBlogs ab ");
            query.Append("on b.BlogID = ab.BlogID ");
            query.Append("where ab.ArchieveID = @archieveId ");

            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                posts = cn.Query<BlogPost>(query.ToString(), new { archieveId = id }).ToList();
            }

            return posts;
        }

        public void AddStaticPage(StaticPage p)
        {

            var pr = new DynamicParameters();
            pr.Add("Content", p.Content);
            pr.Add("LinkText", p.LinkText);
            pr.Add("Title", p.Title);
            pr.Add("ImageURL", p.ImageURL);
         
            var sqlQuery = "Insert Into Static (TheContent, Title, LinkText, ImageURL, Active) " +
                        "VALUES (@Content, @Title, @LinkText, @ImageURL,'1');";

            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                cn.Execute(sqlQuery, pr);
                //cn.Query<int>(sqlQuery, pr); 
            }

        }
    }



    public interface IBlogPostRepo
    {
        List<BlogPost> GetAllBlogPosts();
        BlogPost GetBlogPostById(int id);
    }
}
