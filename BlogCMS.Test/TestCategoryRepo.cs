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
    public class TestCategoryRepo
    {
        [Test]
        public void CanGetCategory()
        {
            CategoryRepo repo = new CategoryRepo();

            var categories = repo.GetAllCategories();

            var category1 = categories.First().CategoryName;

            var category2 = repo.GetCategory("1");

            Assert.AreEqual(category1,category2);
        }

        [Test]
        public void CanAddCategory()
        {
            CategoryRepo repo = new CategoryRepo();

            var preAddCount = repo.GetAllCategories().Count;

            string category = "Unit Test";
            repo.AddCategory(category);

            var categories = repo.GetAllCategories();
            var postAddCount = categories.Count;

            Assert.AreEqual(preAddCount + 1, postAddCount);
            Assert.AreEqual(categories.Last().CategoryName, category);
        }
    }
}
