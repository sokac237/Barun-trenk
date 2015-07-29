<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Ulaz.aspx.cs" Inherits="aplikacija.Ulaz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table border="0" cellspacing="2" cellpadding="5">
    <tr>
        <td><h2><a href="Pocetna.aspx">Povratak na početnu</a><br/></h2></td>
    </tr>
    <tr>
        <td></td>
    </tr>
</table>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p style="margin-left: 20px">
        <asp:Label ID="lbltekst" runat="server" Text="Label"></asp:Label>
    </p>
    <table border="0" cellspacing="2" cellpadding="5">
        <tr>
            <td> <asp:Label ID="lblKorisnickoIme" runat="server" Text="Korisničko ime:"></asp:Label></td>
            <td><asp:TextBox ID="txtKorisnickoIme" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblLozinka" runat="server" Text="Lozinka"></asp:Label></td>
            <td> <asp:TextBox ID="txtLozinka" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td align="right"><asp:Button ID="btnLogin" runat="server" Text="Ulaz" onclick="btnLogin_Click"/></td>
            <td><asp:Button ID="btnOdustani" runat="server" Text="Odustani" onclick="btnOdustani_Click" /></td>
        </tr>
</table> 
</asp:Content>
