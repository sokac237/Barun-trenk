using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;
using Captcha;
using System.Drawing.Imaging;

namespace aplikacija
{
    public partial class ViewCart : System.Web.UI.Page
    {
        public string CaptchaCode;
        upiti veza = new upiti();
        public int brojNarudzbe;
        public int brojac;

        protected void Page_Load(object sender, EventArgs e)
        {             
            if (!Page.IsPostBack)
            {
                BindData();
                CaptchaImage cImage = new CaptchaImage(CaptchaImage.generateRandomCode(), 160, 50);
                cImage.Image.Save(Server.MapPath("~\\CaptchaImages\\" + Convert.ToString(Session["CaptchaCode"]) + ".jpg"), ImageFormat.Jpeg);
                CaptachaImage.ImageUrl = "~\\CaptchaImages\\" + Convert.ToString(Session["CaptchaCode"]) + ".jpg";
                cImage.Dispose();
            }
            CaptchaCode = Convert.ToString(Session["CaptchaCode"]);
        }

        protected void btn_Validate(object sender, EventArgs e)
        {
            if (CaptchaCode == txt_ccode.Text)
            {
                if (txtImePrezime.Text != "" && txtUlica.Text != "" && txtBroj.Text != "" && txtTelefon.Text != "")
                {
                    try
                    {
                        odrediBroj();
                        PokupiPodatkeDokument();

                        for (brojac = 0; brojac < GridView1.Rows.Count; brojac++)
                        {
                            PokupiStavke();
                        }
                        ShoppingCart cart = ShoppingCart.GetShoppingCart();
                        cart.ClearItems();
                        Response.Redirect("Odjava.aspx?value=" + brojNarudzbe + "");
                        Alert.Show("Vaša narudžba je zaprimljena! \r\n Uskoro će vas kontaktirati operater radi potvrde narudžbe.  \r\n Kontrolni broj Vaše narudžbe je " + brojNarudzbe + "  \r\n Hvala na Vašoj kupnji.");
                    }
                    catch (Exception ex)
                    {
                        Alert.Show(ex.Message);
                    }
                }
                else
                {
                    Alert.Show("Morate popuniti sva polja sa oznakom *");
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

        protected void BindData()
        {
            ShoppingCart cart = ShoppingCart.GetShoppingCart();
            GridView1.DataSource = cart.Items;
            GridView1.DataBind();

            if (GridView1.Rows.Count < 1)
            {
                btn.Visible = false;
                Panel1.Visible = false;
                panel2.Visible = false;
                Label1.Visible = false;
                
            }
            else
            {
                btn.Visible = true;
                Panel1.Visible = false;
                Panel1.Enabled = false;
                panel2.Visible = true;
                Label1.Visible = true;

            }
        }

        protected void gvShoppingCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                ShoppingCart cart = ShoppingCart.GetShoppingCart();
                e.Row.Cells[2].Text = "Ukupno";
                e.Row.Cells[3].Text = cart.GetSubTotal() + " kn";
            }

        }

        /**
         * This is the method that responds to the Remove button's click event
         */
        protected void gvShoppingCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                ShoppingCart cart = ShoppingCart.GetShoppingCart();
                cart.RemoveItem(productId);
            }
            else if (e.CommandName == "Plus")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                ShoppingCart cart = ShoppingCart.GetShoppingCart();
                cart.PovecajzaJedan(productId);
            }
            else if (e.CommandName == "Minus")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                ShoppingCart cart = ShoppingCart.GetShoppingCart();
                cart.UmanjizaJedan(productId);
            }
            // We now have to re-setup the data so that the GridView doesn't keep
            // displaying the old data
            BindData();
        }

        protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    // We'll use a try catch block in case something other than a number is typed in
                    // If so, we'll just ignore it.
                    try
                    {
                        // Get the productId from the GridView's datakeys
                        int productId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Value);
                        // Find the quantity TextBox and retrieve the value
                        int quantity = int.Parse(((TextBox)row.Cells[1].FindControl("txtQuantity")).Text);
                        ShoppingCart.Instance.SetItemQuantity(productId, quantity);
                    }
                    catch (FormatException) { }
                }
            }
            BindData();
        }

        protected void btnKraj_Click(object sender, EventArgs e)
        {
            ShoppingCart cart = ShoppingCart.GetShoppingCart();
            decimal iznos = cart.GetSubTotal();
            if (TextArea1.Text.Length <= 60)
            {
                if (GridView1.Rows.Count >= 1 && iznos >= 40)
                {
                    Panel1.Visible = true;
                    Panel1.Enabled = true;
                    txtImePrezime.Focus();
                }
                else
                {
                    Alert.Show("Minimalna narudžba je 40 kn!");
                }
            }
            else 
            {
                Alert.Show("Maksimalno 60 znakova za polje 'Dodatni zahtjev'");
            }

        }

        protected void btnPovratak_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pocetna.aspx");
        }

        public void PokupiPodatkeDokument()
        {
            string imeprezime = txtImePrezime.Text;
            string ulica = txtUlica.Text;
            string broj = txtBroj.Text;
            string telefon = txtTelefon.Text;
            string datum = Convert.ToDateTime(DateTime.Now.Date).ToString("yyyy-MM-dd");
            int minute = DateTime.Now.TimeOfDay.Minutes;
            int sati = DateTime.Now.TimeOfDay.Hours;
            string vrijeme = "" + sati + ":" + minute + "";
            string opis = TextArea1.Text;

            veza.ExecuteQuery("insert into narudzbazag (nz_brojNarudzbe, nz_imeprezime, nz_ulica, nz_ulicabroj, nz_telefon, nz_datumnarudzbe, nz_vrijemenarudzbe, nz_opis, id_korisnik) values ('" + brojNarudzbe + "', '" + imeprezime + "', '" + ulica + "', '" + broj + "', '" + telefon + "', '" + datum + "', '" + vrijeme + "', '" + opis + "', default)");
        }

        protected void odrediBroj()
        {
            DataTable broj = new DataTable();
            veza.ExecuteQuery("Select se_trenutnibroj from serija", ref broj);

            int trenutni = Convert.ToInt32(broj.Rows[0][0]);
            brojNarudzbe = trenutni + 1;

            veza.ExecuteQuery("Update serija set se_trenutnibroj = '" + brojNarudzbe + "'");
        }

        protected void PokupiStavke()
        {
            //char[] specialChars = new char[] { ' ', '"'};

            int kolicina = int.Parse(((TextBox) GridView1.Rows[brojac].Cells[1].FindControl("txtQuantity")).Text);

            //string cijena1 = GridView1.Rows[brojac].Cells[2].Text.ToString();
            //string cijena2 = cijena1.Trim(specialChars);
            //double cijena3 = double.Parse(cijena2);// Convert.ToInt16(cijena2);
            //string cijena_konacna = Convert.ToString(cijena3).Replace('.',',');

            //string vrijednost1 = GridView1.Rows[brojac].Cells[3].Text.ToString(); 
            //string vrijednost2 = vrijednost1.TrimEnd(specialChars);

            //string vrijednost_konacna = Convert.ToString(vrijednost3).Replace('.', ',');

            int id_proizvoda = int.Parse(((HiddenField)GridView1.Rows[brojac].Cells[1].FindControl("Id_proizvoda")).Value);


            DataTable dat = new DataTable();
            veza.ExecuteQuery("select ar_cijena from artikl where id_artikl = '" + id_proizvoda + "'", ref dat);

            //decimal cijena = Convert.ToDecimal(dat.Rows[0][0].ToString());
            int c = Convert.ToInt16(dat.Rows[0][0]);
            string cij2 = Convert.ToString(dat.Rows[0][0]).Replace(',', '.');
            int vrijednost = kolicina * c;

            string a = "insert into narudzbastavke (nz_brojNarudzbe, ns_kolicina, ns_cijena, ns_ukupnovrijednost, artikl_id_artikl ) values ('" + brojNarudzbe + "', '" + kolicina + "', " + cij2 + ", '" + vrijednost + "' , '" + id_proizvoda + "')";
            
            veza.ExecuteQuery(a);
        }
    }
}