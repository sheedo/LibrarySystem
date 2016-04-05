using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCancel(object sender, GridViewCancelEditEventArgs e)
    {
        lblErrorMessage.Text = "";
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        String txtTitle_Val, txtPublisher_Val, txtDescription_Val;
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowState == DataControlRowState.Edit)
            {
                var txtTitle = row.FindControl("txtTitle") as TextBox;
                var txtPublisher = row.FindControl("txtPublisher") as TextBox;
                var txtDescription = row.FindControl("txtDescription") as TextBox;

                txtTitle_Val = txtTitle.Text;
                txtPublisher_Val = txtPublisher.Text;
                txtDescription_Val = txtDescription.Text;

                String err = "";

                if (txtTitle_Val.Equals(""))
                {
                    err += "Title cannot be empty \n";
                    e.Cancel = true;
                }
                if (txtPublisher_Val.Equals(""))
                {
                    err += "***** Publisher cannot be empty *****";
                    e.Cancel = true;
                }
                if (txtDescription_Val.Equals(""))
                {
                    err += "Description cannot be empty \n";
                    e.Cancel = true;
                }

                lblErrorMessage.Text = err;

            }
        }
    }
}

   


