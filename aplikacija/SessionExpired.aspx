<%@ Page Title="Session Expired" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="SessionExpired.aspx.cs" Inherits="aplikacija.SessionExpired" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Threading" %>

<script runat="server">
   void Page_Load() {
                      byte[] delay = new byte[1];
                      RandomNumberGenerator prng = new RNGCryptoServiceProvider();
                      prng.GetBytes(delay);
                      Thread.Sleep((int)delay[0]);        
                      IDisposable disposable = prng as IDisposable;
                      if (disposable != null) { disposable.Dispose(); }
                    }
</script>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <div>
    <br />
        <h1>Sesija istekla</h1><br />
        <p>
            Vaša sesija je istekla.<br /><br />
            Molimo vratite se na <a href="Pocetna.aspx"> početnu stranicu</a> 
            kako biste mogli dalje nesmetano naručivati.</p><br />

            <p ><a href="Pocetna.aspx" title="Povratak na početnu"><< Povratak</a></p>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
