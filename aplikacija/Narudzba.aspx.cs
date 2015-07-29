using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Advantage.Data.Provider;
using System.Configuration;
using MySql.Data.MySqlClient;


namespace aplikacija
{
    public partial class Narudzba : System.Web.UI.Page
    {
        upiti upiti = new upiti();
        DataTable dt = new DataTable();
        DataTable artikl = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            string korisnikID = Global.korisnik.ToString();
            upiti.ExecuteQuery("select ko_ime, ko_prezime from korisnik where id_korisnik = '" + korisnikID + "'", ref dt);

            Label2.Text = "Dobro došli " + dt.Rows[0][0].ToString() + "  " + dt.Rows[0][1].ToString();

        }

        protected void btnAzuriraj_Click(object sender, EventArgs e)
        {
            try
            {
                AdsConnection conn = new AdsConnection();
                conn.ConnectionString = "data source=P:\\kafic\\program\\kasa restoran\\baza\\centralna.add; " + "user id = adssys; password = '' " + "ServerType=REMOTE; TrimTrailingSpaces = true";
                conn.Open();
                using (AdsCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = "Select ap_sifra, ap_naziv, ap_cijena from artikp";

                    using (AdsDataReader reader = cmd.ExecuteReader())
                    {
                        artikl.Load(reader);

                        if (artikl.Rows.Count < 1)
                        {
                            return;
                        }
                        else
                        {
                            //GridView1.DataSource = artikl;
                            //GridView1.DataBind();

                            for (int i = 0; i < artikl.Rows.Count; i++)
                            {
                                string sifra = artikl.Rows[i][0].ToString();
                                string naziv = artikl.Rows[i][1].ToString();
                                string cijena = artikl.Rows[i][2].ToString().Replace(",", ".");

                                upiti.ExecuteQuery("select * from artikl where ar_sifra = '" + sifra + "' ", ref dt);
                                if (dt.Rows.Count < 1)
                                {
                                    upiti.ExecuteQuery("insert into artikl (ar_sifra, ar_naziv, ar_cijena) values ('" + sifra + "', '" + naziv + "', '" + cijena + "')");
                                }
                                else
                                {
                                    upiti.ExecuteQuery("update artikl set ar_sifra = '" + sifra + "', ar_naziv = '" + naziv + "', ar_cijena = '" + cijena + "'  where ar_sifra = '" + sifra + "'");
                                }
                            }
                            Label2.Text = "Gotovo ažuriranje";
                        }
                    }
                    conn.Close();

                }
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
            }
        }


        protected void btnPrikazi_Click(object sender, EventArgs e)
        {
            //DataTable data = new DataTable();
            //upiti.ExecuteQuery("Select ar_sifra, ar_naziv, ar_cijena, ar_prodaja from artikl", ref data);
            //GridView1.DataSource = data;
            //string[] kolone = new string[4];
            //kolone[0] = "Šifra";
            //kolone[1] = "Naziv";
            //kolone[2] = "Cijena";
            //kolone[3] = "Za prodaju";
            //for (int i = 0; i < GridView1.Columns.Count; i++)
            //{
            //    GridView1.Columns[i].HeaderText = kolone[i];
            //}

            //GridView1.DataBind();
        }
        public static void UpdateProduct(string IDArtikl)
        {
            // Updates the Products table
            string Mysql = "UPDATE artikl SET ar_prodaja = " + "@prodaja WHERE id_artikl = @IDArtikl";
            using (MySqlConnection myConnection = new MySqlConnection(ConfigurationManager.ConnectionStrings["narudzbeConnectionString"].ConnectionString))
            {
                MySqlCommand myCommand = new MySqlCommand(Mysql, myConnection);
                myCommand.Parameters.Add(new MySqlParameter("@prodaja", IDArtikl));
                myConnection.Open();
                myCommand.ExecuteNonQuery();
                myConnection.Close();
            }

        }
    }
}