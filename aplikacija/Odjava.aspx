<%@ Page Title="Restoran Barun Trenk | Odjava" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Odjava.aspx.cs" Inherits="aplikacija.Odjava" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="project" style="text-align: left">

<asp:BulletedList id="BulletedList1" DisplayMode="HyperLink" Runat="server" 
    BulletStyle="Square" ForeColor="#003366" Font-Size="Small" Height="36px" Width="100%">
        <asp:ListItem 
            Text="Nova narudžba"
            Value="Pocetna.aspx" />
    </asp:BulletedList>

</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
    <h1>Vaša narudžba je zaprimljena!</h1><br />
    <h2>Uskoro će vas kontaktirati operater radi potvrde narudžbe.<br /><br/> Kontrolni broj Vaše narudžbe je: 
        <asp:Label 
            ID="Label1" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label></h2><br />
            <p>Hvala Vam na kupnji.</p>
            <br /><br />
            <p ><a href="Pocetna.aspx" title="Povratak na početnu stranicu"><< Povratak</a></p>
            
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
