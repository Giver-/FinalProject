<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Store.aspx.vb" Inherits="Store" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
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
                    Promos/Popular Items<br />
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
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <span class="auto-style1"><strong>Cart</strong></span><br />
                    <asp:LinkButton ID="LinkButton5" runat="server">Back To Store</asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton6" runat="server">CheckOut</asp:LinkButton>
                    <br />
                    Shows items up for purchase can remove items and shows total<br />
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
