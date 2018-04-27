<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ManagerLogin.aspx.vb" Inherits="ManagerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style> 
        .center {
            margin: auto;
            width: 50%;
            text-align: center;
}           

        
        body {
            background: #0094ff
        }
        div {
    width: 300px;
    height: 220px;


    position: absolute;
    top:0;
    bottom: 0;
    left: 0;
    right: 0;

    margin: auto;
}
        .rounded {
            border-radius: 5px;
            
        }
        .shadow {
            box-shadow: 5px 5px #808080;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       <div>
           
        <div class ="panel panel-primary, rounded, shadow">
            <div class ="panel-body">
            <p></p>
            <h3 class ="centermargin">Manager Sign In</h3>
                <p></p>
             
                <asp:TextBox ID="tbManagerID" runat="server" CssClass="rounded"></asp:TextBox>
                <p></p>
                <asp:TextBox ID="tbManagerPW" runat="server" TextMode="Password" CssClass="rounded"></asp:TextBox>
                <p></p>
                <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-secondary" />

            </div> <!--panel-body-->
        </div> <!---panel default --> 
      </div>
       
    </form>

</body>
</html>
