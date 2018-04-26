﻿Imports System.Data
Imports System.Data.SqlClient
Partial Class Store
    Inherits System.Web.UI.Page

    Public Shared con As New SqlConnection("Data Source=cb-ot-devst04.ad.wsu.edu;Initial Catalog=MF81ryan.j.griffin;Persist Security Info=True; User ID=ryan.j.griffin;Password=d3a8e399")



#Region "Update and clear"
    Private Sub Store_Init(sender As Object, e As EventArgs) Handles Me.Init

        MultiView1.ActiveViewIndex = 0
        FILLDDLProductsList()
        FILLDDLCustomerIDCart()
        FillManagmentCustomers()
        FillTransactionTable()
        FillProductTable()

        GetRecordsNT()


        MaintainScrollPositionOnPostBack = True

    End Sub
#End Region

#Region "New Order"
    Protected Sub bAddToCart_Click(sender As Object, e As EventArgs) Handles bAddToCart.Click

        Dim cmdInsertProductToCart As New SqlCommand("INSERT pTransactionHistory (ProductID, ProductName, Quantity) VALUES (@p1, @p2, @p3)", con)

        With cmdInsertProductToCart.Parameters
            .Clear()
            .AddWithValue("@p1", ddlShopSelect.SelectedIndex)
            .AddWithValue("@p2", ddlShopSelect.SelectedItem.Text)
            .AddWithValue("@p3", ddlShopQuantity.SelectedValue)
        End With

        Try
            If con.State = ConnectionState.Closed Then con.Open()
            cmdInsertProductToCart.ExecuteNonQuery()
            GetRecordsNT()
            Response.Write("Item Added to cart")
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            con.Close()
        End Try

    End Sub

#End Region

#Region "Fill Product list DDL"
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

#End Region

#Region "Rewards Transactions"
    Protected Sub bEnterExistCust_Click(sender As Object, e As EventArgs) Handles bEnterExistCust.Click

        'figure out how to clear the cart table  Dim ClearCart As New SqlCommand("Update pTransactionHistory SET CartID = 0, ProductID = 0, ProductName = none", con)

        Dim UpdateProductInventory As New SqlCommand("UPDATE pProducts SET", con)

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

#Region "Fill Customer DDL In cart"
    Private Sub FILLDDLCustomerIDCart()
        Dim SelectProduct As New SqlDataAdapter("SELECT CustomerID, Name FROM pCustomers", con)
        Dim dtProduct As New DataTable

        Try
            SelectProduct.Fill(dtProduct)

            With ddlSelectCustomerID
                .DataSource = dtProduct
                .DataValueField = "CustomerID"
                .DataTextField = "Name"
                .DataBind()
                .Items.Insert(0, "Select Your Name")
            End With
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
#End Region

#Region "Fill Cart GridView"
    Private Sub GetRecordsNT()
        Dim RecordsCart As New SqlDataAdapter("SELECT * FROM pTransactionHistory", con)
        Dim RecordsCartItems As New DataTable

        If RecordsCartItems.Rows.Count > 0 Then
            RecordsCartItems.Rows.Clear()
        End If

        Try
            RecordsCart.Fill(RecordsCartItems)
            gvCart.DataSource = RecordsCartItems
            gvCart.DataBind()
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

#Region "Add New Inventory Item"
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
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            con.Close()
        End Try
    End Sub
#End Region


#Region "Page Links"
    'these are the links for the image buttons they look way better but are a pain since you need to add pictures Im just gping to use them as is without pictures for now and we can change that later
    Protected Sub ibLinkToMens_Click(sender As Object, e As ImageClickEventArgs) Handles ibLinkToMens.Click
        MultiView1.ActiveViewIndex = 1
        'for mens section we can use a call method here and for womens that can change the ddl for the store to only show mens or womens items if this link is clicked that way we only need to use one page
    End Sub
    Protected Sub ibLinkToWomens_Click(sender As Object, e As ImageClickEventArgs) Handles ibLinkToWomens.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    'these links are image buttons for the deals we can just set them to +=1 the cart infomation and sql stuff to track
    Protected Sub ibDeal1_Click(sender As Object, e As ImageClickEventArgs) Handles ibDeal1.Click

    End Sub
    Protected Sub ibDeal2_Click(sender As Object, e As ImageClickEventArgs) Handles ibDeal2.Click

    End Sub
    Protected Sub ibDeal3_Click(sender As Object, e As ImageClickEventArgs) Handles ibDeal3.Click

    End Sub

    'these are the link button links dont look that great but might be nice to have to navigate while we work on the site
    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        MultiView1.ActiveViewIndex = 1
    End Sub
    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        MultiView1.ActiveViewIndex = 2
    End Sub
    Protected Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click
        MultiView1.ActiveViewIndex = 4
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

#End Region



End Class
