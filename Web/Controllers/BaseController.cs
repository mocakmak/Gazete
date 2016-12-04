using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Data;

namespace Web.Controllers
{
    public class BaseController : Controller
    {
        public gazeteContainer gazeteler = new gazeteContainer();
        // GET: Base
        public BaseController()
        {
            var httpContext = System.Web.HttpContext.Current;

            if (httpContext.Application["categories"] == null)
            {
                httpContext.Application["categories"] = gazeteler.CategorySet.ToList();
            }
        }      
    }
}