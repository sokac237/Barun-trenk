<%@ Page Title="Restoran Barun Trenk | Informacije o nama" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="O-nama.aspx.cs" Inherits="aplikacija.O_nama" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.5.0, Culture=neutral, PublicKeyToken=940cfcde86f32efd"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v10.1, Version=10.1.5.0, Culture=neutral, PublicKeyToken=940cfcde86f32efd"
    Namespace="DevExpress.Web.ASPxObjectContainer" TagPrefix="dx" %>

<%@ Register Assembly="NotesForGallery" Namespace="NotesFor" TagPrefix="ctl" %> 
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="project" style="text-align: right"><a href="Kosarica.aspx">
        <img src="slike/cart1.jpg" alt="Moja košarica" height="50" 
            title="Moja košarica" style="border-width: 0px"/></a></div>
    <div class="project" title="Boso d.o.o." style="text-align: center"><a href="http://www.boso.hr" target="_blank">
        <img src="slike/genscher.gif" alt="Boso d.o.o." height="150" 
            style="border-width: 0px"/></a><h2 style="text-align:center">BOSO d.o.o.</h2></div><br />
    <div class="project" title="Stanić d.o.o." style="text-align: center"><a href="http://www.stanic-vk.hr" target="_blank">
        <img src="slike/stanic.gif" alt="Stanic d.o.o." height="170" 
            style="border-width: 0px" /></a><h2 style="text-align:center">Stanić d.o.o.</h2></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 

    <br />
    <h1>O nama</h1><br />
    <h2>RESTORAN Barun Trenk</h2><br />
    <h2>Restoran Barun Trenk pruža usluge online narudžbe jela, dostave na kućnu adresu, cateringa... Cilj nam je omogućiti Vam brzu i kvalitetnu uslugu, stoga je naša svakodnevna ponuda bogata te sadrži brza jela , ali i kuhana jela po pristupačnim cijenama. </h2><br />
    <h2>Za sve informacije obratite se na niže navedeni broj telefona.</h2>
<br />
<table>
<tr> 
<td style="padding:10px" align="left"> Stanka Vraza 13 / A <br/>STANIĆ d.o.o. <br />32100 Vinkovci <br /> OIB: 65915626789</td>
</tr>
</table>
<br />
<table cellpadding ="2" cellspacing="2">
<tr align="center"><td colspan="2"><img src="slike/restoran.gif" alt="Stanic d.o.o." height="250" /></td></tr>
<tr>
<td style="padding:10px" align="right">Radno vrijeme:<br />
    <br />
    <br />Vrijeme dostave:</td>
<td>
    <br />
    PON - PET 09:00 - 18:00 h 
    <br />
    SUB 09:00 - 15:00 h<br />
    <br />PON - PET 09:00 - 21:00 h&nbsp; 
    <br />
    SUB 09:00 - 15:00 h<br />
    ( 30 - 60 min)</td>
</tr>
<tr>
<td style="padding:10px" align="right">Plaćanje:<br />Minimalna narudžba:<br />Područje dostave:</td>
<td>gotovinom<br />40 kn<br />grad Vinkovci</td>
</tr>
<tr><td></td></tr>
<tr><td></td></tr>
<tr><td align="right">Narudžbe putem telefona:</td><td>062 100 100</td></tr>
</table>
<div class="separator"></div>
<br />
<h1>Pogledajte galeriju</h1><br />
<p>Slike restorana</p><br /><br />
<ctl:Gallery runat="server" ID="Gallery" FolderUrl="~/slikerestoran" Size="130 "/><br /><br />
<p>Slike jela</p><br />
<ctl:Gallery runat="server" ID="Gallery1" FolderUrl="~/slikejela" Size="130 "/>

</asp:Content>
