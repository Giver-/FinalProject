
Imports System.Data
Imports System.Data.SqlClient

Partial Class ManagerLogin
    Inherits System.Web.UI.Page


    Private Shared con As New SqlConnection("Data Source=cb-ot-devst04.ad.wsu.edu;Initial Catalog=MF81ryan.j.griffin;Persist Security Info=True; User ID=ryan.j.griffin;Password=d3a8e399")

    'this next global variable is used to count how many times the program user has tried to log-in. We allow only three attempts.
    Public Shared gintloopcounter As Integer = 0

        Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click


        Dim cmdCheckRegistrant As New SqlCommand("Select Count(*) from pManagerLogin WHERE ManagerLogin = @p1 AND ManagerPassword = @p2", con)

        Dim intRows As Integer = 0 'this LOCAL variable is used to hold the results of the SELECT COUNT query – the # of rows

            'if the user tried 3 times then they need to be locked out, so the controls on the form are all hidden to prevent continual usage of the system.       

            If gintloopcounter = 2 Then

                Response.Write("System locked due to excessive attempts")
                Button1.Visible = False
                tbManagerID.Visible = False
                tbManagerPW.Visible = False
                Exit Sub
            End If

        'here we add the parameters to the sqlcommand
        With cmdCheckRegistrant.Parameters
            .Clear()
            .AddWithValue("@p1", tbManagerID.Text)
            .AddWithValue("@p2", tbManagerPW.Text)
        End With

        Try 'ok here is the action

                If con.State = ConnectionState.Closed Then con.Open()
                intRows = cmdCheckRegistrant.ExecuteScalar
            'see we are counting rows to see if a row of data was found in the registered user table with the supplied userID and password.

            If intRows = 0 Then
                gintloopcounter += 1
                Response.Write("No Attendee with that UserID and Password " & gintloopcounter)
                tbManagerID.Text = Nothing
                tbManagerPW.Text = Nothing
            End If


            'next – success! If a user was found in the approved user table then go to another webpage

            If intRows = 1 Then
                Response.Redirect("Store.aspx?id=4")
                Exit Sub
                End If

            Catch ex As Exception
                Response.Write(ex.Message)
            Finally
                con.Close()
            End Try
        End Sub

    End Class


