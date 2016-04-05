using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Return : System.Web.UI.Page
{
    int daysBorrowed;
    DateTime dateBorrowed = DateTime.Now;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            btnEmail.Enabled = false;
            ddlMemberID.DataSource = getMembers();
            ddlMemberID.DataBind();

            ddlISBN.DataSource = getBooks();
            ddlISBN.DataBind();
            
            if(getMembers().Count == 0 || getBooks().Count == 0)
            {
                lblErrorMessage.Text = "Please add a member or book to the database to do a return";
                btnReturnBook.Enabled = false;
            }
        }
    }

    public void sendEmail(object sender,EventArgs e)
    {
        try
        {
            lblMail.Text = "Sending EMail...";
            SmtpClient SmtpServer = new SmtpClient("smtp.live.com",25);
            var mail = new System.Net.Mail.MailMessage();
            mail.From = new MailAddress("rasheed_andrews@live.com");
            mail.To.Add(txtEmail.Text);
            mail.Subject = "Overdue Book";
           // mail.IsBodyHtml = true;
            string htmlBody;
            htmlBody = "Your book is overdue, please report to the library";
            mail.Body = htmlBody;
            //SmtpServer.Port = 587;
            SmtpServer.UseDefaultCredentials = false;
            SmtpServer.Credentials = new System.Net.NetworkCredential("rasheed_andrews@live.com", "walleagle10");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
            lblMail.Text = "Mail Sent";
        }
        catch(Exception err)
        {
            Console.Write(err.Message);
            Console.Write("FF");
        }
    }

    
    public void btnReturn(object sender,EventArgs e)
    {
        getAssignDate();

        if (daysBorrowed != -1 && returnBook()!=0)
        {
            DateTime actualReturnDate = Calendar1.SelectedDate;
            DateTime expectedReturnDate = dateBorrowed.AddDays(daysBorrowed);

            //No Date Selected
            if (Calendar1.SelectedDate.Date == DateTime.MinValue)
            {
                actualReturnDate = DateTime.Now;
            }

                int result = DateTime.Compare(actualReturnDate, expectedReturnDate);

            txtDateBorrowed.Text = "Date Borrowed : " + dateBorrowed.ToString();
            txtDaysBorrowed.Text = "Days Borrowed : " + daysBorrowed.ToString();
            txtExpectedReturn.Text = "Expected Return Date : " + expectedReturnDate.ToString();
            txtActualReturn.Text = "Actual Return Date : " + actualReturnDate.ToString();

            //enable email
            btnEmail.Enabled = true;

            if (result < 0)
            {
                txtResult.Text = "Book is NOT overdue";
            }
            else if (result == 0)
            {
                txtResult.Text = "Book returned on time";
            }
            else if (result > 0)
            {
                txtResult.Text = "Due Date has passed";
            }
            lblErrorMessage.Text = "";
        }
        else
        {
            txtDateBorrowed.Text = "Please select date";
            txtDaysBorrowed.Text = "";
            txtExpectedReturn.Text = "";
            txtActualReturn.Text = "";
            txtResult.Text = "";
            lblErrorMessage.Text = "Error : Could not return - That Book assignment does not exist :)";
        }

    }

    public int returnBook()
    {
        //Retrieve Database Connection String from Web Config file
        SqlConnection con = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        try
        {

            //Specify the name of the Stored Procedure that we want to use
            SqlCommand cmd = new SqlCommand("Delete_Assign", con);
            //After Specifying the name, we must also inidicate to the system that we will be executing a Stored Procedure
            cmd.CommandType = CommandType.StoredProcedure;

            //Pass data from ASP page to our Stored Procedure which will then be stored in Database
            cmd.Parameters.Add("@ISBN", SqlDbType.VarChar).Value = ddlISBN.SelectedItem.Text;
            cmd.Parameters.Add("@MemberID", SqlDbType.VarChar).Value = ddlMemberID.SelectedItem.Text;
           
            //Try to open a connection to the Database using the connection string
            con.Open();

            //Execute the Stored Procedure and get the Auto Incremented ID of the customer
            String res = cmd.ExecuteNonQuery().ToString();

        
            con.Close();

            //Update dataset
            GridView1.DataBind();

            return Int32.Parse(res);
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = "ERROR : Failed";
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
               bookList.Add((String)dr["ISBN"]);
               
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

    public void getAssignDate()
    {
        daysBorrowed = -1;
        
        SqlDataReader dr = null;
        const string storedProcedureName = "Select_Assign_By_ISBN";

        SqlConnection connection = new SqlConnection(
        WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        SqlCommand command = new SqlCommand(storedProcedureName, connection);
        command.CommandType = CommandType.StoredProcedure;

        command.Parameters.Add("@ISBN", SqlDbType.VarChar).Value = ddlISBN.SelectedItem.Text;


        try
        {
            connection.Open();
            dr = command.ExecuteReader();
            while (dr.Read())
            {
                daysBorrowed = (int)dr["NumberDays"];
                dateBorrowed = (DateTime)dr["DateBorrowed"];

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
    }
}