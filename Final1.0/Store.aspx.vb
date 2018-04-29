Imports System.Data
Imports System.Data.SqlClient

Partial Class Store
    Inherits System.Web.UI.Page

    Public Shared con As New SqlConnection("Data Source=cb-ot-devst04.ad.wsu.edu;Initial Catalog=MF81ryan.j.griffin;Persist Security Info=True; User ID=ryan.j.griffin;Password=d3a8e399")


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Request.UrlReferrer IsNot Nothing Then
            Dim previousPageUrl As String = Request.UrlReferrer.AbsoluteUri
            Dim previousPageName As String = System.IO.Path.GetFileName(Request.UrlReferrer.AbsolutePath)
            Dim managePage As String = "ManagerLogin.aspx"
            If managePage = previousPageName Then
                MultiView1.ActiveViewIndex = 4
                previousPageName = Nothing
            End If
        End If
    End Sub




#Region "Update and clear"
    Private Sub Store_Init(sender As Object, e As EventArgs) Handles Me.Init

        FILLDDLProductsList()
        FillManagmentCustomers()
        FillTransactionTable()
        FillProductTable()
        FillDdlInvMng()

        MultiView1.ActiveViewIndex = 0

        MaintainScrollPositionOnPostBack = True

    End Sub

#End Region
    'Making Sale needs work
#Region "Making A sale"
    Protected Sub bPurchaseItem_Click(sender As Object, e As EventArgs) Handles bPurchaseItem.Click

        Dim cmdInsertProductSale As New SqlCommand("INSERT pTransactionHistory (ProductID, ProductName, Quantity, CustomerID) VALUES (@p1, @p2, @p3, @p4)", con)

        Dim decRewardCalc As New Decimal

        With cmdInsertProductSale.Parameters
            .Clear()
            .AddWithValue("@p1", ddlShopSelect.SelectedValue)
            .AddWithValue("@p2", ddlShopSelect.SelectedItem.Text)
            .AddWithValue("@p3", ddlShopQuantity.SelectedValue)
            .AddWithValue("@p4", tbSaleRewards.Text)
        End With

        Dim updateCustomer As New SqlCommand("UPDATE pCustomers SET TotalOrders += 1, RewardPoints += @p2 WHERE CustomerID = @p1", con)
        Dim updateFavorites As New SqlCommand("UPDATE pFavorites SET TimesPurchased += @p2 WHERE ProductID = @p1", con)
        Dim updateInventory As New SqlCommand("UPDATE pProducts SET ProductInventory -= @p2 WHERE ProductID = @p1", con)

        PurchasePrice *= ddlShopQuantity.SelectedValue

        If IsNumeric(tbUseRewards.Text) = True Then

            PurchasePrice -= (CDec(tbUseRewards.Text) / 10)
            decRewardCalc -= CDec(tbUseRewards.Text)
            decRewardCalc += (PurchasePrice / 5)

        Else
            decRewardCalc = (PurchasePrice / 5)
        End If

        With updateCustomer.Parameters
            .Clear()
            .AddWithValue("@p1", tbSaleRewards.Text)
            .AddWithValue("@p2", decRewardCalc)
        End With

        With updateFavorites.Parameters
            .Clear()
            .AddWithValue("@p1", ddlShopSelect.SelectedValue)
            .AddWithValue("@p2", ddlShopQuantity.SelectedValue)
        End With

        With updateInventory.Parameters
            .Clear()
            .AddWithValue("@p1", ddlShopSelect.SelectedValue)
            .AddWithValue("@p2", ddlShopQuantity.SelectedValue)
        End With

        Try
            If con.State = ConnectionState.Closed Then con.Open()
            cmdInsertProductSale.ExecuteNonQuery()
            updateInventory.ExecuteNonQuery()
            updateFavorites.ExecuteNonQuery()
            updateCustomer.ExecuteNonQuery()

            Response.Write("Sale Completed")
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            con.Close()
        End Try
        tbTransactionTotal.Text = PurchasePrice
    End Sub

#End Region

