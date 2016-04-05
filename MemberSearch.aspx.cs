using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtMemberIDSearch.Focus();
        }
    }

    public void searchMember(object sender, EventArgs e)
    {
        getMember(txtMemberIDSearch.Text);
    }

    public void getMember(String MemberID)
    {
        SqlDataReader dr = null;
        const string storedProcedureName = "Select_Member_By_ID";

        SqlConnection connection = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand(storedProcedureName, connection);
        command.CommandType = CommandType.StoredProcedure;

        command.Parameters.Add("@MemberID", SqlDbType.VarChar).Value = MemberID;

        try
        {
            connection.Open();
            dr = command.ExecuteReader();

            DataTable table = new DataTable();
            table.Columns.Add("MemberID", typeof(string));
            table.Columns.Add("FirstName", typeof(string));
            table.Columns.Add("LastName", typeof(string));
            table.Columns.Add("ClassName", typeof(string));
            table.Columns.Add("Age", typeof(int));
            table.Columns.Add("Gender", typeof(string));


            while (dr.Read())
            {
                // Insert Data
                table.Rows.Add((String)dr["MemberID"],
                               (String)dr["FirstName"],
                               (String)dr["LastName"],
                               (String)dr["ClassName"],
                               (int)dr["Age"],
                               (String)dr["Gender"]);

            }

            GridView1.DataSource = table;
            GridView1.DataBind();

            dr.Close();
            dr.Dispose();

            command.Cancel();
        }
        catch (Exception err)
        {
            Response.Write(err.Message);
            Console.Write(err.Message);
        }
        finally
        {
            connection.Close();
        }
    }
}