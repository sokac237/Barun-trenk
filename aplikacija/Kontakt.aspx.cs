using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Net.Mail;
using System.Net.Mime;
using System.Drawing.Imaging;
using Captcha;

namespace aplikacija
{

    public partial class Kontakt : System.Web.UI.Page
    {
        public string CaptchaCode;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblStatus.Text = "";
                CaptchaImage cImage = new CaptchaImage(CaptchaImage.generateRandomCode(), 160, 50);
                cImage.Image.Save(Server.MapPath("~\\CaptchaImages\\" + Convert.ToString(Session["CaptchaCode"]) + ".jpg"), ImageFormat.Jpeg);
                CaptachaImage.ImageUrl = "~\\CaptchaImages\\" + Convert.ToString(Session["CaptchaCode"]) + ".jpg";
                cImage.Dispose();
            }
            CaptchaCode = Convert.ToString(Session["CaptchaCode"]);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtImePrezime.Text = "";
            txt_ccode.Text = "";
            txtKontakt.Text = "";
            txtNaslov.Text = "";
            txtTekst.Text = "";
            txtImePrezime.Focus();
            lblStatus.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CaptchaCode == txt_ccode.Text)
            {
                SmtpClient smtpClient = new SmtpClient();
                MailMessage message = new MailMessage();

                try
                {
                    MailAddress fromAddress = new MailAddress(txtKontakt.Text, txtImePrezime.Text);

                    smtpClient.Credentials = new System.Net.NetworkCredential("web.stanic@gmail.com", "sokac237");
                    smtpClient.Port = 587;
                    smtpClient.Host = "smtp.gmail.com";
                    smtpClient.EnableSsl = true;
                    // You can specify the host name or ipaddress of your server
                    // Default in IIS will be localhost 

                    //From address will be given as a MailAddress Object
                    message.From = fromAddress;

                    // To address collection of MailAddress
                    message.To.Add("web.stanic@gmail.com");
                    message.Subject = txtNaslov.Text;

                    //Body can be Html or text format
                    //Specify true if it  is html message
                    message.IsBodyHtml = false;

                    // Message body content
                    message.Body = txtTekst.Text + Environment.NewLine + "Kontakt:  " + txtKontakt.Text;

                    // Send SMTP mail
                    smtpClient.Send(message);

                    lblStatus.Text = "Poruka je uspješno poslana!";

                    if (lblStatus.Text == "Poruka je uspješno poslana!")
                    {
                        txtImePrezime.Text = "";
                        txt_ccode.Text = "";
                        txtKontakt.Text = "";
                        txtNaslov.Text = "";
                        txtTekst.Text = "";
                        txtImePrezime.Focus();
                    }
                }
                catch (Exception)
                {
                    lblStatus.Text = "Dogodila se greška. Poruka nije poslan.<br>Neispravna forma e-mail adrese!";

                }
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(typeof(Page), "ValidateMsg", "<script>alert('Upisali ste netočne znakove!');</script>");
                CaptchaImage cImage = new CaptchaImage(CaptchaImage.generateRandomCode(), 160, 50);
                cImage.Image.Save(Server.MapPath("~\\CaptchaImages\\" + Convert.ToString(Session["CaptchaCode"]) + ".jpg"), ImageFormat.Jpeg);
                CaptachaImage.ImageUrl = "~\\CaptchaImages\\" + Convert.ToString(Session["CaptchaCode"]) + ".jpg";
                cImage.Dispose();
                txt_ccode.Text = "";
                txt_ccode.Focus();
            }
        }
    }
}