#Region "Fill Product list DDL"
    Public Shared PurchasePrice As Decimal
    Private Sub FILLDDLProductsList()
        Dim SelectProduct As New SqlDataAdapter("SELECT ProductID, ProductName FROM pProducts", con)
        Dim dtProduct As New DataTable

        Try
            SelectProduct.Fill(dtProduct)

            With ddlShopSelect

                .DataSource = dtProduct
                .DataValueField = "ProductID"
                .DataTextField = "ProductName"
                .DataBind()
                .Items.Insert(0, "Select a product")
            End With
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub ddlShopSelect_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlShopSelect.SelectedIndexChanged

        Dim daGetSawyer As New SqlDataAdapter("SELECT * FROM [pProducts] WHERE ProductID = @p1", con)
        Dim dtOneSawyer As New DataTable

        With daGetSawyer.SelectCommand.Parameters
            .Clear()
            .AddWithValue("@p1", ddlShopSelect.SelectedValue)
        End With

        Try
            daGetSawyer.Fill(dtOneSawyer)

            With dtOneSawyer.Rows(0)

                PurchasePrice = .Item("ProductPrice")

            End With
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

    End Sub

#End Region

#Region "Fill Inventory List on Manager Page"
    Private Sub FillDdlInvMng()
        Dim SelectProduct As New SqlDataAdapter("SELECT ProductID, ProductName FROM pProducts", con)
        Dim dtProduct As New DataTable

        Try
            SelectProduct.Fill(dtProduct)

            With ddlInventoryFill
                .DataSource = dtProduct
                .DataValueField = "ProductID"
                .DataTextField = "ProductName"
                .DataBind()
                .Items.Insert(0, "Select Inventory to Edit")
            End With
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            con.Close()
        End Try
    End Sub
#End Region

#Region "Store Customer Rewards and info pull"
    Protected Sub bViewCusRewards_Click(sender As Object, e As EventArgs) Handles bViewCusRewards.Click

        Dim RecordsRewards As New SqlDataAdapter("SELECT * FROM pCustomers WHERE CustomerID = @p1", con)
        Dim dtRecordsRewards As New DataTable


        With RecordsRewards.SelectCommand.Parameters
            .Clear()
            .AddWithValue("@p1", tbSaleRewards.Text)
        End With

        If dtRecordsRewards.Rows.Count > 0 Then
            dtRecordsRewards.Rows.Clear()
        End If

        Try
            RecordsRewards.Fill(dtRecordsRewards)
            gvCustomerInStore.DataSource = dtRecordsRewards
            gvCustomerInStore.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub

#End Region

#Region "Add new customer"
    Protected Sub bAddCustomer_Click(sender As Object, e As EventArgs) Handles bAddCustomer.Click

        Dim cmdInsertNewCustomer As New SqlCommand("INSERT pCustomers (Name, Email, Address, City, State, Zip, CardNumber) VALUES (@p1, @p2, @p3, @p4, @p5, @p6, @p7)", con)

        With cmdInsertNewCustomer.Parameters
            .Clear()
            .AddWithValue("@p1", tbNCName.Text)
            .AddWithValue("@p2", tbNCEmail.Text)
            .AddWithValue("@p3", tbNCAddress.Text)
            .AddWithValue("@p4", tbNCCity.Text)
            .AddWithValue("@p5", tbNCState.Text)
            .AddWithValue("@p6", tbNCZip.Text)
            .AddWithValue("@p7", tbNCCreditCard.Text)
        End With

        Try
            If con.State = ConnectionState.Closed Then con.Open()
            cmdInsertNewCustomer.ExecuteNonQuery()
            FillManagmentCustomers()
            Response.Write("New Customer Added")
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            con.Close()
        End Try

    End Sub

#End Region

