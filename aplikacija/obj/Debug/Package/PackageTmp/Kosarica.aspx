<%@ Page Title="Restoran Barun Trenk | Vaša košarica proizvoda" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Kosarica.aspx.cs" Inherits="aplikacija.ViewCart" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.5.0, Culture=neutral, PublicKeyToken=940cfcde86f32efd" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #opis
        {
            height: 59px;
            width: 211px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="project" style="text-align: left">

<asp:BulletedList id="BulletedList1" DisplayMode="HyperLink" Runat="server" 
    BulletStyle="Square" ForeColor="#306ACB" Font-Size="Medium" Height="36px" 
        Width="100%">
        <asp:ListItem Text="Nastavite kupovati" Value="Pocetna.aspx" />
    <asp:ListItem Text="Kako naručiti" Value="Kako-naruciti.aspx" />
    </asp:BulletedList>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
<h1>Vaša košarica</h1>
            <br />
        <p style="text-align:right">
        <a href="Pocetna.aspx" style="font-size: medium; color: #405452; " 
                title="Povratak na početnu stranicu"> < Povratak na ponudu proizvoda</a>
            </p><br />
            <asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="False" 
        EmptyDataText="Vaša košarica je prazna!  Vratite se nazad na listu proizvoda  i nastavite kupnju." 
        GridLines="None" Width="90%" CellPadding="5" ShowFooter="True" 
        DataKeyNames="ProductId" OnRowDataBound="gvShoppingCart_RowDataBound" 
        OnRowCommand="gvShoppingCart_RowCommand" >
                <HeaderStyle Font-Bold="False" HorizontalAlign="Left" BackColor="#E6E7DE" ForeColor="Black" />
                <EmptyDataRowStyle Font-Bold="False" Font-Underline="False" />
                <FooterStyle Font-Bold="True" HorizontalAlign="Right" BackColor="#B3B4A9" ForeColor="Black" Wrap="True" />
                <AlternatingRowStyle BackColor="#ECEBE8" />
                
                <Columns>
                    <asp:BoundField DataField="Description" HeaderText="Naziv" ItemStyle-HorizontalAlign="Left">
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Količina">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="LinkButton2" Text="-1" CommandName="Minus" CommandArgument='<%# Eval("ProductId") %>' style="font-size:12px;"></asp:LinkButton>
                            <asp:TextBox runat="server" Width="25" Enabled="false" ID="txtQuantity" Columns="5" Text='<%# Eval("Quantity") %>' ForeColor="Black"></asp:TextBox>
                            <asp:LinkButton runat="server" ID="LinkButton1" Text="+1" CommandName="Plus" CommandArgument='<%# Eval("ProductId") %>' style="font-size:12px;"></asp:LinkButton><br />
                            <asp:LinkButton runat="server" ID="btnRemove" Text="Obriši" CommandName="Remove" CommandArgument='<%# Eval("ProductId") %>' style="font-size:12px;"></asp:LinkButton>
                            <asp:HiddenField ID="Kolicina_hidden" runat="server" Value='<%# Eval("Quantity") %>'/>
                            <asp:HiddenField ID="Id_proizvoda" runat="server" Value='<%# Eval("ProductId") %>'/>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="80px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="UnitPrice" HeaderText="Cijena" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right">
                        <HeaderStyle HorizontalAlign="Right"></HeaderStyle>

                    <ItemStyle HorizontalAlign="Right" Width="100px"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="TotalPrice" HeaderText="Ukupno" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right">
                        <HeaderStyle HorizontalAlign="Right"></HeaderStyle>

                        <ItemStyle HorizontalAlign="Right" Width="100px"></ItemStyle>
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <p style="text-align: right; padding-right:50px" ><asp:Label  ID="Label1" runat="server" Text="* PDV uračunat u cijenu" 
        Font-Italic="True" Font-Size="12px"></asp:Label></p>
             <br />

    <asp:Panel ID="panel2" runat="server">
    <p>Dodatni zahtjev:</p>
    <asp:TextBox Width="90%" Rows="3" id="TextArea1" TextMode="multiline" 
            runat="server" MaxLength="60" /> <br /><br />

           <p style="text-align:right; padding-right:50px";>
               <asp:Button ID="Button2" runat="server" 
                    Text="Zaključi narudžbu &gt;"  onclick="btnKraj_Click"/></p> 
    </asp:Panel><br />

    <asp:Panel ID="Panel1" runat="server">

    <h1>Vaši kontakt podaci</h1><br />

    <table width="90%" cellpadding="5" cellspacing="2" 
            style="border: thin outset #008080">
        <tr>
            <td align="right">Ime i prezime *</td>
        <td>
            <asp:TextBox ID="txtImePrezime" runat="server" MaxLength="50" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldImePrezime" runat="server" 
                    ControlToValidate="txtImePrezime" 
                    ErrorMessage="*Upišite ime i prezime" ValidationGroup="ASD" ForeColor="Red" 
                    Font-Italic="True" Font-Size="8pt"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">Ulica *</td>
        <td>
            <asp:TextBox ID="txtUlica" runat="server" MaxLength="30" Width="200px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldUlica" runat="server" 
                    ControlToValidate="txtUlica" ErrorMessage="*Unesite naziv ulice" 
                    ValidationGroup="ASD" ForeColor="Red" Font-Italic="True" Font-Size="8pt"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">Kućni broj *</td>
        <td>
            <asp:TextBox ID="txtBroj" runat="server" MaxLength="20" Width="200px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldKucniBroj" runat="server" 
                    ControlToValidate="txtBroj" ErrorMessage="*Upišite kućni broj" 
                    ValidationGroup="ASD" ForeColor="Red" Font-Italic="True" Font-Size="8pt"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right"> Telefon *</td>
        <td>
            <asp:TextBox ID="txtTelefon" runat="server" MaxLength="30" Width="200px"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldTelefon" runat="server" 
                    ControlToValidate="txtTelefon" ErrorMessage="*Upišite telefon" 
                    ValidationGroup="ASD" ForeColor="Red" Font-Italic="True" Font-Size="8pt"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">Prepišite znakove</td>
            <td align="left">
            <asp:Image ID="CaptachaImage" runat="server" /> <br />
            <asp:TextBox ID="txt_ccode" runat="server" MaxLength="5" Width="155px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td>
            <input type="button" id="btn" value="Pošalji narudžbu &gt;" runat="server" onserverclick="btn_Validate" validationgroup="ASD"/>
            </td>
        </tr>
    </table>
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
