using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using Web.ViewModel;

namespace Web.Controllers
{
    public class ContactController : BaseController
    {
        // GET: Contact
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Send(MailViewModel model)
        {
            if (ModelState.IsValid)
            {
                var body = "<p>Gönderen: {0} ({1})</p><p>Konu: {2}</p><p>Mesaj:</p><p>{3}</p>";
                var message = new MailMessage();
                message.From = new MailAddress("gazetehaber27@gmail.com", "GazeteHaber E-Posta Servisi");
                message.To.Add(new MailAddress("mrtonrckmk@gmail.com"));
                message.Subject = "Yeni mesajınız var!";
                message.Body = string.Format(body, model.FromName, model.FromEmail, model.Subject, model.Message);
                message.IsBodyHtml = true;

                try
                {
                    using (var smtp = new SmtpClient())
                    {
                        var credential = new NetworkCredential
                        {
                            UserName = "gazetehaber27@gmail.com",
                            Password = "159753qwe"
                        };
                        smtp.Credentials = credential;
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.EnableSsl = true;

                        smtp.Send(message);
                        return RedirectToAction("Success");
                    }
                }
                catch (Exception)
                {
                    return RedirectToAction("Fail");
                }
            }
            return View("Index", model);
        }

        public ActionResult Success()
        {
            return View();
        }

        public ActionResult Fail()
        {
            return View();
        }
    }
}