#Region "Check Customer Rewards"
    Protected Sub bGetReward_Click(sender As Object, e As EventArgs) Handles bGetReward.Click

        Dim RecordsRewards As New SqlDataAdapter("SELECT * FROM pCustomers WHERE CustomerID = @p1", con)
        Dim dtRecordsRewards As New DataTable

        Dim RecordsFavs As New SqlDataAdapter("SELECT * FROM pFavorites WHERE CustomerID = @p1", con)
        Dim dtRecordsFavs As New DataTable

        With RecordsRewards.SelectCommand.Parameters
            .Clear()
            .AddWithValue("@p1", tbCustomerIDRewards.Text)
        End With

        With RecordsFavs.SelectCommand.Parameters
            .Clear()
            .AddWithValue("@p1", tbCustomerIDRewards.Text)
        End With


        If dtRecordsRewards.Rows.Count > 0 Then
            dtRecordsRewards.Rows.Clear()
        End If

        If dtRecordsFavs.Rows.Count > 0 Then
            dtRecordsFavs.Rows.Clear()
        End If

        Try
            RecordsRewards.Fill(dtRecordsRewards)
            gvRewardCustomer.DataSource = dtRecordsRewards
            gvRewardCustomer.DataBind()

            RecordsFavs.Fill(dtRecordsFavs)
            gvRewardFav.DataSource = dtRecordsFavs
            gvRewardFav.DataBind()

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub

#End Region
    'Managment Area
#Region "Mangment Info Fill grid views"
    Private Sub FillManagmentCustomers()
        Dim RecordsCustomer As New SqlDataAdapter("SELECT * FROM pCustomers", con)
        Dim RecordsCustomerList As New DataTable

        If RecordsCustomerList.Rows.Count > 0 Then
            RecordsCustomerList.Rows.Clear()
        End If

        Try
            RecordsCustomer.Fill(RecordsCustomerList)
            gvCustomerMng.DataSource = RecordsCustomerList
            gvCustomerMng.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub

    Private Sub FillTransactionTable() 'fills transaction table 
        Dim RecordsTransaction As New SqlDataAdapter("SELECT * FROM pTransactionHistory", con)
        Dim RecordsTransactionList As New DataTable

        If RecordsTransactionList.Rows.Count > 0 Then
            RecordsTransactionList.Rows.Clear()
        End If

        Try
            RecordsTransaction.Fill(RecordsTransactionList)
            gvInventMng.DataSource = RecordsTransactionList
            gvInventMng.DataBind()

        Catch ex As Exception
            Response.Write(ex.Message)

        End Try
    End Sub


    Private Sub FillProductTable()
        Dim RecordsProducts As New SqlDataAdapter("SELECT * FROM pProducts", con)
        Dim RecordsProductsList As New DataTable

        If RecordsProductsList.Rows.Count > 0 Then
            RecordsProductsList.Rows.Clear()
        End If

        Try
            RecordsProducts.Fill(RecordsProductsList)
            gvProductOrderBy.DataSource = RecordsProductsList
            gvProductOrderBy.DataBind()

        Catch ex As Exception
            Response.Write(ex.Message)

        End Try
    End Sub
#End Region

