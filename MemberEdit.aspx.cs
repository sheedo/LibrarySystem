using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MemberEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            for (int count = 5; count <= 65; count++)
            {
                //ddl.Items.Add(count.ToString());
            }
        }
    }

    protected void GridView1_RowCancel(object sender, GridViewCancelEditEventArgs e)
    {
        lblErrorMessage.Text = "";
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
       String txtFirstName_Val, txtLastName_Val, txtClassName_Val, txtAge_Val;
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowState == DataControlRowState.Edit)
            {
                var txtFirstName = row.FindControl("txtFirstName") as TextBox;
                var txtLastName = row.FindControl("txtLastName") as TextBox;
                var txtClassName = row.FindControl("txtClassName") as TextBox;
                var txtAge = row.FindControl("txtAge") as TextBox;


                txtFirstName_Val = txtFirstName.Text;
                txtLastName_Val = txtLastName.Text;
                txtClassName_Val = txtClassName.Text;
                txtAge_Val = txtAge.Text;

                String err = "";
               
                if (txtFirstName_Val.Equals(""))
                {
                    err += " * First Name cannot be empty \n";
                    e.Cancel = true;
                }
                if (txtLastName_Val.Equals(""))
                {
                    err += " * Last Name cannot be empty";
                    e.Cancel = true;
                }
                if (txtClassName_Val.Equals(""))
                {
                    err += " * Class Name cannot be empty \n";
                    e.Cancel = true;
                }
                if (txtAge_Val.Equals(""))
                {
                    err += " * Age cannot be empty \n";
                    e.Cancel = true;
                }
                else
                {
                    int val;
                    if (!int.TryParse(txtAge_Val, out val))
                    {
                        err += " * Age MUST be numeric \n";
                        e.Cancel = true;
                    }
                }

                lblErrorMessage.Text = err;

                Console.Write("sd");
            }
        }
    }

   

}

