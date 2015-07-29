<%@ Page Title="Restoran Barun Trenk | Postupak naručivanja hrane" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Kako-naruciti.aspx.cs" Inherits="aplikacija.Kako_naruciti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="project" style="text-align: right"><a href="Kosarica.aspx">
        <img src="slike/cart1.jpg" alt="Moja košarica" height="50" 
            title="Moja košarica" style="border-width: 0px" /></a></div>
<h1>Česta pitanja</h1>
<br />
<p style="text-align: left; font-size: small; width: 225px; padding:5px;"">
    1. Na kojem području je moguća dostava? <br />Dostava je trenutno dostupna na području grada Vinkovca.<br /><br />
    2. Tko će mi dostaviti hranu koju sam naručio? <br /> Hranu dostavlja ovlašteni dostavljač.<br /><br />
    3. Koji je način plaćanja i valuta?<br /> Način plaćanja je gotovinom u kunama na iznos dobivenog računa.<br /><br />
    4. Koliko traje dostava hrane? <br /> Vrijeme dostave definirano je <a href="O-nama.aspx">ovdje.</a> <br /><br />
    5. Da li mogu otkazati narudžbu i kako? <br /> Od narudžbe možete odustati 
    na upit operatera za potvrdom narudžbe. <br /><br />

    Imate još pitanja? <a href="Kontakt.aspx">Pišite nam!</a>
</p>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
<h1>Kako naručiti</h1><br />
<p>Prije nego počnete s naručivanjem hrane predlažemo Vam da posjetite sljedeće linkove i pročitate upute o tome kako naručiti, informacije o radnom vremenu, minimalnoj narudžbi ...</p>

<p>
    &nbsp;<asp:BulletedList id="blWebsites" DisplayMode="HyperLink" Runat="server" 
    BulletStyle="Square" ForeColor="#306ACB">
        <asp:ListItem 
            Text="Postupak naručivanja proizvoda"
            Value="Kako-naruciti.aspx" />
        <asp:ListItem 
            Text="Ostale informacije"
            Value="O-nama.aspx" />
    </asp:BulletedList>
</p><br />
<table cellpadding="2" cellspacing="5">
<tr>
<td  style="vertical-align: top">1.</td>
<td >Odabrani proizvod dodajte u košaricu klikom na 'Dodaj' (Slika 1). <br /></td>
</tr>
<tr align="center"><td colspan="2">
    <img src="slike/prva.png" alt="#" 
        width="200"/><br />Slika 1</td></tr>
<tr>
<td  style="vertical-align: top">2.</td>
<td>Svoju trenutnu narudžbu vidite u gornjem desnom kutu pod nazivom 'Vaša košarica'.</td>
</tr>
<tr>
<td  style="vertical-align: top">3.</td>
<td>Klikom na 'Pregled' otvorit će Vam se nova stranica na kojo možete pregledati i zaključiti narudžbu (Slika 2).</td>
</tr>
<tr style="text-align: center"><td colspan="2"><img alt="#" src="slike/kosarica.png" width="250" /><br />Slika 2</td></tr>
<tr>
<td  style="vertical-align: top">4.</td>
<td>Konačno, klikom miša na 'Pošalji' Vaša narudžba je poslana.</td>
</tr>
<tr>
<td style="vertical-align: top">5.</td>
<td>Nakon uspješnog slanja narudžbe pisat će Vam kontrolni broj narudžbe radi lakše komunikacije s operaterom koji će Vas kontaktirati radi potvrde (Slika 3).</td>
</tr>
<tr style="text-align: center"><td colspan="2"><img alt="#" src="slike/5.jpg" 
        width="350" /><br />Slika 3</td>
</tr>
</table>
<br />

    
    <h2>Podržani internet preglednici:</h2>
    <br />
    <p><img alt="#" src="slike/IE.png" title="Internet explorer" />&nbsp<img alt="#" src="slike/Safari.png" title="Safari" />&nbsp<img alt="#" src="slike/Firefox.png" title="Firefox" />&nbsp<img alt="#" src="slike/Opera.png" title="Opera" />&nbsp<img alt="#" src="slike/Chrome.png" title="Chrome" /><br />
        *podržano na svim važnijim preglednicima</p>

</asp:Content>
