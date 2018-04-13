Imports System.Data
Imports System.Data.SqlClient
Partial Class Store
    Inherits System.Web.UI.Page

    Public Shared con As New SqlConnection("Data Source=cb-ot-devst04.ad.wsu.edu;Initial Catalog=MF81ryan.j.griffin;Persist Security Info=True; User ID=ryan.j.griffin;Password=d3a8e399")
    Private Sub Store_Init(sender As Object, e As EventArgs) Handles Me.Init
        MultiView1.ActiveViewIndex = 0
    End Sub


#Region "Page Links"
    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        MultiView1.ActiveViewIndex = 1
    End Sub
    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        MultiView1.ActiveViewIndex = 4
    End Sub
    Protected Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click
        MultiView1.ActiveViewIndex = 2
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
    Protected Sub ibLinkToMens_Click(sender As Object, e As ImageClickEventArgs) Handles ibLinkToMens.Click
        MultiView1.ActiveViewIndex = 1
    End Sub
#End Region
End Class
