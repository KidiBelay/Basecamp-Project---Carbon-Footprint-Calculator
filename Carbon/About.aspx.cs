using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            // Get the username of the logged-in user
            string username = User.Identity.GetUserName();

            // Update the header to display the logged-in user's information
            WelcomeMessage.Text = "Welcome, " + username + "!";
            WelcomeMessage.Visible = true;
        }
        else
        {
            // Hide the welcome message if the user is not logged in
            WelcomeMessage.Visible = false;
        }
    }
}