#Region "Sorting Functions"
    Private Sub OrderByQuantity() 'transactions 
        Dim RecordsOrderQuantity As New SqlDataAdapter("SELECT * FROM pTransactionHistory ORDER BY Quantity", con)
        Dim RecordsTransactionList As New DataTable

        If RecordsTransactionList.Rows.Count > 0 Then
            RecordsTransactionList.Rows.Clear()
        End If

        Try
            RecordsOrderQuantity.Fill(RecordsTransactionList)
            gvInventMng.DataSource = RecordsTransactionList
            gvInventMng.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub

    Private Sub OrderByProduct() 'transactions 
        Dim RecordsOrderQuantity As New SqlDataAdapter("SELECT * FROM pTransactionHistory ORDER BY ProductID", con)
        Dim RecordsTransactionList As New DataTable

        If RecordsTransactionList.Rows.Count > 0 Then
            RecordsTransactionList.Rows.Clear()
        End If

        Try
            RecordsOrderQuantity.Fill(RecordsTransactionList)
            gvInventMng.DataSource = RecordsTransactionList
            gvInventMng.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub

    Private Sub OrderByTransaction() 'transactions
        Dim RecordsOrderQuantity As New SqlDataAdapter("SELECT * FROM pTransactionHistory ORDER BY TransactionID", con)
        Dim RecordsTransactionList As New DataTable

        If RecordsTransactionList.Rows.Count > 0 Then
            RecordsTransactionList.Rows.Clear()
        End If

        Try
            RecordsOrderQuantity.Fill(RecordsTransactionList)
            gvInventMng.DataSource = RecordsTransactionList
            gvInventMng.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub

    Private Sub OrderByMoneySpent() 'customers
        Dim RecordsCustomerSpent As New SqlDataAdapter("SELECT * FROM pCustomers ORDER BY MoneySpent", con)
        Dim RecordsCustomerList As New DataTable

        If RecordsCustomerList.Rows.Count > 0 Then
            RecordsCustomerList.Rows.Clear()
        End If

        Try
            RecordsCustomerSpent.Fill(RecordsCustomerList)
            gvCustomerMng.DataSource = RecordsCustomerList
            gvCustomerMng.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub

    Private Sub OrderByCity() 'customers
        Dim RecordsCustomerSpent As New SqlDataAdapter("SELECT * FROM pCustomers ORDER BY City", con)
        Dim RecordsCustomerList As New DataTable

        If RecordsCustomerList.Rows.Count > 0 Then
            RecordsCustomerList.Rows.Clear()
        End If

        Try
            RecordsCustomerSpent.Fill(RecordsCustomerList)
            gvCustomerMng.DataSource = RecordsCustomerList
            gvCustomerMng.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub

    Private Sub OrderByName() 'customers
        Dim RecordsCustomerSpent As New SqlDataAdapter("SELECT * FROM pCustomers ORDER BY Name", con)
        Dim RecordsCustomerList As New DataTable

        If RecordsCustomerList.Rows.Count > 0 Then
            RecordsCustomerList.Rows.Clear()
        End If

        Try
            RecordsCustomerSpent.Fill(RecordsCustomerList)
            gvCustomerMng.DataSource = RecordsCustomerList
            gvCustomerMng.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub

    'price, inventory size 

    Private Sub OrderByPrice() 'products
        Dim RecordsProductOrder As New SqlDataAdapter("SELECT * FROM pProducts ORDER BY ProductPrice", con)
        Dim RecordsProductList As New DataTable

        If RecordsProductList.Rows.Count > 0 Then
            RecordsProductList.Rows.Clear()
        End If

        Try
            RecordsProductOrder.Fill(RecordsProductList)
            gvProductOrderBy.DataSource = RecordsProductList
            gvProductOrderBy.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub

    Private Sub OrderByInventory() 'products
        Dim RecordsProductOrder As New SqlDataAdapter("SELECT * FROM pProducts ORDER BY ProductInventory", con)
        Dim RecordsProductList As New DataTable

        If RecordsProductList.Rows.Count > 0 Then
            RecordsProductList.Rows.Clear()
        End If

        Try
            RecordsProductOrder.Fill(RecordsProductList)
            gvProductOrderBy.DataSource = RecordsProductList
            gvProductOrderBy.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub

    Private Sub OrderBySize() 'products
        Dim RecordsProductOrder As New SqlDataAdapter("SELECT * FROM pProducts ORDER BY ProductSize", con)
        Dim RecordsProductList As New DataTable

        If RecordsProductList.Rows.Count > 0 Then
            RecordsProductList.Rows.Clear()
        End If

        Try
            RecordsProductOrder.Fill(RecordsProductList)
            gvProductOrderBy.DataSource = RecordsProductList
            gvProductOrderBy.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
#End Region

