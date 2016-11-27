using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Admin.Controllers
{
    public class BaseController : Controller
    {
        // GET: Base
        [Filters.AdminAuthorize]
        public ActionResult Index()
        {
            return View();
        }
    }
}