<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Pocetna.aspx.cs" Inherits="aplikacija.Pocetna" MaintainScrollPositionOnPostback="true"%>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 

    <br />
    <table  width="100%" cellpadding="2" cellspacing="0" style="border: thin outset #008080">
        <tr> 
            <td align="center" style="color: #405452; line-height: 30px; font-size: large;">Vaša košarica</td>
        </tr>
        <tr>
            <td style="font-size: small"><asp:Label ID="Label2" runat="server" 
                    ForeColor="#405452" Font-Size="10pt"></asp:Label></td>
        </tr>
        <tr>
        <td style="background-color:#E0EEDD">
            <table width="90%" style="text-align:left; font-size: small; color: #405452;">
                <asp:Repeater ID="rptkosarica" runat="server">
                    <ItemTemplate>  
                        <tr align="left">
                            <td><%# DataBinder.Eval(Container.DataItem, "Description")%><br />
                            <%# DataBinder.Eval(Container.DataItem, "UnitPrice")%> x <%# Eval("Quantity") %>
                            </td>
                            <td align="right"><%# DataBinder.Eval(Container.DataItem, "TotalPrice")%></td>
                        </tr>
                    </ItemTemplate>
                        <SeparatorTemplate>
                         <tr><td colspan="2"><hr /></td></tr>
                        </SeparatorTemplate>
                </asp:Repeater>
            </table>
        </td>
        </tr>
        <tr>
            <td colspan="2" align="right" 
                style="background-color:#CADAB3; line-height: 30px;"><label runat="server" id="lblukupno" style="color: #405452"></label></td>
        </tr>
        <tr><td style="text-align: right; font-style: italic; font-size: small">* PDV uračunat u cijenu</td></tr> 
        <tr>
            <td colspan="2" align="right" style="line-height: 30px">
            <a href="Kosarica.aspx" style="font-size: large; color: #405452; font-weight: bold;" title="Pregled košarice">Pregled</a>
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <br />
<h1>Dobrodošli na stranice restorana Barun Trenk!</h1><br /><br />
<p>U prostoru restorana postoji i linija od 4<b>0 kn</b> 
    gdje možete jesti u neograničenoj količini te mogućnost odabira jela za van.<br /></p><br />

    <p style="color: #CC0000; font-weight: bolder; font-size: large;">Današnja ponuda</p><br />
    <table width="90%" cellpadding="5" cellspacing="0" 
        style="border: thin outset #FF0000; text-align: center;">
    <tr>
        <td style="width:25%"><a href="#dnevni">Dnevni meni</a></td>
    </tr>
    <tr>
        <td style="width:25%"><a href="#glavno">Glavno jelo</a></td>
        <td style="width:25%"><a href="#grill">Grill</a></td>
        <td style="width:25%"><a href="#juhe">Juhe</a></td>
        <td style="width:25%"><a href="#pizze">Pizze i pite</a></td>
    </tr>
    <tr>
        <td style="width:25%"><a href="#prilozi">Prilozi</a></td>
        <td style="width:25%"><a href="#salate">Salate</a></td>
        <td style="width:25%"><a href="#umaci">Umaci</a></td>
        <td style="width:25%"><a href="#kolaci">Kolači i slastice</a></td>
    </tr>
</table><br /><br />
 <p>Od 01.02.2012. uvodimo i svakodnevne gablece, svaki dan u ponudi 3 menija <br />(<strong>22kn</strong> 
    =&nbsp; 1 glavno jelo + 1 prilog + 1 salata ili juha + kruh)<b>.</b>&nbsp; 
    Narudžbe na <a href="O-nama.aspx" style="border-bottom-style: inset">telefon.</a>.</p><br />
<p id="dnevni" style="font-family: Georgia; font-size: medium"><b>Dnevni meni - gablec</b></p><br />
    <asp:Label ID="Dnevni" runat="server"></asp:Label>
    <br />

    <table width="60%" cellpadding="5" cellspacing="0" style="background-color:#F2F8E8">
    <asp:Repeater ID="Repeater9" runat="server" EnableViewState="false">
        <ItemTemplate>
        <tr>
            <td style="width:350" align="left">
            <p><%# DataBinder.Eval(Container.DataItem, "ar_naziv") %></p>
            <p style="font-family: verdana; font-size:small; font-style: italic;"><%# DataBinder.Eval(Container.DataItem, "ar_opis") %></p>
            </td>
            <td></td>
        </tr>               
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
        </ItemTemplate>
    </asp:Repeater>
