<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Store.aspx.vb" Inherits="Store" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
            text-align: right; 
        }
        
        .left {
            position: relative;
            left: 10px;
            width: 300px;
            padding: 10px;
        }


        .leftgrid {
            
            position: relative;
            left: 20px;
            padding: 10px;
        }

 
        ul { 
            list-style-type: none;
            position: sticky;
            top: 0; 
            margin: 0; 
            padding: 0; 
            overflow: hidden; 
            z-index: 150;
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
        .columnwidth{ 
            column-width: 200px; 
        }
       

       
    </style>
     <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1" />
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
       
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <span class="auto-style1"><strong>Home</strong></span><ul class="newStyle1"> 
                        <li> <asp:LinkButton ID="LinkButton15" runat="server"><i class="fa fa-home"></i></asp:LinkButton> </li>
                        <li><asp:LinkButton ID="LinkButton1" runat="server">Store</asp:LinkButton></li>         
                        <li> <asp:LinkButton ID="LinkButton3" runat="server">Manager Page</asp:LinkButton> </li>
                        <li> <asp:LinkButton ID="LinkButton13" runat="server">Rewards</asp:LinkButton></li>
                        <li> <asp:LinkButton ID="LinkButton14" runat="server">Checkout</asp:LinkButton></li>
                        &nbsp;</ul>
                    <span class="newStyle1">
                    <br />
                    <br />
                    Promos/Popular Items (needs to be adjusted so it looks more alligned on the site<br />
                    <br />
                    </span>
                    <span class="newStyle1">
                    <br />
                    <br />
                    <br />
                    <br />
                    </span>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <span class="auto-style1"><strong>Store</strong></span>
                    <ul>
                        <li><asp:LinkButton ID="LinkButton4" runat="server"><i class="fa fa-home"></i></asp:LinkButton></li>
                        <li> <asp:LinkButton ID="LinkButton16" runat="server">Store</asp:LinkButton> </li>
                        <li> <asp:LinkButton ID="LinkButton17" runat="server">Manager Page</asp:LinkButton> </li>
                        <li> <asp:LinkButton ID="LinkButton18" runat="server">Rewards</asp:LinkButton> </li>
                        <li> <asp:LinkButton ID="LinkButton19" runat="server">Checkout</asp:LinkButton> </li>

                    </ul>
                    <br />
                    <br />
                    Lists of items with ddl lits (and pictures?)<br />
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style21">Select Item(Fill from sql based off section selection)</td>
                            <td>
                                <asp:DropDownList ID="ddlShopSelect" runat="server" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style11">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style21">Item Picture(pull from ddl above)</td>
                            <td>
                                <asp:Image ID="iStorDDL" runat="server" Height="171px" Width="257px" />
                            </td>
                            <td class="auto-style11">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style22">
                                <br />
                                Select Quantity(just do a ddl up to 10 so the calculations are easier<br /> </td>
                            <td class="auto-style8">
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
                            <td class="auto-style12">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style27">Existing Rewards Member EnterID</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="tbSaleRewards" runat="server"></asp:TextBox>
                                <br />
                            </td>
                            <td class="auto-style13">
                                <asp:GridView ID="gvCustomerInStore" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <EditRowStyle BackColor="#999999" />
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style28">
                                <asp:Button ID="bViewCusRewards" runat="server" Text="View Customer Rewards" Width="236px" />
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style14">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style29">Use Rewards Points on purchase?</td>
                            <td class="auto-style16">
                                <asp:TextBox ID="tbUseRewards" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style15">10 Reward Points is $1 off</td>
                        </tr>
                        <tr>
                            <td class="auto-style29">&nbsp;</td>
                            <td class="auto-style16">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style30">
                                <asp:Button ID="bAddToCart" runat="server" Text="Purchase Items" Width="218px" />
                            </td>
                            <td class="auto-style19"></td>
                            <td class="auto-style20"></td>
                        </tr>
                        <tr>
                            <td class="auto-style30">Total Of purchase</td>
                            <td class="auto-style19">
                                <asp:TextBox ID="tbTransactionTotal" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style20">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style21">Add Customer to rewards Program</td>
                            <td>
                                <asp:LinkButton ID="LinkButton2" runat="server">Add Customer</asp:LinkButton>
                            </td>
                            <td class="auto-style11">&nbsp;</td>
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
                    <span class="auto-style1"><span class="auto-style2">&nbsp;Add Customer to Rewards Program</span></span><br />&nbsp;<ul>
                        <li><asp:LinkButton ID="LinkButton6" runat="server"><i class="fa fa-home"></i></asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinkButton5" runat="server">Store</asp:LinkButton></li>
                        <li> <asp:LinkButton ID="LinkButton20" runat="server">Manager Page</asp:LinkButton> </li>
                        <li> <asp:LinkButton ID="LinkButton21" runat="server">Rewards</asp:LinkButton> </li>
                        <li> <asp:LinkButton ID="LinkButton22" runat="server">Checkout</asp:LinkButton> </li>
                    </ul>
                    &nbsp;<br />
                    <br />
                    Add a customer to the Rewards Program<br />
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style18">Add Customer to rewards program</td>
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
                            <td class="auto-style23">Bonus Reward Points?</td>
                            <td class="auto-style24">
                                <asp:TextBox ID="tbAddCustExtraReward" runat="server"></asp:TextBox>
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
                    <span class="auto-style1">Customer Info</span><br />
                    <ul>
                        <li><asp:LinkButton ID="LinkButton23" runat="server"><i class="fa fa-home"></i></asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinkButton8" runat="server">Store</asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinkButton24" runat="server">Manager Page</asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinkButton7" runat="server">Rewards</asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinkButton25" runat="server">Checkout</asp:LinkButton></li>
                    </ul>
                    <br />
                    <br />
                    If a customer wants to see their info by not make a purchase<br />
                    <br />
                    <table class="nav-justified">
                        <tr>
                            <td>Enter your unique Customer ID</td>
                            <td>
                                <asp:TextBox ID="tbCustomerIDRewards" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Retrive Records</td>
                            <td class="auto-style5">
                                <asp:Button ID="bGetReward" runat="server" Text="Get records" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">Reward Points to date</td>
                            <td class="auto-style7">
                                <asp:TextBox ID="tbRewardPointsLeft" runat="server"></asp:TextBox>
                            </td>
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
                        <tr>
                            <td>Favorite Items purchased</td>
                            <td>Customer Info Shows Rewards</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="gvRewardFav" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
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
                            <td>
                                <asp:GridView ID="gvRewardCustomer" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
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
                    </table>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:View>
                   <asp:View ID="View5" runat="server">
                    
                    <span class="auto-style1"><strong>Manager</strong></span><br />
                    <ul>
                        <li><asp:LinkButton ID="LinkButton9" runat="server"><i class="fa fa-home"></i></asp:LinkButton></li>
                    &nbsp;&nbsp;
                        <li><asp:LinkButton ID="LinkButton10" runat="server">Store</asp:LinkButton></li>
                    &nbsp;&nbsp;
                        <li><asp:LinkButton ID="LinkButton26" runat="server">Manager Page</asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinkButton11" runat="server">Rewards</asp:LinkButton></li>
                    &nbsp;&nbsp;&nbsp;
                        <li><asp:LinkButton ID="LinkButton12" runat="server">Checkout</asp:LinkButton></li>
                    </ul>


                    <!----Shows Favortie items, stock, best customers, total revenue, item revenue -->
                         


 <div id="my-accordion" class="accordion, left">
    <h3>Store Data</h3>
    <div class="accordion-group">
        <div class="accordion-heading">
            <a href="#collapse-year-2012" data-parent="#my-accordion" data-toggle="collapse" class="accordion-toggle btn btn-info">Hide/Show</a>
        </div>
       <div class="accordion-body collapse in" id="collapse-year-2012">
            <div class ="accordion-inner"> 


                <div>
                                 <div class ="container, left"> 
                                        <div class="panel panel-primary" style ="display:inline-block">
                                            <div class="panel-heading"><h3 class ="panel-title">Product Data</h3></div>
                                                <div class ="panel-body"> 
                                                    <div class ="panel panel-info" style ="display:inline-block">
                                                        <div class ="panel-heading">Filter</div>
                                                             <div class="panel-body"> 
                                                                   <asp:RadioButtonList ID="rblProductList" runat="server" AutoPostBack="False">
                                                                    <asp:ListItem>Sort By Price</asp:ListItem>
                                                                    <asp:ListItem>Sort By Inventory</asp:ListItem>
                                                                    <asp:ListItem>Sort by Size</asp:ListItem>
                                                                    </asp:RadioButtonList>

                                                                    <asp:Button ID="btProductOrderBy" runat="server" Text="Submit" />
                                                          </div>
                                                        </div> 
                                                    </div>
                                        <div class ="panel-body" style ="display:inline-block">
                                          <table class ="auto-style2">
                                          
                                                <asp:GridView ID="gvProductOrderBy" runat="server" AutoPostBack = "True" BackColor ="White"  BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
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
                                          </table>
                                             </div>  
                                          </div>
                                  </div> <!-- end demo2  -->
                
                                               <div class="container, left">
                                                            <div class="panel panel-primary" style ="display:inline-block">
                                                                <div class="panel-heading"><h3 class ="panel-title"> Customer Data </h3></div>
                                                                    <div class ="panel-body"> 
                                                                        <div class ="panel panel-info" style ="display:inline-block">
                                                                            <div class ="panel-heading">Filter</div>
                                                                                <div class="panel-body"> 
                                                                                    <asp:RadioButtonList ID="rblSortCustomers" runat="server" AutoPostBack="False">
                                                                                    <asp:ListItem>Sort By Name</asp:ListItem>
                                                                                    <asp:ListItem>Sort By City</asp:ListItem>
                                                                                    <asp:ListItem>Sort by Amount Spent</asp:ListItem>
                                                                                    </asp:RadioButtonList>

                                                                                    <asp:Button ID="btCustomerData" runat="server" Text="Submit" />
                                                                                </div>
                                                                        </div> 
                                                                    </div>

                                                            <div class ="panel-body" style ="display:inline-block">
                                                                     <table class="auto-style2">
                       
                                                                        <asp:GridView ID="gvCustomerMng" runat="server" AutoPostBack = "Trye" BackColor="White" BorderColor="#999999"                 BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
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
                                
                
                                                                     </table>
                                                                </div>
                                                              </div>
                                             </div> <!--end demo4 --> 
                                                <div class ="container, left"> 
                                                        <div class="panel panel-primary" style ="display:inline-block">
                                                            <div class="panel-heading"><h3 class ="panel-title">Transaction Data</h3></div>
                                                                <div class ="panel-body"> 
                                                                    <div class ="panel panel-info" style ="display:inline-block">
                                                                        <div class ="panel-heading">Filter</div>
                                                                             <div class="panel-body"> 
                                                                                   <asp:RadioButtonList ID="rblSortTransactions" runat="server" AutoPostBack="False" Font-Names="Arial">
                                                                                    <asp:ListItem>Sort By Quantity</asp:ListItem>
                                                                                    <asp:ListItem>Sort By Product</asp:ListItem>
                                                                                    <asp:ListItem>Sort by Transaction</asp:ListItem>
                                                                                    </asp:RadioButtonList>
                                                                                    <asp:Button ID="btFilterTransactions" runat="server" Text="Submit" />
                                                                          </div>
                                                                        </div> 
                                                                    </div>
                                           
                                                        <div class ="panel-body" style ="display:inline-block">
                                                          <table class ="auto-style2">
                                          
                                                                <asp:GridView ID="gvInventMng" runat="server" AutoPostBack = "True" BackColor ="White"  BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
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
                                                          </table>
                                                         </div>  
                                                     </div>
                                               </div> <!-- end demo 3 --> 
                </div>
             
           </div>
         </div> <!-- .accordion-inner -->
       </div><!-- .accordion-body -->
    </div><!-- .accordion-group -->
                       
             <div id="my-accordion2" class="accordion, left" >
                <h3>Inventory Management</h3>
                    <div class="accordion-group">
                            <div class="accordion-heading">
                                <a href="#collapse-year-2013" data-parent="#my-accordion2" data-toggle="collapse" class="accordion-toggle btn btn-info">Hide/Show</a>
                                            </div>
                                                <div class="accordion-body collapse in" id="collapse-year-2013">
                                                        <div class ="accordion-inner, left">
                                                            <div class="container, left"> </div>
                                                                <div class ="panel panel-primary" style="display:inline-block">
                                                                    <div class="panel-heading"><h3 class="panel-title">Inventory Update and Add</h3></div>
                                                                        <div class="panel-body"> 

                                                                    <div>
                                                                        <p></p>
                                                                         <asp:DropDownList ID="ddlInventoryFill" runat="server" AutoPostBack="True">
                                                                         </asp:DropDownList>
                                                                        <p></p>
                                                                        <p>Product ID</p>
                                                                        <asp:TextBox ID="tbProductID" runat="server"></asp:TextBox>
                                                                        <p></p>
                                                                        <p>Product Name</p>
                           
                                                                        <asp:TextBox ID="tbProductName" runat="server"></asp:TextBox>
                                                                        <p></p>
                                                                        <p> Product Price</p>

                                                                        <asp:TextBox ID="tbProductPrice" runat="server"></asp:TextBox>
                                                                        <p></p>
                                                                        <p>Product Quantity</p>
 
                                                                        <asp:TextBox ID="tbProductInventory" runat="server"></asp:TextBox>
                                                                        <p></p>
                                                                        <p>Product Size</p>

                                                                        <asp:TextBox ID="tbProductSize" runat="server"></asp:TextBox>
                                                                        <p> </p>
                                                                        <asp:Button ID="btAddInventory" runat="server" Text="Add New" Width="116px" />
                                                                        <p></p>
                                                                        <asp:Button ID="btUpdateInventory" runat="server" Text="Update" Width="116px" />
                                                                        <p></p>
                                                                        <asp:Button ID="btInvMgmtClear" runat="server" Text="Clear" Width="116px" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                           
                                                              
                                                          </div>
                                                  </div>
                    </div>
                </div>

         

                       

 <script>
     jQuery('Store.aspx').ready(function() {
        jQuery('#my-accordion, #my-accordion2').on('show hide', function() {
            jQuery(this).css('height', 'auto');
        });
        Query('#my-accordion, #my-accordion2').collapse({ parent: true, toggle: true }); 
        });

</script> 




                          

                
                    <br />
                    <br />
                    <br />
                       
              </asp:View>
    </asp:MultiView>

       
    </form>
</body>
</html>
