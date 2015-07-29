<%@ Page Title="Restoran Barun Trenk | Kontaktirajte nas!" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Kontakt.aspx.cs" Inherits="aplikacija.Kontakt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 195px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="project"><a href="http://www.boso.hr" target="_blank">
        <img src="slike/genscher.gif" alt="Boso d.o.o." height="150" 
            style="border-width: 0px"/></a><h2 style="text-align:center">BOSO d.o.o.</h2></div><br />
    <div class="project" style="text-align: center"><a href="http://www.stanic-vk.hr" target="_blank">
        <img src="slike/stanic.gif" alt="Stanic d.o.o." height="170" 
            style="border-width: 0px" /></a><h2 style="text-align:center">Stanić d.o.o.</h2>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
    <h1>Kontakt</h1>
<br />
<table cellpadding="5" cellspacing="1" width="90%"> 
    <tr style="background-color:#FFFFFF">
        <td class="style1">Narudžbe i kontakt na telefon:</td>
        <td>062 100 100<br />Ponedjeljak - Subota ; 9:00-22:00</td>
    </tr>
</table>
<br />
<br />
<table cellpadding="5" cellspacing="5" width="90%" 
        style="border: thin outset #008080">
    <tr>
        <td>Pišite nam!</td>
        <td></td>
    </tr>
    <tr><td colspan="2"><asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label></td></tr>
    <tr>
        <td align="right">Ime i prezime*</td>
        <td align="left">
            <asp:TextBox ID="txtImePrezime" runat="server" Width="200px" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldImePrezime" runat="server" 
                ControlToValidate="txtImePrezime" ErrorMessage="*Upišite ime i prezime" 
                Font-Size="8pt" ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
            </td>
    </tr>
    <tr>
        <td align="right">Email*</td>
        <td>
            <asp:TextBox ID="txtKontakt" runat="server" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldEmail" runat="server" 
                ControlToValidate="txtKontakt" ErrorMessage="*Upišite svoj e-mail" Font-Size="8pt" 
                ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
            </td>
    </tr>
    <tr>
        <td align="right">Naslov*</td>
        <td align="left">
            <asp:TextBox ID="txtNaslov" runat="server" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldNaslov" runat="server" 
                ControlToValidate="txtNaslov" ErrorMessage="*Naslov poruke" Font-Size="8pt" 
                ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
            </td>
    </tr>
    <tr>
    <td valign ="top" align="right">Tekst*<br />
        <asp:RequiredFieldValidator ID="RequiredFieldTekst" runat="server" 
            ControlToValidate="txtTekst" ErrorMessage="*Upišite tekst poruke" Font-Size="8pt" 
            ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
        </td>
    <td>
        <asp:TextBox ID="txtTekst" runat="server" Height="212px" Width="328px" 
            TextMode="MultiLine" MaxLength="250"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td align="right">Prepišite znakove*</td>
        <td colspan="2"><asp:Image ID="CaptachaImage" runat="server" /> <br />
            <asp:TextBox ID="txt_ccode" runat="server" MaxLength="5" Width="155px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldCaptcha" runat="server" 
                ControlToValidate="txt_ccode" 
                ErrorMessage="*Točno prepišite znakove sa slike" Font-Size="8pt" 
                ForeColor="Red" ValidationGroup="Valid"></asp:RequiredFieldValidator>
            </td></tr>
    <tr>
        <td colspan="2" align="right">
            <asp:Button ID="btnReset" runat="server" Text="Reset" 
                onclick="btnReset_Click" />&nbsp&nbsp
            <asp:Button ID="Button1" runat="server" Text="Pošalji &gt;" 
                onclick="Button1_Click" ValidationGroup="Valid" /></td>
    </tr>
</table>
</asp:Content>
