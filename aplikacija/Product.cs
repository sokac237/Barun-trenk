
/**
 * The Product class
 * 
 * This is just to simulate some way of accessing data about  our products
 */
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Text;

public class Product
{

    public int Id { get; set; }
    public decimal Price { get; set; }
    public string Description { get; set; }

    public Product(int id)
    {
        aplikacija.upiti veza = new aplikacija.upiti();
        DataTable artikl = new DataTable();

        this.Id = id;

        veza.ExecuteQuery("select * from artikl where id_artikl = '" + Id + "'", ref artikl);

        if (artikl.Rows.Count < 1)
        {
            return;
        }
        else
        {
            string price = artikl.Rows[0][3].ToString();
            this.Price = Convert.ToDecimal(price);
            this.Description = artikl.Rows[0][2].ToString();
        }
    }

}
