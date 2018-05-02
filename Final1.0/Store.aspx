<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Store.aspx.vb" Inherits="Store" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
            font: Lato; 
            text-align: right; 
        }
        h2, h3 { 
            font-family: Lato; 
        }
        
        
        .left {
            position: relative;
            left: 10px;
            width: 300px;
            padding: 10px;
        }
                .center {
  
            
            width: 200px;
            text-align: center; 
}   


        .leftgrid {
            
            position: relative;
            left: 20px;
            padding: 10px;
        }
        .hometext {
            color: white; 
            
        }
 
        ul { 
            list-style-type: none;
            position: sticky;
            top: 0; 
            margin: 0; 
            padding: 0; 
            overflow: hidden; 
            z-index: 150;
            background-color: #526881; 
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
            background-color: #ededed; 
        }
        .columnwidth{ 
            column-width: 200px; 
        }
        .panelstyle { 
            width: 350px;
            height: 125px; 
            padding: 20px; 
            background-color: lightblue; 
        }

       
       html *
    {

       font-family: Lato;
    }   
     
     body{


    -webkit-animation: fadein 2s; /* Safari, Chrome and Opera > 12.1 */

}
        @-webkit-keyframes fadein {
            from { opacity: 0; }
            to   { opacity: 1; }

         }
        .auto-style2 {
            height: 29px;
        }
        .auto-style3 {
            height: 51px;
        }
        .auto-style4 {
            height: 46px;
        }
        .glyphicon.glyphicon-shopping-cart {
            font-size: 50px;
            color: white; 
}
        .glyphicon.glyphicon-user {
            font-size: 50px;
            color: white; 
} 

  .glyphicon.glyphicon-tag { 
            font-size: 50px; 
            color: white; 
  }
 .glyphicon.glyphicon-star{
            font-size: 50px; 
            color: white; 
 }
        .auto-style5 {
            height: 27px;
        }
        .auto-style6 {
            height: 56px;
        }
        .auto-style7 {
            height: 28px;
        }
        .auto-style8 {
            height: 60px;
        }
        .auto-style9 {
            height: 61px;
        }
        .auto-style10 {
            height: 52px;
        }
    </style>

     <meta name="viewport" content="width=device-width, initial-scale=1"/>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
     <meta name="viewport" content="width=device-width, initial-scale=1" />
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato"/>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
 


