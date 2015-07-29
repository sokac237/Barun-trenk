using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace aplikacija
{
    public partial class SessionExpired : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();

            Page.Header.Controls.Add(new LiteralControl("<meta http-equiv='refresh' content='10; url=Pocetna.aspx'/>"));
        }
    }
}