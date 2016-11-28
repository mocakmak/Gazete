using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data;

namespace Admin.Controllers
{
    public class CommentsController : BaseController
    {
        private gazeteContainer db = new gazeteContainer();

        // GET: Comments
        public ActionResult Index()
        {
            var commentSet = db.CommentSet.Include(c => c.User).Include(c => c.News);
            return View(commentSet.ToList());
        }

        // GET: Comments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.CommentSet.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // GET: Comments/Create
        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name");
            ViewBag.NewsId = new SelectList(db.NewsSet, "Id", "Baslik");
            return View();
        }

        // POST: Comments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "Id,Baslik,Text,Date,Verified,UserId,NewsId")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                db.CommentSet.Add(comment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name", comment.UserId);
            ViewBag.NewsId = new SelectList(db.NewsSet, "Id", "Baslik", comment.NewsId);
            return View(comment);
        }

        // GET: Comments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.CommentSet.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name", comment.UserId);
            ViewBag.NewsId = new SelectList(db.NewsSet, "Id", "Baslik", comment.NewsId);
            return View(comment);
        }

        // POST: Comments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "Id,Baslik,Text,Date,Verified,UserId,NewsId")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(comment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(db.UserSet, "Id", "Name", comment.UserId);
            ViewBag.NewsId = new SelectList(db.NewsSet, "Id", "Baslik", comment.NewsId);
            return View(comment);
        }

        // GET: Comments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.CommentSet.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // POST: Comments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Comment comment = db.CommentSet.Find(id);
            db.CommentSet.Remove(comment);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
