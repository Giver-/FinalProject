Imports System.Data
Imports System.Data.SqlClient
Partial Class Store
    Inherits System.Web.UI.Page

    Public Shared con As New SqlConnection("Data Source=cb-ot-devst04.ad.wsu.edu;Initial Catalog=MF81ryan.j.griffin;Persist Security Info=True; User ID=ryan.j.griffin;Password=d3a8e399")
    Private Sub Store_Init(sender As Object, e As EventArgs) Handles Me.Init
        MultiView1.ActiveViewIndex = 0
    End Sub


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
#End Region
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