</table><br />

<p id="glavno" style="font-family: Georgia; font-size: medium"><b>Glavno jelo</b></p><br />
    <asp:Label ID="Glavno" runat="server"></asp:Label>
    <br />

<table width="60%" cellpadding="5" cellspacing="0" style="background-color:#F2F8E8">
    <asp:Repeater ID="Repeater1" runat="server" EnableViewState="false">
        <ItemTemplate>
        <tr>
            <td style="width:350" align="left">
            <p><%# DataBinder.Eval(Container.DataItem, "ar_naziv") %></p>
            <p style="font-family: verdana; font-size:small; font-style: italic;"><%# DataBinder.Eval(Container.DataItem, "ar_opis") %></p>
            </td>
            <td></td>
        </tr>
        <tr>
             <td style="width:350" valign="bottom">
                <table style="background-color:#DCEAC0; font-size: small; font-family: 'Times New Roman', Times, serif;">
                        <td style="width: 80px"><%# DataBinder.Eval(Container.DataItem, "mj_naziv")%></td>
                        <td style="width: 60px" align="center"><%# DataBinder.Eval(Container.DataItem, "ar_cijena") %> kn</td>
                        <td> Kol. </td>
                        <td>
                        <asp:DropDownList  ID="Kolicina" runat="server" AutoPostBack="true"  onselectedindexchanged="Kolicina_SelectedIndexChanged" >
                                <asp:ListItem Value="0">0</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                             </asp:DropDownList>
                             <asp:HiddenField ID="KeyHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>' />
                        </td>    
                        </td>        
                    </tr>        
                </table>
            </td>
        <td align="right"><a href="Pocetna.aspx?action=add&ID=<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>"><img  alt="#"  title="Dodaj u košaricu" height="22" src="slike/dodaj221.png" style="border:0" /></a>    
        </td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
         <tr style="background-color:White">
            <td align="right" colspan="2"><a href="#"></a></td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
        </ItemTemplate>
    </asp:Repeater>
</table><br />

    <p id="grill" style="font-family: Georgia; font-size: medium;"><b>Grill</b></p><br />
    <asp:Label ID="Grill" runat="server"></asp:Label>
    <br />

<table width="60%" cellpadding="5" cellspacing="0" style="background-color:#F2F8E8">
    <asp:Repeater ID="Repeater2" runat="server" EnableViewState="false">
        <ItemTemplate>
        <tr>
            <td style="width:350">
            <p><%# DataBinder.Eval(Container.DataItem, "ar_naziv") %></p>
            <p style="font-family: verdana; font-size:small; font-style: italic;"><%# DataBinder.Eval(Container.DataItem, "ar_opis") %></p>
            </td>
            <td></td>
        </tr>
        <tr>
             <td style="width:350" valign="bottom">
                <table style="background-color:#DCEAC0; font-size: small; font-family: 'Times New Roman', Times, serif;">
                    <tr>
                        <td style="width: 80px"><%# DataBinder.Eval(Container.DataItem, "mj_naziv") %></td>
                        <td style="width: 60px" align="center"><%# DataBinder.Eval(Container.DataItem, "ar_cijena") %> kn</td>
                        <td> Kol. </td>
                        <td>
                         <asp:DropDownList  ID="Kolicina2" runat="server" AutoPostBack="true"  onselectedindexchanged="Kolicina2_SelectedIndexChanged" >
                                <asp:ListItem Value="0">0</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                             </asp:DropDownList>
                             <asp:HiddenField ID="KeyHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>' />
                        </td>        
                    </tr>        
                </table>
            </td>
        <td align="right"><a href="Pocetna.aspx?action=add&ID=<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>"><img  alt="#"  title="Dodaj u košaricu" height="22" src="slike/dodaj221.png" style="border:0" /></a></td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
         <tr style="background-color:White">
            <td align="right" colspan="2"><a href="#"></a></td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
        </ItemTemplate>
    </asp:Repeater>