#Region "Radio Button Select Cases Processes"
    Protected Sub btFilterTransactions_Click(sender As Object, e As EventArgs) Handles btFilterTransactions.Click
        'select case to provide different sorting functions depending on selected radiobuttonlist selection 
        Select Case rblSortTransactions.SelectedIndex
            Case 0
                OrderByQuantity()

            Case 1
                OrderByProduct()
            Case 2
                OrderByTransaction()

        End Select
    End Sub

    Protected Sub btCustomerData_Click(sender As Object, e As EventArgs) Handles btCustomerData.Click

        Select Case rblSortCustomers.SelectedIndex
            Case 0
                OrderByName()
            Case 1
                OrderByCity()
            Case 2
                OrderByMoneySpent()
        End Select
    End Sub

    Protected Sub btProductOrderBy_Click(sender As Object, e As EventArgs) Handles btProductOrderBy.Click

        Select Case rblProductList.SelectedIndex
            Case 0
                OrderByPrice()
            Case 1
                OrderByInventory()
            Case 2
                OrderBySize()
        End Select
    End Sub
#End Region

#Region "Adjust Inventory"
    'fill inventory form with selected item from DDL' 
    Protected Sub ddlInventoryFill_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlInventoryFill.SelectedIndexChanged

        Dim daGetOneCustomer As New SqlDataAdapter("Select * FROM pProducts Where ProductID = @p1", con)
        Dim dtOneCustomer As New DataTable

        With daGetOneCustomer.SelectCommand.Parameters
            .Clear()
            .AddWithValue("@p1", ddlInventoryFill.SelectedValue)
        End With

        Try
            daGetOneCustomer.Fill(dtOneCustomer)

            With dtOneCustomer.Rows(0)
                tbProductID.Text = .Item("ProductID")
                tbProductName.Text = .Item("ProductName")
                tbProductPrice.Text = .Item("ProductPrice")
                tbProductInventory.Text = .Item("ProductInventory")
                tbProductSize.Text = .Item("ProductSize")
            End With

            FillProductTable()

        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

    End Sub

    Protected Sub btAddInventory_Click(sender As Object, e As EventArgs) Handles btAddInventory.Click

        Dim cmdInsertNewInventory As New SqlCommand("INSERT pProducts (ProductID, ProductName, ProductPrice, ProductInventory, ProductSize) VALUES (@p1, @p2, @p3, @p4, @p5)", con)

        With cmdInsertNewInventory.Parameters
            .Clear()
            .AddWithValue("@p1", tbProductID.Text)
            .AddWithValue("@p2", tbProductName.Text)
            .AddWithValue("@p3", tbProductPrice.Text)
            .AddWithValue("@p4", tbProductInventory.Text)
            .AddWithValue("@p5", tbProductSize.Text)

        End With

        Try
            If con.State = ConnectionState.Closed Then con.Open()
            cmdInsertNewInventory.ExecuteNonQuery()
            Response.Write("Inventory Added")
            FillProductTable()
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub btUpdateInventory_Click(sender As Object, e As EventArgs) Handles btUpdateInventory.Click
        Dim UpdateCommand As New SqlCommand("Update pProducts SET ProductName = @p1, ProductPrice = @p2, ProductInventory= @p3, ProductSize = @p4 WHERE ProductID = @p5", con)

        With UpdateCommand.Parameters
            .Clear()
            .AddWithValue("@p1", tbProductName.Text)
            .AddWithValue("@p2", tbProductPrice.Text)
            .AddWithValue("@p3", tbProductInventory.Text)
            .AddWithValue("@p4", tbProductSize.Text)
            .AddWithValue("@p5", ddlInventoryFill.SelectedValue)
        End With

        Try
            If con.State = ConnectionState.Closed Then con.Open()
            'here is where the insert command above in red is run
            UpdateCommand.ExecuteNonQuery()

            FillProductTable()
            Response.Write("Record Updated")

        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            con.Close()
        End Try

    End Sub

    Protected Sub btInvMgmtClear_Click(sender As Object, e As EventArgs) Handles btInvMgmtClear.Click 'clear form' 

        tbProductID.Text = Nothing
        tbProductName.Text = Nothing
        tbProductPrice.Text = Nothing
        tbProductInventory.Text = Nothing
        tbProductSize.Text = Nothing

    End Sub
#End Region

