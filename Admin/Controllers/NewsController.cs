﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Data;
using Admin.Helpers;
using System.Drawing.Imaging;

namespace Admin.Controllers
{
    public class NewsController : BaseController
    {
        private gazeteContainer db = new gazeteContainer();

        // GET: News
        public ActionResult Index()
        {
            var newsSet = db.NewsSet.Include(n => n.Category).Include(n => n.Author).Include(n => n.NewsType);
            return View(newsSet.ToList());
        }

        // GET: News/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.NewsSet.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // GET: News/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.CategorySet, "Id", "Adi");
            ViewBag.AuthorId = new SelectList(db.AuthorSet, "Id", "Adi");
            ViewBag.NewsTypeId = new SelectList(db.NewsTypeSet, "Id", "Adi");
            return View();
        }

        // POST: News/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "Id,Baslik,Text,YayimTarihi,CategoryId,AuthorId,NewsTypeId")] News news , HttpPostedFileBase ResimYol)
        {
            if (ModelState.IsValid)
            {
                if (ResimYol != null && ResimYol.ContentLength > 0)
                {
                    using (var reader = new System.IO.BinaryReader(ResimYol.InputStream))
                    {
                        news.ResimYol = reader.ReadBytes(ResimYol.ContentLength);
                    }
                }
                db.NewsSet.Add(news);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryId = new SelectList(db.CategorySet, "Id", "Adi", news.CategoryId);
            ViewBag.AuthorId = new SelectList(db.AuthorSet, "Id", "Adi", news.AuthorId);
            ViewBag.NewsTypeId = new SelectList(db.NewsTypeSet, "Id", "Adi", news.NewsTypeId);
            return View(news);
        }

        // GET: News/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.NewsSet.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.CategorySet, "Id", "Adi", news.CategoryId);
            ViewBag.AuthorId = new SelectList(db.AuthorSet, "Id", "Adi", news.AuthorId);
            ViewBag.NewsTypeId = new SelectList(db.NewsTypeSet, "Id", "Adi", news.NewsTypeId);
            return View(news);
        }

        // POST: News/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "Id,Baslik,Text,YayimTarihi,CategoryId,AuthorId,NewsTypeId")] News news , HttpPostedFileBase ResimYol)
        {
            if (ModelState.IsValid)
            {
                db.Entry(news).State = EntityState.Modified;

                if (ResimYol != null && ResimYol.ContentLength > 0)
                {
                    using (var reader = new System.IO.BinaryReader(ResimYol.InputStream))
                    {
                        news.ResimYol = reader.ReadBytes(ResimYol.ContentLength);
                    }
                }
                else
                {
                    db.Entry(news).Property("ResimYol").IsModified = false;
                }

                db.Entry(news).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.CategorySet, "Id", "Adi", news.CategoryId);
            ViewBag.AuthorId = new SelectList(db.AuthorSet, "Id", "Adi", news.AuthorId);
            ViewBag.NewsTypeId = new SelectList(db.NewsTypeSet, "Id", "Adi", news.NewsTypeId);
            return View(news);
        }

        // GET: News/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.NewsSet.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // POST: News/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            News news = db.NewsSet.Find(id);
            db.NewsSet.Remove(news);
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
        public ActionResult ResimYol(int id)
        {
            byte[] file = db.NewsSet.Find(id).ResimYol;
            if (file == null)
            {
                return Content("Resim bulunamadı");
            }
            return File(file, ImageHelper.GetContentType(file).ToString());
        }
    }
}