</head>



  
<body>
    <form id="form1" runat="server">
      
            <asp:MultiView ID="MultiView1" runat="server">

                <asp:View ID="View1" runat="server">
                    <div class="jumbotron text-center" style ="background:lightblue">
                      <h1 style ="color:white">Welcome to Deadstock</h1>
                      <p style="color:white"><i>Enterprise Operation Solution</i></p> 
                    </div>

                    <ul class="newStyle1"> 
                        <li> <asp:LinkButton ID="LinkButton15" runat="server"><i class="glyphicon glyphicon-home"></i></asp:LinkButton> </li>
                        <li><asp:LinkButton ID="LinkButton1" runat="server">Store</asp:LinkButton></li>         
                        <li> <asp:LinkButton ID="LinkButton3" runat="server">Manager Page</asp:LinkButton> </li>
                        <li> <asp:LinkButton ID="LinkButton13" runat="server">Rewards</asp:LinkButton></li>
                        <li> <asp:LinkButton ID="LinkButton14" runat="server">Customers</asp:LinkButton></li>
                        &nbsp;</ul>
              <div class="well">
                  <div class ="container">
                      <div class ="col-lg-4"></div>
                      <div class ="col-lg-4">
                        <div class="panel panel-default, center">
                             <div class="panel-body, panelstyle"><i class ="glyphicon glyphicon-shopping-cart"></i><h4 class ="hometext"><asp:LinkButton ID="LinkButton27" runat="server">Enter Store</asp:LinkButton></h4></div>
                        </div>
                        <div class="panel panel-default, center">
                             <div class="panel-body, panelstyle"><i class ="glyphicon glyphicon-user"></i><h4 class ="hometext"><asp:LinkButton ID="LinkButton28" runat="server">Enter Manager Area</asp:LinkButton></h4></div>
                        </div>
                        <div class="panel panel-default, center" >
                             <div class="panel-body, panelstyle"><i class = "glyphicon glyphicon-star"></i><h4 class ="hometext"><asp:LinkButton ID="LinkButton29" runat="server">Enter Rewards Center</asp:LinkButton></h4></div>
                        </div>
                        <div class="panel panel-default, center">
                             <div class="panel-body, panelstyle"><i class ="glyphicon glyphicon-tag"></i><h4 class ="hometext"><asp:LinkButton ID="LinkButton30" runat="server">Enter Customer Area</asp:LinkButton></h4></div>
                        </div>
                        </div>
                        <div class="col-lg-4"></div>
              
                   </div>
                  
                </div>
                 
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="left"><h2>Deadstock</h2></div>
                    <ul>
                        <li><asp:LinkButton ID="LinkButton4" runat="server"><i class="glyphicon glyphicon-home"></i></asp:LinkButton></li>
                        <li> <asp:LinkButton ID="LinkButton16" runat="server">Store</asp:LinkButton> </li>
                        <li> <asp:LinkButton ID="LinkButton17" runat="server">Manager Page</asp:LinkButton> </li>
                        <li> <asp:LinkButton ID="LinkButton18" runat="server">Rewards</asp:LinkButton> </li>
                        <li> <asp:LinkButton ID="LinkButton19" runat="server">Customers</asp:LinkButton> </li>
                    </ul>
             <div class ="left"><h3>Store</h3>
                <div class="well" style="width:1300px"> 
                    <table>
                        <tr>
                            <td style="padding:10px">Select Item</td>
                            <td>
                                <asp:DropDownList ID="ddlShopSelect" runat="server" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>

                        </tr>
                        <tr>
                            <td style="padding:10px">
                              Select Quantity</td>
                            <td >
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
                            <td style="padding:10px" >Select Size</td>
                            <td >
                                <asp:DropDownList ID="ddlSelectSize" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Select a size</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>13</asp:ListItem>
                                    <asp:ListItem>14</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style ="padding:10px">Enter Member ID</td>
                            <td >
                                <asp:TextBox ID="tbSaleRewards" runat="server"></asp:TextBox>
                      
                            </td>
                        </tr>
                         <tr>
                            <td style="padding:20px"></td>
                            <td> 
                                <asp:GridView ID="gvCustomerInStore" runat="server" CellPadding="10" ForeColor="#333333" GridLines="None" CssClass="w3-table-all" >
                                   
                       
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
                            <td style="padding:10px">
                                <asp:Button ID="bViewCusRewards" runat="server" Text="View Customer Rewards" Width="215px" CssClass="btn btn-primary" />
                            </td>

                        </tr>
                        <tr>
                            <td style="padding:10px">Use Rewards Points?</td>
                            <td >
                                <asp:TextBox ID="tbUseRewards" runat="server"></asp:TextBox>
                            </td>
                            
                        </tr>
                        <tr>
                            <td style="padding:10px">
                                <asp:Button ID="bPurchaseItem" runat="server" Text="Log Purchase" CssClass="btn btn-primary" Width="215px" />
                            </td>
                            <td class="auto-style19"></td>
                            <td class="auto-style20"></td>
                        </tr>
                        <tr>
                            <td style="padding:10px">Total</td>
                            <td >
                                <asp:Label ID="lblCost" runat="server" Text="Label" Visible="False"></asp:Label>
                            </td>
                            <td >&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="padding:10px"><asp:LinkButton ID="LinkButton2" runat="server">Add Customer to Rewards Program</asp:LinkButton></td>
                            <td>
                                
                            </td>
                            <td >&nbsp;</td>
                        </tr>
                    </table>
                    </div>
               </div> 
 
                </asp:View>
                <asp:View ID="View3" runat="server">
                   <div class ="left"><h2>Deadstock</h2></div><ul>
                        <li><asp:LinkButton ID="LinkButton6" runat="server"><i class="glyphicon glyphicon-home"></i></asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinkButton5" runat="server">Store</asp:LinkButton></li>
                        <li> <asp:LinkButton ID="LinkButton20" runat="server">Manager Page</asp:LinkButton> </li>
                        <li> <asp:LinkButton ID="LinkButton21" runat="server">Rewards</asp:LinkButton> </li>
                        <li> <asp:LinkButton ID="LinkButton22" runat="server">Customers</asp:LinkButton> </li>
                    </ul>


                <div class="left">
                    <h3>Add a Customer to the Rewards Program</h3><br />
                    <div class ="well" style ="width:500px">
                    <table>
                        <tr>

                            <td >Name </td>
                            <td style="padding: 10px">
                                <asp:TextBox ID="tbNCName" runat="server"></asp:TextBox>
                     
                            </td>
                        </tr>
                        <tr>
                            <td >Email</td>
                            <td style ="padding:10px">
                                <asp:TextBox ID="tbNCEmail" runat="server"></asp:TextBox>
                                <br />
                            </td>
                        </tr>
                        <tr >
                            <td >Address</td>
                            <td style ="padding:10px">
                                <asp:TextBox ID="tbNCAddress" runat="server"></asp:TextBox>
                                <br /> 
                            </td>
                        </tr>
                        <tr>
                            <td >City</td>
                            <td style ="padding:10px"> 
                                <asp:TextBox ID="tbNCCity" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>State</td>
                            <td style="padding: 10px">
                                <asp:TextBox ID="tbNCState" runat="server"></asp:TextBox>
                                
                            </td>
                        </tr>
                        <tr>
                            <td >Zip Code</td>
                            <td style ="padding:10px">
                                <asp:TextBox ID="tbNCZip" runat="server"></asp:TextBox>
                                <br /> 
                            </td>
                        </tr>
                        <tr>
                            <td >Credit Card Number</td>
                            <td style ="padding:10px">
                                <asp:TextBox ID="tbNCCreditCard" runat="server"></asp:TextBox>
                                <br /> 
                            </td>
                        </tr>
                        <tr >
                            <td >Bonus Reward Points?</td>
                            <td style="padding:10px">
                                <asp:TextBox ID="tbAddCustExtraReward" runat="server"></asp:TextBox>
                                <br /> 
                            </td>
                        </tr>
                        <tr>
                            <td> </td>
                            <td style ="padding:10px" >
                                <asp:Button ID="bAddCustomer" runat="server" Text="Add Customer" Width="165px" CssClass="btn btn-primary" />
                                <br /> 
                            </td>
                        </tr>
                    </table>
                    </div>
                </div>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <div class="left"><h2>Deadstock</h2></div>
                    <ul>
                        <li><asp:LinkButton ID="LinkButton23" runat="server"><i class="glyphicon glyphicon-home"></i></asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinkButton8" runat="server">Store</asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinkButton24" runat="server">Manager Page</asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinkButton7" runat="server">Rewards</asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinkButton25" runat="server">Customers</asp:LinkButton></li>
                    </ul>
                    <div class="left"><h3>Customer Area</h3></div>
                <div class ="well">
                    <table class="nav-justified">
                        <tr>
                            <td style="padding:10px">Enter Unique Customer ID</td>
                            <td>
                                <asp:TextBox ID="tbCustomerIDRewards" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:10px">Retrive Records</td>
                            <td class="auto-style5">
                                <asp:Button ID="bGetReward" runat="server" Text="Get Records" CssClass="btn btn-primary"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:10px">Reward Points to Date</td>
                            <td class="auto-style7">
                                <asp:TextBox ID="tbRewardPointsLeft" runat="server"></asp:TextBox>
                            </td>

                            <!-----<td>Favorite Items purchased</td>--->
                            <!----<td>Customer Info Shows Rewards</td>--->
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="gvRewardFav" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" CssClass="w3-table-all">
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
                                <asp:GridView ID="gvRewardCustomer" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" CssClass="w3-table-all">
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
                </div>
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
                    
                    <div class ="left"> <h2>Deadstock</h2></div>
                    <ul>
                        <li><asp:LinkButton ID="LinkButton9" runat="server"><i class="glyphicon glyphicon-home"></i></asp:LinkButton></li>
                    &nbsp;&nbsp;
                        <li><asp:LinkButton ID="LinkButton10" runat="server">Store</asp:LinkButton></li>
                    &nbsp;&nbsp;
                        <li><asp:LinkButton ID="LinkButton26" runat="server">Manager Page</asp:LinkButton></li>
                        <li><asp:LinkButton ID="LinkButton11" runat="server">Rewards</asp:LinkButton></li>
                    &nbsp;&nbsp;&nbsp;
                        <li><asp:LinkButton ID="LinkButton12" runat="server">Customers</asp:LinkButton></li>
                    </ul>


                    <!----Shows Favortie items, stock, best customers, total revenue, item revenue -->
                         
