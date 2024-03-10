using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : Page
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
    protected void btnSend_Click(object sender, EventArgs e)
    {
        // Handle the send message button click event here
        // For example, you can process the form data and send an email
        // You can access form controls using their IDs like name.Text, email.Text, message.Text
        // Example:
        // string name = name.Text;
        // string email = email.Text;
        // string message = message.Text;

        // You can also redirect the user to a thank you page or show a success message
        // Response.Redirect("ThankYou.aspx");
        // Or
        // successMessage.Visible = true;
    }
}