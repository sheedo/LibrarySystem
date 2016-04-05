using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Assign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ddlMemberID.DataSource = getMembers();
            ddlMemberID.DataBind();

            ddlISBN.DataSource = getBooks();
            ddlISBN.DataBind();

            txtDateBorrow.Text = DateTime.Now.ToString();
            
            if(getMembers().Count == 0 || getBooks().Count == 0)
            {
                lblErrorMessage.Text = "Please add a member or book to the database to do an assignment";
                btnAssignment.Enabled = false;
            }
        }
    }
    
    public void btnAssign(object sender,EventArgs e)
    {
        assignBookMember();

        //Update list of ISBN
        ddlISBN.DataSource = getBooks();
        ddlISBN.DataBind();

        if (getBooks().Count == 0)
        {
            lblErrorMessage.Text = "No more books are left to assign, please add more";
            btnAssignment.Enabled = false;
        }
    }

    public bool checkISBN(String ISBN)
    {
        //Retrieve Database Connection String from Web Config file
        SqlConnection con = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        try
        {
            //Specify the name of the Stored Procedure that we want to use
            SqlCommand cmd = new SqlCommand("Select_Assign_By_ISBN", con);
            //After Specifying the name, we must also inidicate to the system that we will be executing a Stored Procedure
            cmd.CommandType = CommandType.StoredProcedure;

            //Pass data from ASP page to our Stored Procedure which will then be stored in Database
            cmd.Parameters.Add("@ISBN", SqlDbType.VarChar).Value = ISBN;


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

    public int assignBookMember()
    {
        //Retrieve Database Connection String from Web Config file
        SqlConnection con = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        try
        {

            //Specify the name of the Stored Procedure that we want to use
            SqlCommand cmd = new SqlCommand("Insert_Assign", con);
            //After Specifying the name, we must also inidicate to the system that we will be executing a Stored Procedure
            cmd.CommandType = CommandType.StoredProcedure;

            //Pass data from ASP page to our Stored Procedure which will then be stored in Database
            cmd.Parameters.Add("@ISBN", SqlDbType.VarChar).Value = ddlISBN.SelectedItem.Text;
            cmd.Parameters.Add("@MemberID", SqlDbType.VarChar).Value = ddlMemberID.SelectedItem.Text;
            cmd.Parameters.Add("@DateBorrowed", SqlDbType.VarChar).Value = txtDateBorrow.Text;
            cmd.Parameters.Add("@NumberDays", SqlDbType.Int).Value = Int32.Parse(txtDays.Text);

            //Try to open a connection to the Database using the connection string
            con.Open();

            //Execute the Stored Procedure and get the Auto Incremented ID of the customer
            String res = cmd.ExecuteNonQuery().ToString();
            lblErrorMessage.Text = "";

            con.Close();
            //Update dataset
            GridView1.DataBind();

            return Int32.Parse(res);
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = "ERROR : Could not Insert - That Book ISBN is already in the database :)";
            Console.Write(ex.Message);
            return -1;
        }

    }

    public List<String> getMembers()
    {
        List<String> memberList = new List<String>();  
        SqlDataReader dr = null;
        const string storedProcedureName = "Select_Member";
     
        SqlConnection connection = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand(storedProcedureName, connection);
            command.CommandType = CommandType.StoredProcedure;

            try
            {
                connection.Open();
                dr = command.ExecuteReader();
                while (dr.Read())
                {
                    memberList.Add((String)dr["MemberID"]);
                }
                dr.Close();
                dr.Dispose();

                command.Cancel();
            }
            catch (Exception err)
            {
                Console.Write(err.Message);
            }
            finally
            {
                connection.Close();
            }
        return memberList;
     }

    public List<String> getBooks()
    {
        List<String> bookList = new List<String>();
        SqlDataReader dr = null;
        const string storedProcedureName = "Select_Book";

        SqlConnection connection = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand(storedProcedureName, connection);
        command.CommandType = CommandType.StoredProcedure;

        try
        {
            connection.Open();
            dr = command.ExecuteReader();
            while (dr.Read())
            {
                if (checkISBN((String)dr["ISBN"]) == false)
                {
                    bookList.Add((String)dr["ISBN"]);
                }
            }
            dr.Close();
            dr.Dispose();

            command.Cancel();
        }
        catch (Exception err)
        {
            Console.Write(err.Message);
        }
        finally
        {
            connection.Close();
        }
        return bookList;
    }
}