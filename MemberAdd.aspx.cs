using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            for(int count = 3;count <= 65; count++)
            {
                ddlAge.Items.Add(count.ToString());
            }
        }
    }

    public void btnAddMember(object sender, EventArgs e)
    {
        insertMember();
    }

    public int insertMember()
    {
        //Retrieve Database Connection String from Web Config file
        SqlConnection con = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        try
        {

            //Specify the name of the Stored Procedure that we want to use
            SqlCommand cmd = new SqlCommand("Insert_Member", con);
            //After Specifying the name, we must also inidicate to the system that we will be executing a Stored Procedure
            cmd.CommandType = CommandType.StoredProcedure;

            //Pass data from ASP page to our Stored Procedure which will then be stored in Database
            cmd.Parameters.Add("@MemberID", SqlDbType.VarChar).Value = txtMemberID.Text;
            cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = txtFName.Text;
            cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = txtLName.Text;
            cmd.Parameters.Add("@ClassName", SqlDbType.VarChar).Value = txtClassName.Text;
            cmd.Parameters.Add("@Age", SqlDbType.Int).Value = Int32.Parse(ddlAge.SelectedItem.Text);
            cmd.Parameters.Add("@Gender", SqlDbType.VarChar).Value = ddlGender.SelectedValue;

            //Try to open a connection to the Database using the connection string
            con.Open();

            //Execute the Stored Procedure and get the Auto Incremented ID of the customer
            String res = cmd.ExecuteNonQuery().ToString();
            lblErrorMessage.Text = "";

            con.Close();
            //Update dataset
            ListView1.DataBind();

            return Int32.Parse(res);
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = "ERROR : Could not Insert - That Member ID is already in the database :)";
            Console.Write(ex.Message);
            return -1;
        }

    }
}