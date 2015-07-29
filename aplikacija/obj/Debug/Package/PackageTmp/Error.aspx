<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="aplikacija.Error" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Threading" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

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

<head id="Head1" runat="server">
    <title>Error</title>
</head>
<body >
    <div style="vertical-align: middle; text-align: center"><br />
        Dogodila se pogreška tijekom obrade Vašeg zahtjeva. <br /><br />

        <img alt="Stanic d.o.o" src="slike/error.png" style="border:0" 
            title="Stanić d.o.o." width="300"/>
        <br /><br />

        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <p ><a href="Pocetna.aspx"><< Početna</a></p>
    </div>
</body>
</html>