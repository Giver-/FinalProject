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
            width: 1883px;
        }
        .auto-style7 {
            font-size: large;
        }
        .auto-style11 {
            height: 394px;
            width: 1883px;
        }
        .auto-style14 {
            height: 176px;
            width: 1883px;
            text-align: center;
        }
        .auto-style16 {
            height: 16px;
            font-size: xx-large;
            text-align: center;
            width: 1883px;
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

        ul { 
            list-style-type: none; 
            margin: 0; 
            padding: 0; 
            overflow: hidden; 
            background-color: #0094ff; 
        }
        li { 
            float: left; 
        }
        li a { 
         display: block; 
         color: white; 
         text-align: center; 
         padding: 14px 16px; 
         text-decoration: none; 
        }
        li a:hover{ 
            background-color: #898787; 
        }
        .newStyle1 {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <span class="newStyle1"><strong>Home</strong><br />
                    <br />
                    </span>
                    <ul class="newStyle1"> 
                        <li><asp:LinkButton ID="LinkButton1" runat="server">Store</asp:LinkButton></li>
                        &nbsp;&nbsp;
                        <li> <asp:LinkButton ID="LinkButton3" runat="server">Manager Page</asp:LinkButton> </li>
                        &nbsp;</ul>
                    <span class="newStyle1">
                    <br />
                    <br />
                    Promos/Popular Items (needs to be adjusted so it looks more alligned on the site<br />
                    <br />
                    </span>
                    <table class="newStyle1">
                        <tr>
                            <td class="auto-style3">Popular Items<strong> </strong><span class="auto-style7">(click to purchse)</span></td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:ImageButton ID="ibDeal1" runat="server" Height="100px" Width="100px" />
                                <asp:ImageButton ID="ibDeal2" runat="server" Height="100px" Width="100px" />
                                <asp:ImageButton ID="ibDeal3" runat="server" Height="100px" Width="100px" />
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Pick Section</strong><span class="auto-style7">(Click to select)</span></td>
                        </tr>
                        <tr>
                            <td class="auto-style11">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:ImageButton ID="ibLinkToMens" runat="server" Height="350px" ImageUrl="~/NikeMens.jpg" Width="450px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:ImageButton ID="ibLinkToWomens" runat="server" Height="350px" ImageUrl="~/Nike.jpg" Width="450px" />
                            </td>
                        </tr>
                    </table>
                    <span class="newStyle1">
                    <br />
                    <br />
                    <br />
                    <br />
                    </span>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <span class="auto-style1"><strong>Store</strong></span><br />
                    <br />
                    &nbsp;&nbsp;
                    <ul> 
                    <li> <asp:LinkButton ID="LinkButton4" runat="server">Home</asp:LinkButton> </li> 
                     </ul> 
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
                        <tr>
                            <td class="auto-style17">Finished adding Items? Continue to your cart &gt;&gt;&gt;&gt;&gt;</td>
                            <td>
                                <asp:LinkButton ID="LinkButton2" runat="server">To Cart</asp:LinkButton>
                            </td>
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
                    Rewards<br />
                    <ul>
                        <li><asp:LinkButton ID="LinkButton5" runat="server">Store</asp:LinkButton></li>
                        &nbsp;&nbsp;
                        <li><asp:LinkButton ID="LinkButton6" runat="server">Checkout</asp:LinkButton></li>
                     </ul>
                    &nbsp;<br />
                    <br />
                    Shows items up for purchase can remove items and shows total<br />
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style18">Your Cart Items</td>
                            <td>
                                <asp:GridView ID="gvCart" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style18">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style21">Existing Customer? Select your customerID#(Fill boxes below with info)</td>
                            <td class="auto-style22">
                                <asp:DropDownList ID="ddlSelectCustomerID" runat="server" AutoPostBack="True">
                                </asp:DropDownList>
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
                            <td class="auto-style18">City</td>
                            <td>
                                <asp:TextBox ID="tbNCCity" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style18">State</td>
                            <td>
                                <asp:TextBox ID="tbNCState" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style18">Zip code</td>
                            <td>
                                <asp:TextBox ID="tbNCZip" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style23">Credit Card #</td>
                            <td class="auto-style24">
                                <asp:TextBox ID="tbNCCreditCard" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style25">Add your info then select from the ddl</td>
                            <td class="auto-style26">
                                <asp:Button ID="bAddCustomer" runat="server" Text="Add Customer" Width="151px" />
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
                    <ul><li><asp:LinkButton ID="LinkButton7" runat="server">Rewards</asp:LinkButton></li>
                    &nbsp;&nbsp;&nbsp;
                    <li><asp:LinkButton ID="LinkButton8" runat="server">Store</asp:LinkButton></li></ul>
                    <br />
                    <br />
                    Enter Customer Info Or select an existing customer from ddl<br />
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View5" runat="server">
                    
                    <span class="auto-style1"><strong>Manager</strong></span><br />
                    <ul>
                        <li><asp:LinkButton ID="LinkButton9" runat="server">Home</asp:LinkButton></li>
                    &nbsp;&nbsp;
                        <li><asp:LinkButton ID="LinkButton10" runat="server">Store</asp:LinkButton></li>
                    &nbsp;&nbsp;
                        <li><asp:LinkButton ID="LinkButton11" runat="server">Rewards</asp:LinkButton></li>
                    &nbsp;&nbsp;&nbsp;
                        <li><asp:LinkButton ID="LinkButton12" runat="server">Checkout</asp:LinkButton></li>
                    </ul>
                    <br />
                    <br />
                    Shows Favortie items, stock, best customers, total revenue, item revenue
                    <br />
                    <br />
                    Jared: Add inventory<br />
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="gvCustomerMng" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                                    <AlternatingRowStyle BackColor="#CCCCCC" />
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                </asp:GridView>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
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
