<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Narudzba.aspx.cs" Inherits="aplikacija.Narudzba" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <table border="0" cellspacing="2" cellpadding="5">
        <tr>
            <td><asp:Label ID="Label2" runat="server" Text="Label" ></asp:Label></td>
        </tr>
        <tr>
            <td></td>
            <td> <asp:Button ID="btnAzuriraj" runat="server" Text="Ažuriraj" onclick="btnAzuriraj_Click" /></td>
        </tr>
                <tr>
            <td></td>
            <td> <asp:Button ID="btnPrikazi" runat="server" Text="Prikaži" 
                    onclick="btnPrikazi_Click" /></td>
        </tr>
        </table>

        <table border="0" cellspacing="2" cellpadding="5">
            <tr>
               <td>
                   <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                       AutoGenerateColumns="False" DataKeyNames="id_artikl" 
                       DataSourceID="SqlDataSource1">
                       <Columns>
                           <asp:BoundField DataField="id_artikl" HeaderText="ID" InsertVisible="False" 
                               ReadOnly="True" SortExpression="id_artikl" />
                           <asp:BoundField DataField="ar_sifra" HeaderText="Šifra" 
                               SortExpression="ar_sifra" />
                           <asp:BoundField DataField="ar_naziv" HeaderText="Naziv" 
                               SortExpression="ar_naziv" />
                           <asp:BoundField DataField="ar_cijena" HeaderText="Cijena" 
                               SortExpression="ar_cijena" />
                           <asp:TemplateField HeaderText="Prodaja" SortExpression="ar_prodaja">
                               <EditItemTemplate>
                                   <asp:CheckBox ID="CheckBox1" runat="server" 
                                       Checked='<%# Bind("ar_prodaja") %>' />
                               </EditItemTemplate>
                               <ItemTemplate>
                                   <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ar_prodaja") %>' 
                                       Enabled="False" />
                               </ItemTemplate>
                               <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           </asp:TemplateField>
                           <asp:CommandField ShowEditButton="True" />
                       </Columns>
                   </asp:GridView>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:narudzbeConnectionString %>" 
                       ProviderName="<%$ ConnectionStrings:narudzbeConnectionString.ProviderName %>" 
                       SelectCommand="SELECT artikl.* FROM artikl" 
                       UpdateCommand="UPDATE artikl SET ar_prodaja = @prodaja WHERE (id_artikl = @IDArtikl)">
                   </asp:SqlDataSource>
               </td>
            </tr>
            </table>
            
</asp:Content>

<asp:Content ID="Content3" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    Opis odabira artikala
    <h2>Asd</h2>
</asp:Content>

