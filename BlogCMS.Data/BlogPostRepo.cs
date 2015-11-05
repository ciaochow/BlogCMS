﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dapper;
using BlogCMS.Model;

namespace BlogCMS.Data
{
    public class BlogPostRepo:IBlogPostRepo
    {
        public List<BlogPost> GetAllBlogPosts()
        {
            List<BlogPost> categories = new List<BlogPost>();

            StringBuilder query = new StringBuilder();

            query.Append("select BlogID, u.FirstName, u.LastName, DatePosted, Title,ImageURL, c.TheContent as Content ");
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

        public void AddBlogPost(BlogPost p)
        {
            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {
                var pr = new DynamicParameters();
                pr.Add("Content", p.Content);
                pr.Add("DatePosted", p.DatePosted);
                pr.Add("Title", p.Title);
                pr.Add("ImageURL", p.ImageURL);
                var sqlQuery = "DECLARE @id INT  " +
                               "INSERT INTO Content (TheContent) " +
                               "VALUES (@Content); " +
                               "SELECT @id = SCOPE_IDENTITY(); " +
                               "INSERT INTO Blog (WriterID,ContentID,DatePosted,Title,ImageURL) " +
                               "VALUES ('1',@id,@DatePosted,@Title,@ImageURL);";
                cn.Execute(sqlQuery, pr);
                //cn.Query<int>(sqlQuery, pr); 
            }

        }

        public BlogPost GetBlogPostById(int id)
        {
            BlogPost post = new BlogPost();

            StringBuilder query = new StringBuilder();

            query.Append("select BlogID, u.FirstName, u.LastName, DatePosted, Title,ImageURL, c.TheContent as Content ");
            query.Append("from Blog b ");
            query.Append("inner join [User] u ");
            query.Append("on b.WriterID = u.UserID ");
            query.Append("inner join Content c ");
            query.Append("on b.ContentID = c.ContentID ");
            query.Append("WHERE BlogID = @Id");
            using (SqlConnection cn = new SqlConnection(Connection.ConnectionString))
            {

                post = cn.Query<BlogPost>(query.ToString(), new { Id= id }).ToList().First();
            }

            return post;
        }

    }
    public interface IBlogPostRepo
    {
        List<BlogPost> GetAllBlogPosts();
        BlogPost GetBlogPostById(int id);
    }
}