<div class="left"><h3>Manager Area</h3></div>
<div class="col-sm-8, well">
 <div id="my-accordion" class="accordion, left">
    <h4>Store Data</h4>

    <div class="accordion-group">
        <div class="accordion-heading">
            <a href="#collapse-year-2012" data-parent="#my-accordion" data-toggle="collapse" class="accordion-toggle btn btn-primary">Hide/Show</a>
        </div>
       <div class="accordion-body collapse in" id="collapse-year-2012">
            <div class ="accordion-inner"> 


                <div>
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
                                                                                    <asp:Button ID="btFilterTransactions" runat="server" Text="Submit" CssClass="btn btn-default" />
                                                                          </div>
                                                                        </div> 
                                                                    </div>
                                           
                                                        <div class ="panel-body" style ="display:inline-block">
                                                          <table class ="auto-style2">
                                          
                                                                <asp:GridView ID="gvInventMng" runat="server" AutoPostBack = "True" BackColor ="White"  BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" CssClass="w3-table-all">
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

                                                                    <asp:Button ID="btProductOrderBy" runat="server" Text="Submit" CssClass="btn btn-default" />
                                                          </div>
                                                        </div> 
                                                    </div>
                                        <div class ="panel-body" style ="display:inline-block">
                                          <table class ="auto-style2">
                                          
                                                <asp:GridView ID="gvProductOrderBy" runat="server" AutoPostBack = "True" BackColor ="White"  BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" CssClass="w3-table-all">
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

                                                                                    <asp:Button ID="btCustomerData" runat="server" Text="Submit" CssClass="btn btn-default" />
                                                                                </div>
                                                                        </div> 
                                                                    </div>

                                                            <div class ="panel-body" style ="display:inline-block">
                                                                     <table class="auto-style2">
                       
                                                                        <asp:GridView ID="gvCustomerMng" runat="server" AutoPostBack = "Trye" BackColor="White" BorderColor="#999999"                 BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" CssClass="w3-table-all">
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

                </div>
             
           </div>
         </div> <!-- .accordion-inner -->
       </div><!-- .accordion-body -->
    </div><!-- .accordion-group -->