</table><br />

    <p id="juhe" style="font-family: Georgia; font-size: medium"><b>Juhe</b></p><br />
    <asp:Label ID="Juhe" runat="server"></asp:Label>
    <br />

<table width="60%" cellpadding="5" cellspacing="0" style="background-color:#F2F8E8">
    <asp:Repeater ID="Repeater3" runat="server" EnableViewState="false">
        <ItemTemplate>
        <tr>
            <td style="width:350">
            <p><%# DataBinder.Eval(Container.DataItem, "ar_naziv") %></p>
            <p style="font-family: verdana; font-size:small; font-style: italic;"><%# DataBinder.Eval(Container.DataItem, "ar_opis") %></p>
            </td>
            <td></td>
        </tr>
        <tr>
             <td style="width:350" valign="bottom">
                <table style="background-color:#DCEAC0; font-size: small; font-family: 'Times New Roman', Times, serif;">
                    <tr>
                        <td style="width: 80px"><%# DataBinder.Eval(Container.DataItem, "mj_naziv") %></td>
                        <td style="width: 60px" align="center"><%# DataBinder.Eval(Container.DataItem, "ar_cijena") %> kn</td>
                        <td> Kol. </td>
                        <td>
                         <asp:DropDownList  ID="Kolicina3" runat="server" AutoPostBack="true"  onselectedindexchanged="Kolicina3_SelectedIndexChanged" >
                                <asp:ListItem Value="0">0</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                             </asp:DropDownList>
                             <asp:HiddenField ID="KeyHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>' />
                        </td>        
                    </tr>        
                </table>
            </td>
        <td align="right"><a href="Pocetna.aspx?action=add&ID=<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>"><img  alt="#"  title="Dodaj u košaricu" height="22" src="slike/dodaj221.png" style="border:0" /></a></td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
         <tr style="background-color:White">
            <td align="right" colspan="2"><a href="#"></a></td>
        </tr>
        </ItemTemplate>
    </asp:Repeater>
</table><br />

<p id="prilozi" style="font-family: Georgia; font-size: medium"><b>Prilozi</b></p><br />
    <asp:Label ID="Prilozi" runat="server"></asp:Label>
    <br />

<table width="60%" cellpadding="5" cellspacing="0" style="background-color:#F2F8E8">
    <asp:Repeater ID="Repeater4" runat="server" EnableViewState="false">
        <ItemTemplate>
        <tr>
            <td style="width:350" align="left">
            <p><%# DataBinder.Eval(Container.DataItem, "ar_naziv") %></p>
            <p style="font-family: verdana; font-size:small; font-style: italic;"><%# DataBinder.Eval(Container.DataItem, "ar_opis") %></p>
            </td>
            <td></td>
        </tr>
        <tr>
             <td style="width:350" valign="bottom">
                <table style="background-color:#DCEAC0; font-size: small; font-family: 'Times New Roman', Times, serif;">
                        <td style="width: 80px"><%# DataBinder.Eval(Container.DataItem, "mj_naziv")%></td>
                        <td style="width: 60px" align="center"><%# DataBinder.Eval(Container.DataItem, "ar_cijena") %> kn</td>
                        <td> Kol. </td>
                        <td>
                        <asp:DropDownList  ID="Kolicina4" runat="server" AutoPostBack="true"  onselectedindexchanged="Kolicina4_SelectedIndexChanged" >
                                <asp:ListItem Value="0">0</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                             </asp:DropDownList>
                             <asp:HiddenField ID="KeyHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>' />
                        </td>    
                        </td>        
                    </tr>        
                </table>
            </td>
        <td align="right"><a href="Pocetna.aspx?action=add&ID=<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>"><img  alt="#"  title="Dodaj u košaricu" height="22" src="slike/dodaj221.png" style="border:0" /></a>    
        </td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
         <tr style="background-color:White">
            <td align="right" colspan="2"><a href="#"></a></td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
        </ItemTemplate>
    </asp:Repeater>
