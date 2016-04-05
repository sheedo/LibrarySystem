using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtISBNSearch.Focus();
        }
    }

    public void searchBook(object sender, EventArgs e)
    {
        getBook(txtISBNSearch.Text);
    }

    public void getBook(String ISBN)
    {
        SqlDataReader dr = null;
        const string storedProcedureName = "Select_Book_By_ISBN";

        SqlConnection connection = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand(storedProcedureName, connection);
        command.CommandType = CommandType.StoredProcedure;

        command.Parameters.Add("@ISBN", SqlDbType.VarChar).Value = ISBN;

        try
        {
            connection.Open();
            dr = command.ExecuteReader();

            DataTable table = new DataTable();
            table.Columns.Add("ISBN", typeof(string));
            table.Columns.Add("Title", typeof(string));
            table.Columns.Add("Publisher", typeof(string));
            table.Columns.Add("Description", typeof(string));


            while (dr.Read())
            {
       // Insert Data
                    table.Rows.Add((String)dr["ISBN"],
                                   (String)dr["Title"],
                                   (String)dr["Publisher"],
                                   (String)dr["Description"]);
                
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