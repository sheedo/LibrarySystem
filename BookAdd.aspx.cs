using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void btnAddBook(object sender, EventArgs e)
    {
        insertBook();
    }

    public int insertBook()
    {
        //Retrieve Database Connection String from Web Config file
        SqlConnection con = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        try
        {

            //Specify the name of the Stored Procedure that we want to use
            SqlCommand cmd = new SqlCommand("Insert_Book", con);
            //After Specifying the name, we must also inidicate to the system that we will be executing a Stored Procedure
            cmd.CommandType = CommandType.StoredProcedure;

            //Pass data from ASP page to our Stored Procedure which will then be stored in Database
            cmd.Parameters.Add("@ISBN", SqlDbType.VarChar).Value = txtISBN.Text;
            cmd.Parameters.Add("@Title", SqlDbType.VarChar).Value = txtTitleBook.Text;
            cmd.Parameters.Add("@Publisher", SqlDbType.VarChar).Value = txtPublisher.Text;
            cmd.Parameters.Add("@Description", SqlDbType.VarChar).Value = Request.Form["txtBookDescription"];

            //Try to open a connection to the Database using the connection string
            con.Open();

            //Execute the Stored Procedure and get the Auto Incremented ID of the customer
            String res  = cmd.ExecuteNonQuery().ToString();
            lblErrorMessage.Text = "";

            con.Close();
            //Update dataset
            ListView1.DataBind();
          
            return Int32.Parse(res);
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = "ERROR : Could not Insert - That Book ISBN is already in the database :)";
            Console.Write(ex.Message);
            return -1;
        }

    }
}