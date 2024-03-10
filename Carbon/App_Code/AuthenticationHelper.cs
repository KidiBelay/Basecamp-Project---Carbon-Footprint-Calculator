using System.Web.Security;
using System.Web;
using System;


namespace Carbon { 
    public static class AuthenticationHelper
    {
        public static void Logout()
        {
            FormsAuthentication.SignOut();
            //FormsAuthentication.RedirectToLoginPage();
        }
    }
}