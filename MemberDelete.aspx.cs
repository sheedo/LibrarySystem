using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberDelete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Get ISBN
        TableCell cell = GridView1.Rows[e.RowIndex].Cells[1];
        if (checkISBN(cell.Text) == true)
        {
            lblErrorMessage.Text = "Cannot delete a member that is assigned to a book";
            e.Cancel = true;
        }
        else
        {
            lblErrorMessage.Text = "";
        }
    }

    public bool checkISBN(String MemberID)
    {
        //Retrieve Database Connection String from Web Config file
        SqlConnection con = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        try
        {
            //Specify the name of the Stored Procedure that we want to use
            SqlCommand cmd = new SqlCommand("Select_Assign_By_MemberID", con);
            //After Specifying the name, we must also inidicate to the system that we will be executing a Stored Procedure
            cmd.CommandType = CommandType.StoredProcedure;

            //Pass data from ASP page to our Stored Procedure which will then be stored in Database
            cmd.Parameters.Add("@MemberID", SqlDbType.VarChar).Value = MemberID;


            //Try to open a connection to the Database using the connection string
            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();


            //If no data was found using the card number then return false
            if (!reader.HasRows)
            {
                con.Close();
                return false;
            }
            else
            {
                con.Close();
                return true;
            }
        }
        catch (Exception ex)
        {
            Console.Write(ex.Message);
            return false;
        }
    }
}