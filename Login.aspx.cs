using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void btnLogin(object sender, EventArgs e)
    {
        if(txtUserName.Text.Equals("admin") && txtPassword.Text.Equals("123"))
        {
            Response.Redirect("MainMenu.aspx");
        }
        else
        {
            lblErrorMessage.Text = "Incorrect UserName or Password";
        }
    }
}