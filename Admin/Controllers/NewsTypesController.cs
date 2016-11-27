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
    public class NewsTypesController : BaseController
    {
        private gazeteContainer db = new gazeteContainer();

        // GET: NewsTypes
        public ActionResult Index()
        {
            return View(db.NewsTypeSet.ToList());
        }

        // GET: NewsTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsType newsType = db.NewsTypeSet.Find(id);
            if (newsType == null)
            {
                return HttpNotFound();
            }
            return View(newsType);
        }

        // GET: NewsTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: NewsTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Adi")] NewsType newsType)
        {
            if (ModelState.IsValid)
            {
                db.NewsTypeSet.Add(newsType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(newsType);
        }

        // GET: NewsTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsType newsType = db.NewsTypeSet.Find(id);
            if (newsType == null)
            {
                return HttpNotFound();
            }
            return View(newsType);
        }

        // POST: NewsTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Adi")] NewsType newsType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(newsType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(newsType);
        }

        // GET: NewsTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NewsType newsType = db.NewsTypeSet.Find(id);
            if (newsType == null)
            {
                return HttpNotFound();
            }
            return View(newsType);
        }

        // POST: NewsTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NewsType newsType = db.NewsTypeSet.Find(id);
            db.NewsTypeSet.Remove(newsType);
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
