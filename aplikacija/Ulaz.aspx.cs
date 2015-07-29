using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Configuration;
using System.Data;

namespace aplikacija
{
    public partial class Ulaz : System.Web.UI.Page
    {
        upiti upit = new upiti();
        DataTable dat = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
            lbltekst.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Provjeri();
        }

        protected void Provjeri()
        {
            upit.ExecuteQuery("Select ko_inicijali, ko_sifra, id_korisnik from korisnik where ko_inicijali = '"+txtKorisnickoIme.Text+"' and ko_sifra = '"+txtLozinka.Text+"' " , ref dat);
            if (dat.Rows.Count > 0 && dat.Rows[0][0].ToString() == txtKorisnickoIme.Text && dat.Rows[0][1].ToString() == txtLozinka.Text)
            {
                Global.korisnik = this.dat.Rows[0][2].ToString();
                //napuni grid sa proizvodima
                lbltekst.Visible = true;
                lbltekst.Text = "Ulogirani ste";
                Response.Redirect("Narudzba.aspx");
            }
            else
            {
                lbltekst.Visible = true;
                lbltekst.Text = "Niste upisali točne korisničke podatke";
                txtKorisnickoIme.Text = "";
                txtLozinka.Text = "";
                txtKorisnickoIme.Focus();
            }

        }
        protected void btnOdustani_Click(object sender, EventArgs e)
        {
            Response.Redirect("Pocetna.aspx");
        }
    }
}