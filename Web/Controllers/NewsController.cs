using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Helpers;

namespace Web.Controllers
{
    public class NewsController : BaseController
    {
        // GET: News
        public ActionResult Index(int id = 0, int start = 0, int pageSize = 25, string query = "")
        {
            var haber = gazeteler.NewsSet.AsQueryable();

            if (id > 0)
            {
                haber = haber.Where(q => q.CategoryId == id);
            }

            if (query.Length > 0)
            {
                haber = haber.Where(q => q.Baslik.Contains(query) || q.Text.Contains(query));
            }

            haber.OrderByDescending(q => q.Id).Skip(start).Take(pageSize);

            ViewBag.start = start + pageSize;
            ViewBag.pageSize = pageSize;

            return View(haber);
        }
        public ActionResult Show(int id = 0)
        {
            News haber = gazeteler.NewsSet.FirstOrDefault(q => q.Id == id);
            return View(haber);
        }

        [HttpPost]
        public ActionResult Comment(int post_id, String comment_text)
        {
            var user = (User)Session["user"];

            if (user == null)
            {
                TempData["comment_error"] = "Giriş yapmadan yorum yapamasınız !";
                return Redirect(Request.UrlReferrer.ToString());
            }

            if (comment_text == "" || post_id < 1)
            {
                TempData["comment_error"] = "Formdaki eksikleri doldurunuz !";
                return Redirect(Request.UrlReferrer.ToString());
            }

            var comment = new Comment();
            comment.Baslik = "yorum basligi"; 
            comment.Date = DateTime.Now;
            comment.NewsId = post_id;
            comment.Text = comment_text;
            comment.UserId = user.Id;
            comment.Verified = false;

            gazeteler.CommentSet.Add(comment);
            gazeteler.SaveChanges();

            TempData["comment_success"] = "Yorumunuz onay sonrasında yayına alınacaktır, teşekkürler !";
            return Redirect(Request.UrlReferrer.ToString());
        }

        [HttpPost]
        public ActionResult CommentAjax(int post_id, String comment_text)
        {
            Comment(post_id, comment_text);

            if (TempData["comment_error"] != null)
            {
                return Content(TempData["comment_error"].ToString());
            }
            return Content(TempData["comment_success"].ToString());
        }

        public ActionResult Json(int id)
        {
            var list = gazeteler.NewsSet.Where(q => q.CategoryId == id).Select(x => new { x.Id, x.Baslik });
            return Json(list, JsonRequestBehavior.AllowGet);
        }
        public ActionResult ResimYol(int id)
        {
            byte[] file = gazeteler.NewsSet.Find(id).ResimYol;
            if (file == null)
            {
                return Content("Resim bulunamadı");
            }
            return File(file, ImageHelper.GetContentType(file).ToString());
        }
   
    }
}