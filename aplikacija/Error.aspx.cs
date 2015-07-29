using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aplikacija
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "    Preusmjeravanje na početnu stranicu...";

            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='10; url=Pocetna.aspx'/>"));
        }    
    }
}