using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace aplikacija
{
    public partial class Pocetna : System.Web.UI.Page
    {
        public int kolicina;
        public int id_proizvoda;
        
        upiti veza = new upiti();

        DataTable artikl = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

            Response.AppendHeader("Refresh", "600m; url=Pocetna.aspx");

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int iProductID = Convert.ToInt32(Request.QueryString["id"]);
                    if (Request.QueryString["action"].Trim().ToLower() == "add")
                    {
                        id_proizvoda = Global.proizvod_ID;
                        kolicina = Global.kolicina;

                        if (iProductID == id_proizvoda)
                        {
                            AddToShoppingCart(iProductID, kolicina);
                            Global.kolicina = 0;
                            Global.proizvod_ID = 0;
                            
                            Response.Redirect(String.Format("Pocetna.aspx"));
                        }
                        else if (Request.QueryString["action"].Trim().ToLower() == "add" || kolicina == 0 && iProductID != id_proizvoda)
                        {
                            Alert.Show("Morate odabrati količinu!");
                        }
                        Response.Redirect(String.Format("Pocetna.aspx"));
                    }
                }
                brojac();
            }
            preuzimanje();
            BindData();

            if (rptkosarica.Items.Count < 1)
            {
                Label2.Text = "Vaša košarica je prazna.";
            }

        }
       
        private void BindData()
        {
            if (Session["ASPNETShoppingCart"] == null)
            {
                ShoppingCart cart = ShoppingCart.GetShoppingCart();
                cart.ClearItems();
                lblukupno.InnerText = "Ukupno: " + cart.GetSubTotal() + " kn";
            }
            else
            {
                ShoppingCart cart = ShoppingCart.GetShoppingCart();
                rptkosarica.DataSource = cart.Items;
                rptkosarica.DataBind();

                lblukupno.InnerText = "Ukupno: " + cart.GetSubTotal() + " kn";
            }

        }


        private void AddToShoppingCart(int ProductID, int kolicina)
        {
            if (kolicina == 0)
            {
                Alert.Show("Morate odabrati količinu!");
                return;
            }
            ShoppingCart cart = ShoppingCart.GetShoppingCart();
            cart.AddItem(ProductID, kolicina);
        }

        private void preuzimanje()
        {
            veza.ExecuteQuery("Select artikl.id_artikl, artikl.ar_sifra, artikl.ar_naziv, artikl.ar_cijena, artikl.ar_prodaja, artikl.ar_opis, artikl.id_kategorije, mjera.mj_naziv from artikl, mjera where artikl.id_mjera = mjera.id_mjera and ar_prodaja= '1' and id_kategorije='1' order by artikl.ar_naziv", ref artikl);

            if (artikl.Rows.Count < 1)
            {
                Glavno.Text = "Trenutno nema niti jedan proizvod iz ove kategorije u ponudi.";
            }
            Repeater1.DataSource = artikl;
            Repeater1.DataBind();
            artikl.Clear();

            veza.ExecuteQuery("Select artikl.id_artikl, artikl.ar_sifra, artikl.ar_naziv, artikl.ar_cijena, artikl.ar_prodaja, artikl.ar_opis, artikl.id_kategorije, mjera.mj_naziv from artikl, mjera where artikl.id_mjera = mjera.id_mjera and ar_prodaja= '1' and id_kategorije='2' order by artikl.ar_naziv", ref artikl);

            if (artikl.Rows.Count < 1)
            {
                Grill.Text = "Trenutno nema niti jedan proizvod iz ove kategorije u ponudi.";
            }
            Repeater2.DataSource = artikl;
            Repeater2.DataBind();
            artikl.Clear();

            veza.ExecuteQuery("Select artikl.id_artikl, artikl.ar_sifra, artikl.ar_naziv, artikl.ar_cijena, artikl.ar_prodaja, artikl.ar_opis, artikl.id_kategorije, mjera.mj_naziv from artikl, mjera where artikl.id_mjera = mjera.id_mjera and ar_prodaja= '1' and id_kategorije='3' order by artikl.ar_naziv", ref artikl);

            if (artikl.Rows.Count < 1)
            {
                Juhe.Text = "Trenutno nema niti jedan proizvod iz ove kategorije u ponudi.";
            }
            Repeater3.DataSource = artikl;
            Repeater3.DataBind();
            artikl.Clear();

            veza.ExecuteQuery("Select artikl.id_artikl, artikl.ar_sifra, artikl.ar_naziv, artikl.ar_cijena, artikl.ar_prodaja, artikl.ar_opis, artikl.id_kategorije, mjera.mj_naziv from artikl, mjera where artikl.id_mjera = mjera.id_mjera and ar_prodaja= '1' and id_kategorije='4' order by artikl.ar_naziv", ref artikl);

            if (artikl.Rows.Count < 1)
            {
                Prilozi.Text = "Trenutno nema niti jedan proizvod iz ove kategorije u ponudi.";
            }
            Repeater4.DataSource = artikl;
            Repeater4.DataBind();
            artikl.Clear();

            veza.ExecuteQuery("Select artikl.id_artikl, artikl.ar_sifra, artikl.ar_naziv, artikl.ar_cijena, artikl.ar_prodaja, artikl.ar_opis, artikl.id_kategorije, mjera.mj_naziv from artikl, mjera where artikl.id_mjera = mjera.id_mjera and ar_prodaja= '1' and id_kategorije='5' order by artikl.ar_naziv", ref artikl);

            if (artikl.Rows.Count < 1)
            {
                Salate.Text = "Trenutno nema niti jedan proizvod iz ove kategorije u ponudi.";
            }
            Repeater5.DataSource = artikl;
            Repeater5.DataBind();
            artikl.Clear();

            veza.ExecuteQuery("Select artikl.id_artikl, artikl.ar_sifra, artikl.ar_naziv, artikl.ar_cijena, artikl.ar_prodaja, artikl.ar_opis, artikl.id_kategorije, mjera.mj_naziv from artikl, mjera where artikl.id_mjera = mjera.id_mjera and ar_prodaja= '1' and id_kategorije='6' order by artikl.ar_naziv", ref artikl);

            if (artikl.Rows.Count < 1)
            {
                Umaci.Text = "Trenutno nema niti jedan proizvod iz ove kategorije u ponudi.";
            }
            Repeater6.DataSource = artikl;
            Repeater6.DataBind();
            artikl.Clear();

            veza.ExecuteQuery("Select artikl.id_artikl, artikl.ar_sifra, artikl.ar_naziv, artikl.ar_cijena, artikl.ar_prodaja, artikl.ar_opis, artikl.id_kategorije, mjera.mj_naziv from artikl, mjera where artikl.id_mjera = mjera.id_mjera and ar_prodaja= '1' and id_kategorije='7' order by artikl.ar_naziv", ref artikl);

            if (artikl.Rows.Count < 1)
            {
                Kolaci.Text = "Trenutno nema niti jedan proizvod iz ove kategorije u ponudi.";
            }
            Repeater7.DataSource = artikl;
            Repeater7.DataBind();
            artikl.Clear();

            veza.ExecuteQuery("Select artikl.id_artikl, artikl.ar_sifra, artikl.ar_naziv, artikl.ar_cijena, artikl.ar_prodaja, artikl.ar_opis, artikl.id_kategorije, mjera.mj_naziv from artikl, mjera where artikl.id_mjera = mjera.id_mjera and ar_prodaja= '1' and id_kategorije='8' order by artikl.ar_naziv", ref artikl);

            if (artikl.Rows.Count < 1)
            {
                Pizze.Text = "Trenutno nema niti jedan proizvod iz ove kategorije u ponudi.";
            }
            Repeater8.DataSource = artikl;
            Repeater8.DataBind();
            artikl.Clear();

            veza.ExecuteQuery("Select artikl.id_artikl, artikl.ar_sifra, artikl.ar_naziv, artikl.ar_cijena, artikl.ar_prodaja, artikl.ar_opis, artikl.id_kategorije, mjera.mj_naziv from artikl, mjera where artikl.id_mjera = mjera.id_mjera and ar_prodaja= '1' and id_kategorije='9' order by artikl.ar_naziv", ref artikl);

            if (artikl.Rows.Count < 1)
            {
                Dnevni.Text = "Trenutno nema niti jedan proizvod iz ove kategorije u ponudi.";
            }
            Repeater9.DataSource = artikl;
            Repeater9.DataBind();
            artikl.Clear();
        }

        private void countMe()
        {
            DataSet tmpDs = new DataSet();
            tmpDs.ReadXml(Server.MapPath("~/counter.xml"));

            int hits = Int32.Parse(tmpDs.Tables[0].Rows[0]["hits"].ToString());

            hits += 1;

            tmpDs.Tables[0].Rows[0]["hits"] = hits.ToString();

            tmpDs.WriteXml(Server.MapPath("~/counter.xml"));
        }

      
        protected void Kolicina_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (RepeaterItem repeaterItem in Repeater1.Items)
            {
                if (repeaterItem.ItemType == ListItemType.Item || repeaterItem.ItemType == ListItemType.AlternatingItem)
                {
                    DropDownList dropdown = (DropDownList)repeaterItem.FindControl("Kolicina");

                    if (dropdown.SelectedIndex != -1)
                    {
                        kolicina = Convert.ToInt32(dropdown.SelectedValue);
                        if (kolicina != 0)
                        {
                            HiddenField id_proizvoda = (HiddenField)repeaterItem.FindControl("KeyHiddenField");
                            int productId = Convert.ToInt16(id_proizvoda.Value);
                            Global.kolicina = Convert.ToInt32(dropdown.SelectedValue);
                            Global.proizvod_ID = productId;

                            //ShoppingCart.Instance.AddItem(productId, kolicina);
                        }
                    }
                    else
                    {
                        Global.kolicina = 0;
                        Global.proizvod_ID = 0;
                    }
                }
            }     
        }

        protected void Kolicina2_SelectedIndexChanged(object sender, EventArgs e)
        {

            foreach (RepeaterItem repeaterItem in Repeater2.Items)
            {
                if (repeaterItem.ItemType == ListItemType.Item || repeaterItem.ItemType == ListItemType.AlternatingItem)
                {
                    DropDownList dropdown = (DropDownList)repeaterItem.FindControl("Kolicina2");

                    if (dropdown.SelectedIndex != -1)
                    {
                        kolicina = Convert.ToInt32(dropdown.SelectedValue);
                        if (kolicina != 0)
                        {
                            HiddenField id_proizvoda = (HiddenField)repeaterItem.FindControl("KeyHiddenField");
                            int productId = Convert.ToInt16(id_proizvoda.Value);
                            Global.kolicina = Convert.ToInt32(dropdown.SelectedValue);
                            Global.proizvod_ID = productId;

                            //ShoppingCart.Instance.AddItem(productId, kolicina);
                        }
                    }
                    else
                    {
                        Global.kolicina = 0;
                        Global.proizvod_ID = 0;
                    }
                }
            }
        }

        protected void Kolicina3_SelectedIndexChanged(object sender, EventArgs e)
        {

            foreach (RepeaterItem repeaterItem in Repeater3.Items)
            {
                if (repeaterItem.ItemType == ListItemType.Item || repeaterItem.ItemType == ListItemType.AlternatingItem)
                {
                    DropDownList dropdown = (DropDownList)repeaterItem.FindControl("Kolicina3");

                    if (dropdown.SelectedIndex != -1)
                    {
                        kolicina = Convert.ToInt32(dropdown.SelectedValue);
                        if (kolicina != 0)
                        {
                            HiddenField id_proizvoda = (HiddenField)repeaterItem.FindControl("KeyHiddenField");
                            int productId = Convert.ToInt16(id_proizvoda.Value);
                            Global.kolicina = Convert.ToInt32(dropdown.SelectedValue);
                            Global.proizvod_ID = productId;

                            //ShoppingCart.Instance.AddItem(productId, kolicina);
                        }
                    }
                    else
                    {
                        Global.kolicina = 0;
                        Global.proizvod_ID = 0;
                    }
                }
            }
        }

        protected void Kolicina4_SelectedIndexChanged(object sender, EventArgs e)
        {

            foreach (RepeaterItem repeaterItem in Repeater4.Items)
            {
                if (repeaterItem.ItemType == ListItemType.Item || repeaterItem.ItemType == ListItemType.AlternatingItem)
                {
                    DropDownList dropdown = (DropDownList)repeaterItem.FindControl("Kolicina4");

                    if (dropdown.SelectedIndex != -1)
                    {
                        kolicina = Convert.ToInt32(dropdown.SelectedValue);
                        if (kolicina != 0)
                        {
                            HiddenField id_proizvoda = (HiddenField)repeaterItem.FindControl("KeyHiddenField");
                            int productId = Convert.ToInt16(id_proizvoda.Value);
                            Global.kolicina = Convert.ToInt32(dropdown.SelectedValue);
                            Global.proizvod_ID = productId;

                            //ShoppingCart.Instance.AddItem(productId, kolicina);
                        }
                    }
                    else
                    {
                        Global.kolicina = 0;
                        Global.proizvod_ID = 0;
                    }
                }
            }
        }

        protected void Kolicina5_SelectedIndexChanged(object sender, EventArgs e)
        {

            foreach (RepeaterItem repeaterItem in Repeater5.Items)
            {
                if (repeaterItem.ItemType == ListItemType.Item || repeaterItem.ItemType == ListItemType.AlternatingItem)
                {
                    DropDownList dropdown = (DropDownList)repeaterItem.FindControl("Kolicina5");

                    if (dropdown.SelectedIndex != -1)
                    {
                        kolicina = Convert.ToInt32(dropdown.SelectedValue);
                        if (kolicina != 0)
                        {
                            HiddenField id_proizvoda = (HiddenField)repeaterItem.FindControl("KeyHiddenField");
                            int productId = Convert.ToInt16(id_proizvoda.Value);
                            Global.kolicina = Convert.ToInt32(dropdown.SelectedValue);
                            Global.proizvod_ID = productId;

                            //ShoppingCart.Instance.AddItem(productId, kolicina);
                        }
                    }
                    else
                    {
                        Global.kolicina = 0;
                        Global.proizvod_ID = 0;
                    }
                }
            }
        }

        protected void Kolicina6_SelectedIndexChanged(object sender, EventArgs e)
        {

            foreach (RepeaterItem repeaterItem in Repeater6.Items)
            {
                if (repeaterItem.ItemType == ListItemType.Item || repeaterItem.ItemType == ListItemType.AlternatingItem)
                {
                    DropDownList dropdown = (DropDownList)repeaterItem.FindControl("Kolicina6");

                    if (dropdown.SelectedIndex != -1)
                    {
                        kolicina = Convert.ToInt32(dropdown.SelectedValue);
                        if (kolicina != 0)
                        {
                            HiddenField id_proizvoda = (HiddenField)repeaterItem.FindControl("KeyHiddenField");
                            int productId = Convert.ToInt16(id_proizvoda.Value);
                            Global.kolicina = Convert.ToInt32(dropdown.SelectedValue);
                            Global.proizvod_ID = productId;

                            //ShoppingCart.Instance.AddItem(productId, kolicina);
                        }
                    }
                    else
                    {
                        Global.kolicina = 0;
                        Global.proizvod_ID = 0;
                    }
                }
            }
        }

        protected void Kolicina7_SelectedIndexChanged(object sender, EventArgs e)
        {

            foreach (RepeaterItem repeaterItem in Repeater7.Items)
            {
                if (repeaterItem.ItemType == ListItemType.Item || repeaterItem.ItemType == ListItemType.AlternatingItem)
                {
                    DropDownList dropdown = (DropDownList)repeaterItem.FindControl("Kolicina7");

                    if (dropdown.SelectedIndex != -1)
                    {
                        kolicina = Convert.ToInt32(dropdown.SelectedValue);
                        if (kolicina != 0)
                        {
                            HiddenField id_proizvoda = (HiddenField)repeaterItem.FindControl("KeyHiddenField");
                            int productId = Convert.ToInt16(id_proizvoda.Value);
                            Global.kolicina = Convert.ToInt32(dropdown.SelectedValue);
                            Global.proizvod_ID = productId;

                            //ShoppingCart.Instance.AddItem(productId, kolicina);
                        }
                    }
                    else
                    {
                        Global.kolicina = 0;
                        Global.proizvod_ID = 0;
                    }
                }
            }
        }

        protected void Kolicina8_SelectedIndexChanged(object sender, EventArgs e)
        {

            foreach (RepeaterItem repeaterItem in Repeater8.Items)
            {
                if (repeaterItem.ItemType == ListItemType.Item || repeaterItem.ItemType == ListItemType.AlternatingItem)
                {
                    DropDownList dropdown = (DropDownList)repeaterItem.FindControl("Kolicina8");

                    if (dropdown.SelectedIndex != -1)
                    {
                        kolicina = Convert.ToInt32(dropdown.SelectedValue);
                        if (kolicina != 0)
                        {
                            HiddenField id_proizvoda = (HiddenField)repeaterItem.FindControl("KeyHiddenField");
                            int productId = Convert.ToInt16(id_proizvoda.Value);
                            Global.kolicina = Convert.ToInt32(dropdown.SelectedValue);
                            Global.proizvod_ID = productId;

                            //ShoppingCart.Instance.AddItem(productId, kolicina);
                        }
                    }
                    else
                    {
                        Global.kolicina = 0;
                        Global.proizvod_ID = 0;
                    }
                }
            }
        }

        private void brojac()
        {
            if (HttpContext.Current.Session["ASPNETShoppingCart"] == null)
            {
                this.countMe();

                DataSet tmpDs = new DataSet();

                tmpDs.ReadXml(Server.MapPath("~/counter.xml"));

                Label1.Text = tmpDs.Tables[0].Rows[0]["hits"].ToString();
            }
            else
            {
                DataSet tmpDs = new DataSet();

                tmpDs.ReadXml(Server.MapPath("~/counter.xml"));

                Label1.Text = tmpDs.Tables[0].Rows[0]["hits"].ToString();
            }

        }
    }
}