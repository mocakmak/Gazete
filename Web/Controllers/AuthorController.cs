using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web.Controllers
{
    public class ProjectsController : BaseController
    {
        // GET: Projects
        public ActionResult Index()
        {
            var projects = gazeteler.AuthorSet.AsQueryable();

            return View(projects);
        }

        
    }
}