</table><br />

<p id="salate" style="font-family: Georgia; font-size: medium"><b>Salate</b></p><br />
    <asp:Label ID="Salate" runat="server"></asp:Label>
    <br />

<table width="60%" cellpadding="5" cellspacing="0" style="background-color:#F2F8E8">
    <asp:Repeater ID="Repeater5" runat="server" EnableViewState="false">
        <ItemTemplate>
        <tr>
            <td style="width:350" align="left">
            <p><%# DataBinder.Eval(Container.DataItem, "ar_naziv") %></p>
            <p style="font-family: verdana; font-size:small; font-style: italic;"><%# DataBinder.Eval(Container.DataItem, "ar_opis") %></p>
            </td>
            <td></td>
        </tr>
        <tr>
             <td style="width:350" valign="bottom">
                <table style="background-color:#DCEAC0; font-size: small; font-family: 'Times New Roman', Times, serif;">
                        <td style="width: 80px"><%# DataBinder.Eval(Container.DataItem, "mj_naziv")%></td>
                        <td style="width: 60px" align="center"><%# DataBinder.Eval(Container.DataItem, "ar_cijena") %> kn</td>
                        <td> Kol. </td>
                        <td>
                        <asp:DropDownList  ID="Kolicina5" runat="server" AutoPostBack="true"  onselectedindexchanged="Kolicina5_SelectedIndexChanged" >
                                <asp:ListItem Value="0">0</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                             </asp:DropDownList>
                             <asp:HiddenField ID="KeyHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>' />
                        </td>    
                        </td>        
                    </tr>        
                </table>
            </td>
        <td align="right"><a href="Pocetna.aspx?action=add&ID=<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>"><img  alt="#"  title="Dodaj u košaricu" height="22" src="slike/dodaj221.png" style="border:0" /></a>    
        </td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
         <tr style="background-color:White">
            <td align="right" colspan="2"><a href="#"></a></td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
        </ItemTemplate>
    </asp:Repeater>
</table><br />

<p id="umaci" style="font-family: Georgia; font-size: medium"><b>Umaci</b></p><br />
    <asp:Label ID="Umaci" runat="server"></asp:Label>
    <br />

<table width="60%" cellpadding="5" cellspacing="0" style="background-color:#F2F8E8">
    <asp:Repeater ID="Repeater6" runat="server" EnableViewState="false">
        <ItemTemplate>
        <tr>
            <td style="width:350" align="left">
            <p><%# DataBinder.Eval(Container.DataItem, "ar_naziv") %></p>
            <p style="font-family: verdana; font-size:small; font-style: italic;"><%# DataBinder.Eval(Container.DataItem, "ar_opis") %></p>
            </td>
            <td></td>
        </tr>
        <tr>
             <td style="width:350" valign="bottom">
                <table style="background-color:#DCEAC0; font-size: small; font-family: 'Times New Roman', Times, serif;">
                        <td style="width: 80px"><%# DataBinder.Eval(Container.DataItem, "mj_naziv")%></td>
                        <td style="width: 60px" align="center"><%# DataBinder.Eval(Container.DataItem, "ar_cijena") %> kn</td>
                        <td> Kol. </td>
                        <td>
                        <asp:DropDownList  ID="Kolicina6" runat="server" AutoPostBack="true"  onselectedindexchanged="Kolicina6_SelectedIndexChanged" >
                                <asp:ListItem Value="0">0</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                             </asp:DropDownList>
                             <asp:HiddenField ID="KeyHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>' />
                        </td>    
                        </td>        
                    </tr>        
                </table>
            </td>
        <td align="right"><a href="Pocetna.aspx?action=add&ID=<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>"><img  alt="#"  title="Dodaj u košaricu" height="22" src="slike/dodaj221.png" style="border:0" /></a>    
        </td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
         <tr style="background-color:White">
            <td align="right" colspan="2"><a href="#"></a></td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
        </ItemTemplate>
    </asp:Repeater>
</table><br />

<p id="kolaci" style="font-family: Georgia; font-size: medium"><b>Kolači i slastice</b></p><br />
    <asp:Label ID="Kolaci" runat="server"></asp:Label>
    <br />

