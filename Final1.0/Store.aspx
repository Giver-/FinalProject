<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Store.aspx.vb" Inherits="Store" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style7 {
            font-size: large;
        }
        .auto-style11 {
            height: 394px;
        }
        .auto-style12 {
            height: 250px;
            width: 684px;
        }
        .auto-style14 {
            height: 250px;
            width: 285px;
        }
        .auto-style15 {
            height: 250px;
            width: 393px;
        }
        .auto-style16 {
            height: 16px;
            font-size: xx-large;
            text-align: center;
        }
        .auto-style17 {
            width: 458px;
        }
        .auto-style18 {
            width: 460px;
        }
        .auto-style19 {
            width: 460px;
            height: 91px;
        }
        .auto-style20 {
            height: 91px;
        }
        .auto-style21 {
            width: 460px;
            height: 39px;
        }
        .auto-style22 {
            height: 39px;
        }
        .auto-style23 {
            width: 460px;
            height: 32px;
        }
        .auto-style24 {
            height: 32px;
        }
        .auto-style25 {
            width: 460px;
            height: 56px;
        }
        .auto-style26 {
            height: 56px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <span class="auto-style1"><strong>Home</strong></span><br />
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server">To Store</asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton3" runat="server">To Manager Page</asp:LinkButton>
                    <br />
                    <br />
                    Promos/Popular Items (needs to be adjusted so it looks more alligned on the site<br />
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style3" colspan="3"><strong>Deals of the day! </strong><span class="auto-style7">(click to purchse)</span></td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:ImageButton ID="ibDeal1" runat="server" Height="243px" Width="442px" />
                            </td>
                            <td class="auto-style15">
                                <asp:ImageButton ID="ibDeal2" runat="server" Height="239px" Width="455px" />
                            </td>
                            <td class="auto-style12">
                                <asp:ImageButton ID="ibDeal3" runat="server" Height="241px" Width="415px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16" colspan="3"><strong>Pick Section</strong><span class="auto-style7">(Click to select)</span></td>
                        </tr>
                        <tr>
                            <td class="auto-style11" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:ImageButton ID="ibLinkToMens" runat="server" Height="350px" ImageUrl="~/NikeMens.jpg" Width="450px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:ImageButton ID="ibLinkToWomens" runat="server" Height="350px" ImageUrl="~/Nike.jpg" Width="450px" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <span class="auto-style1"><strong>Store</strong></span><br />
                    <br />
                    <asp:LinkButton ID="LinkButton2" runat="server">To Cart</asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton4" runat="server">Home</asp:LinkButton>
                    <br />
                    <br />
                    Lists of items with ddl lits (and pictures?)<br />
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style17">Select Item(Fill from sql based off section selection)</td>
                            <td>
                                <asp:DropDownList ID="ddlShopSelect" runat="server" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style17">Item Picture(pull from ddl above)</td>
                            <td>
                                <asp:Image ID="iStorDDL" runat="server" Height="171px" Width="257px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style17">
                                <br />
                                Select Quantity(just do a ddl up to 10 so the calculations are easier<br /> </td>
                            <td>
                                <asp:DropDownList ID="ddlShopQuantity" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Select Quantity</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem Value="9">8</asp:ListItem>
                                    <asp:ListItem Value="9"></asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style17">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style17">
                                <asp:Button ID="bAddToCart" runat="server" Text="Add itme(s) to cart" Width="218px" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <span class="auto-style1"><strong>Cart</strong></span><br />
                    <asp:LinkButton ID="LinkButton5" runat="server">Back To Store</asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton6" runat="server">CheckOut</asp:LinkButton>
                    <br />
                    <br />
                    Shows items up for purchase can remove items and shows total<br />
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style18">Cart Items</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style18">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style21">Existing Customer? Enter your customerID#(Fill boxes below with info)</td>
                            <td class="auto-style22">
                                <asp:TextBox ID="tbEnterExistingCust" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19"></td>
                            <td class="auto-style20">
                                <asp:Button ID="bEnterExistCust" runat="server" Text="Enter" Width="116px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style18">New customer?</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style18">Name </td>
                            <td>
                                <asp:TextBox ID="tbNCName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style18">Email</td>
                            <td>
                                <asp:TextBox ID="tbNCEmail" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style18">Address</td>
                            <td>
                                <asp:TextBox ID="tbNCAddress" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style23">Credit Card #</td>
                            <td class="auto-style24">
                                <asp:TextBox ID="tbNCCreditCard" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style25"></td>
                            <td class="auto-style26">
                                <asp:Button ID="bAddCustomer" runat="server" Text="AddCustomer" Width="151px" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <span class="auto-style1"><strong>CheckOut</strong></span><br />
                    <asp:LinkButton ID="LinkButton7" runat="server">Cart</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton8" runat="server">Store</asp:LinkButton>
                    <br />
                    <br />
                    Enter Customer Info Or select an existing customer from ddl<br />
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View5" runat="server">
                    <span class="auto-style1"><strong>Manager</strong></span><br />
                    <asp:LinkButton ID="LinkButton9" runat="server">Home</asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton10" runat="server">Store</asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton11" runat="server">Carrt</asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton12" runat="server">CheckOut</asp:LinkButton>
                    <br />
                    <br />
                    Shows Favortie items, stock, best customers, total revenue, item revenue
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:View>
            </asp:MultiView>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
