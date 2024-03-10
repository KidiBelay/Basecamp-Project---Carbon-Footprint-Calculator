using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Carbon;


public partial class _Default : Page
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
    //protected void LogoutButton_Click(object sender, EventArgs e)
    //{
    //    // Call the logout function from the common class
    //    AuthenticationHelper.Logout();

    //    // Redirect to the login page or any other page after logout
    //    //Response.Redirect("Account/Login.aspx");
    //}
}