using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using BlogCMS.Model;
using BlogCMS.Data;

namespace BlogCMS.Test
{
    [TestFixture]
    public class TestBlogPostRepo
    {
        [Test]
        public void CanGetBlogPostById()
        {
            BlogPostRepo repo = new BlogPostRepo();
            int testId1 = 1;
            int testId2 = 2;

            BlogPost blogpost1 = repo.GetBlogPostById(testId1);
            BlogPost blogpost2 = repo.GetBlogPostById(testId2);

            Assert.AreEqual(blogpost1.BlogID, testId1.ToString());
            Assert.AreEqual(blogpost2.BlogID, testId2.ToString());
        }

        [Test]
        public void CanGetAllBlogPosts()
        {
            BlogPostRepo repo = new BlogPostRepo();

            var blogposts = repo.GetAllBlogPosts();

            var count = repo.GetBlogId();

            Assert.AreEqual(blogposts.Count, count);
        }

        [Test]
        public void CanGetPageById()
        {
            BlogPostRepo repo = new BlogPostRepo();
            int testId = 2;

            var statePage = repo.GetPageById(testId);

            Assert.AreEqual(statePage.StaticPageID, testId);
        }

        [Test]
        public void CanEditBlogPost()
        {
            BlogPostRepo repo = new BlogPostRepo();

            BlogPost testPost = repo.GetBlogPostById(1);

            var titleBeforeEdited = testPost.Title;
            var titleAfterEdited = titleBeforeEdited + "UnitTest";

            testPost.Title = titleAfterEdited;

            repo.EditBlogPost(testPost);

            BlogPost resultPost = repo.GetBlogPostById(1);

            Assert.AreNotEqual(resultPost.Title, titleBeforeEdited);
            Assert.AreEqual(resultPost.Title, titleAfterEdited);
        }

        [Test]
        public void CanAddBlogPost()
        {
            BlogPostRepo repo = new BlogPostRepo();

            var posts = repo.GetAllBlogPosts();

            int preAddPostCount = posts.Count;

            BlogPost testPost = new BlogPost();
            testPost.Title = "Unit Test";
            testPost.DatePosted = DateTime.Now;
            testPost.Content = "Unit Test - CanAddBlogPost";

            repo.AddBlogPost(testPost);
            var postsAfterAdd = repo.GetAllBlogPosts();

            Assert.AreEqual(postsAfterAdd.Count, preAddPostCount + 1);
        }

    }
}