#Region "Page Links"
    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
            MultiView1.ActiveViewIndex = 1
        End Sub
        Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
            MultiView1.ActiveViewIndex = 2
        End Sub
        Protected Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click
        Response.Redirect("ManagerLogin.aspx")
    End Sub
        Protected Sub LinkButton4_Click(sender As Object, e As EventArgs) Handles LinkButton4.Click
            MultiView1.ActiveViewIndex = 0
        End Sub
        Protected Sub LinkButton5_Click(sender As Object, e As EventArgs) Handles LinkButton5.Click
            MultiView1.ActiveViewIndex = 1
        End Sub
        Protected Sub LinkButton6_Click(sender As Object, e As EventArgs) Handles LinkButton6.Click
            MultiView1.ActiveViewIndex = 3
        End Sub
        Protected Sub LinkButton7_Click(sender As Object, e As EventArgs) Handles LinkButton7.Click
            MultiView1.ActiveViewIndex = 2
        End Sub
        Protected Sub LinkButton8_Click(sender As Object, e As EventArgs) Handles LinkButton8.Click
            MultiView1.ActiveViewIndex = 1
        End Sub
        Protected Sub LinkButton9_Click(sender As Object, e As EventArgs) Handles LinkButton9.Click
            MultiView1.ActiveViewIndex = 0
        End Sub
        Protected Sub LinkButton10_Click(sender As Object, e As EventArgs) Handles LinkButton10.Click
            MultiView1.ActiveViewIndex = 1
        End Sub
        Protected Sub LinkButton11_Click(sender As Object, e As EventArgs) Handles LinkButton11.Click
            MultiView1.ActiveViewIndex = 2
        End Sub
        Protected Sub LinkButton12_Click(sender As Object, e As EventArgs) Handles LinkButton12.Click
            MultiView1.ActiveViewIndex = 3
        End Sub
        Protected Sub LinkButton13_Click(sender As Object, e As EventArgs) Handles LinkButton13.Click
            MultiView1.ActiveViewIndex = 2
        End Sub
    Protected Sub LinkButton14_Click(sender As Object, e As EventArgs) Handles LinkButton14.Click
        MultiView1.ActiveViewIndex = 3
    End Sub
    Protected Sub LinkButton15_Click(sender As Object, e As EventArgs) Handles LinkButton15.Click
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub LinkButton16_Click(sender As Object, e As EventArgs) Handles LinkButton16.Click
        MultiView1.ActiveViewIndex = 1
    End Sub
    Protected Sub LinkButton17_Click(sender As Object, e As EventArgs) Handles LinkButton17.Click
        Response.Redirect("ManagerLogin.aspx") 'redirect to login page 
    End Sub
    Protected Sub LinkButton18_Click(sender As Object, e As EventArgs) Handles LinkButton18.Click
        MultiView1.ActiveViewIndex = 2
    End Sub
    Protected Sub LinkButton19_Click(sender As Object, e As EventArgs) Handles LinkButton19.Click
        MultiView1.ActiveViewIndex = 3
    End Sub
    Protected Sub LinkButton20_Click(sender As Object, e As EventArgs) Handles LinkButton20.Click
        Response.Redirect("ManagerLogin.aspx") 'login page
    End Sub
    Protected Sub LinkButton21_Click(sender As Object, e As EventArgs) Handles LinkButton21.Click
        MultiView1.ActiveViewIndex = 2
    End Sub
    Protected Sub LinkButton22_Click(sender As Object, e As EventArgs) Handles LinkButton22.Click
        MultiView1.ActiveViewIndex = 3
    End Sub
    Protected Sub LinkButton23_Click(sender As Object, e As EventArgs) Handles LinkButton23.Click
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub LinkButton24_Click(sender As Object, e As EventArgs) Handles LinkButton24.Click
        Response.Redirect("ManagerLogin.aspx") 'login page 
    End Sub
    Protected Sub LinkButton26_Click(sender As Object, e As EventArgs) Handles LinkButton26.Click
        Response.Redirect("ManagerLogin.aspx")
    End Sub
#End Region

End Class