<table width="60%" cellpadding="5" cellspacing="0" style="background-color:#F2F8E8">
    <asp:Repeater ID="Repeater7" runat="server" EnableViewState="false">
        <ItemTemplate>
        <tr>
            <td style="width:350" align="left">
            <p><%# DataBinder.Eval(Container.DataItem, "ar_naziv") %></p>
            <p style="font-family: verdana; font-size:small; font-style: italic;"><%# DataBinder.Eval(Container.DataItem, "ar_opis") %></p>
            </td>
            <td></td>
        </tr>
        <tr>
             <td style="width:350" valign="bottom">
                <table style="background-color:#DCEAC0; font-size: small; font-family: 'Times New Roman', Times, serif;">
                        <td style="width: 80px"><%# DataBinder.Eval(Container.DataItem, "mj_naziv")%></td>
                        <td style="width: 60px" align="center"><%# DataBinder.Eval(Container.DataItem, "ar_cijena") %> kn</td>
                        <td> Kol. </td>
                        <td>
                        <asp:DropDownList  ID="Kolicina7" runat="server" AutoPostBack="true"  onselectedindexchanged="Kolicina7_SelectedIndexChanged" >
                                <asp:ListItem Value="0">0</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                             </asp:DropDownList>
                             <asp:HiddenField ID="KeyHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>' />
                        </td>    
                        </td>        
                    </tr>        
                </table>
            </td>
        <td align="right"><a href="Pocetna.aspx?action=add&ID=<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>"><img  alt="#"  title="Dodaj u košaricu" height="22" src="slike/dodaj221.png" style="border:0" /></a>    
        </td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
         <tr style="background-color:White">
            <td align="right" colspan="2"><a href="#"></a></td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
        </ItemTemplate>
    </asp:Repeater>
</table><br />

<p id="pizze" style="font-family: Georgia; font-size: medium"><b>Pizze i pite</b></p><br />
    <asp:Label ID="Pizze" runat="server"></asp:Label>
    <br />

<table width="60%" cellpadding="5" cellspacing="0" style="background-color:#F2F8E8">
    <asp:Repeater ID="Repeater8" runat="server" EnableViewState="false">
        <ItemTemplate>
        <tr>
            <td style="width:350" align="left">
            <p><%# DataBinder.Eval(Container.DataItem, "ar_naziv") %></p>
            <p style="font-family: verdana; font-size:small; font-style: italic;"><%# DataBinder.Eval(Container.DataItem, "ar_opis") %></p>
            </td>
            <td></td>
        </tr>
        <tr>
             <td style="width:350" valign="bottom">
                <table style="background-color:#DCEAC0; font-size: small; font-family: 'Times New Roman', Times, serif;">
                        <td style="width: 80px"><%# DataBinder.Eval(Container.DataItem, "mj_naziv")%></td>
                        <td style="width: 60px" align="center"><%# DataBinder.Eval(Container.DataItem, "ar_cijena") %> kn</td>
                        <td> Kol. </td>
                        <td>
                        <asp:DropDownList  ID="Kolicina8" runat="server" AutoPostBack="true"  onselectedindexchanged="Kolicina8_SelectedIndexChanged" >
                                <asp:ListItem Value="0">0</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">5</asp:ListItem>
                             </asp:DropDownList>
                             <asp:HiddenField ID="KeyHiddenField" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>' />
                        </td>    
                        </td>        
                    </tr>        
                </table>
            </td>
        <td align="right"><a href="Pocetna.aspx?action=add&ID=<%# DataBinder.Eval(Container.DataItem, "id_artikl") %>"><img  alt="#"  title="Dodaj u košaricu" height="22" src="slike/dodaj221.png" style="border:0" /></a>    
        </td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
         <tr style="background-color:White">
            <td align="right" colspan="2"><a href="#"></a></td>
        </tr>
        <tr style="background-color:White">
            <td align="right" colspan="2"></td>
        </tr>
        </ItemTemplate>
    </asp:Repeater>
</table><br />
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder3">
    Broj posjeta: <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="head">
</asp:Content>

