using System.Xml;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System;


namespace aplikacija
{
    public partial class master : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var keyWords = MetaData.FindControl("PageKeywords") as Literal;
            if (keyWords != null)
            {
                MasterKeywords.Attributes["content"] = keyWords.Text;
            }

            var description = MetaData.FindControl("PageDescription") as Literal;
            if (description != null)
            {
                MasterDescription.Attributes["content"] = description.Text;
            }

            var title = MetaData.FindControl("PageTitle") as Literal;
            if (title != null)
            {
                MasterTitle.Text = title.Text;
            }
        }

        public int SessionLengthMinutes
        {
            get { return Session.Timeout; }
        }

        public string SessionExpireDestinationUrl
        {
            get { return "SessionExpired.aspx"; }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            ShoppingCart cart = ShoppingCart.GetShoppingCart();
            if (cart.Items.Count < 1)
            {
                return;
            }
            else
            {
                this.PageHead.Controls.Add(new LiteralControl(String.Format("<meta http-equiv='refresh' content='{0};url={1}'>", SessionLengthMinutes * 90, SessionExpireDestinationUrl)));
            }
            
        }
    }
}