</div>            
          <div class="col-sm-2, well"> <div id="my-accordion2" class="accordion, left" >
                <h4>Inventory Management</h4>
                    <div class="accordion-group">
                            <div class="accordion-heading">
                                <a href="#collapse-year-2013" data-parent="#my-accordion2" data-toggle="collapse" class="accordion-toggle btn btn-primary">Hide/Show</a>
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

                                                                        <asp:Button ID="btAddInventory" runat="server" Text="Add New" Width="116px" CssClass="btn btn-default" />
                                                                        <p></p>
                                                                        <asp:Button ID="btUpdateInventory" runat="server" Text="Update" Width="116px" CssClass="btn btn-default" />
                                                                        <p></p>
                                                                        <asp:Button ID="btInvMgmtClear" runat="server" Text="Clear" Width="116px" CssClass="btn btn-default" />
                                                                    </div>
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
<footer class="w3-center w3-lightblue w3-padding-64" style="background:#9f9f9f; height:300px;  position:relative; z-index:20;" > 

    <!--Copyright-->
 
  <div class="w3-xlarge w3-section">

    <i class="fa fa-linkedin w3-hover-opacity" style="color:white" ><a href="https://www.linkedin.com/feed/"></a></i>


  </div>
  <p style="color:white"><strong>By Jared Garalde and Ryan Griffin</strong></p>

</footer>
</body>
</html>
