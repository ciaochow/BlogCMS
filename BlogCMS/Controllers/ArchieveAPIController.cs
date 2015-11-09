using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BlogCMS.Data;
using BlogCMS.Model;

namespace BlogCMS.Controllers
{
    public class ArchieveAPIController : ApiController
    {
        public ArchieveRepo aRepo = new ArchieveRepo();

        public List<Archieve> Get()
        {
            List<Archieve> archieves = new List<Archieve>();
            archieves = aRepo.GetMonthList();

            return archieves;
        } 


    }
}
