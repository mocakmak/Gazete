using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Helpers;

namespace Web.Controllers
{
    public class ProjectsController : BaseController
    {
        // GET: Projects
        public ActionResult Index()
        {
            var projects = gazeteler.ProjectSet.AsQueryable();

            return View(projects);
        }

        public ActionResult Download(int id)
        {
            var project = gazeteler.ProjectSet.FirstOrDefault(q => q.Id == id);
            if (project == null)
            {
                return Content("Dosya bulunamadı");
            }

            Response.AddHeader("Content-Disposition", "attachment; filename=" + project.FileName);

            return File(project.File, project.ContentType);
        }

        [HttpPost]
        public ActionResult AddToCart(int id)
        {
            if (UserHelper.isMember() == true)
            {

                Cart cart = new Cart();
                cart.ProjectId = id;
                cart.UserId = UserHelper.Current().Id;
                cart.Status = CartStatus.New;
                cart.Count = 1;

                gazeteler.CartSet.Add(cart);

                gazeteler.SaveChanges();

                return Json(id);
            }

            return Json("login");
        }

        [HttpPost]
        public ActionResult RemoveFromCart(int id)
        {
            if (UserHelper.isMember() == true)
            {
                int userId = UserHelper.Current().Id;
                var cart = gazeteler.CartSet.FirstOrDefault(q => q.Status == CartStatus.New &&
                                                          q.UserId == userId &&
                                                          q.ProjectId == id
                                                    );
                gazeteler.CartSet.Remove(cart);
                gazeteler.SaveChanges();

                return Json(id);
            }

            return Json("login");
        }
    }
}