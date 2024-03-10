    <%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <style>
    .btn-green {
        color: #fff;
        background-color: #006400; /* Darker shade of green */
        border-color: #006400; /* Darker shade of green */
        transition: background-color 0.3s ease-in-out, border-color 0.3s ease-in-out;
    }

    .btn-green:hover {
        background-color: #004d00; /* Darker shade of green on hover */
        border-color: #004d00; /* Darker shade of green on hover */
    }
    .nav-link {
        color: #fff;
        text-decoration: none;
        transition: color 0.3s ease-in-out;
        font-weight: bold;
    }

    .nav-link:hover {
        color: #d3d3d3; /* Lighter shade of gray on hover */
    }
</style>
     <header class="py-5 mb-4" style="background-image: url('https://images.unsplash.com/photo-1611273426858-450d8e3c9fce?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'); background-size: cover; background-position: center;">
     <div class="container d-flex justify-content-between align-items-center">
         <nav class="d-flex align-items-center">
             <a href="/Default.aspx" class="nav-link px-3">Home</a>
             <a href="/About.aspx" class="nav-link px-3">About</a>
             <a href="/Contact.aspx" class="nav-link px-3">Contact</a>
             <a href="/DataHistory.aspx" class="nav-link px-3">Data History</a>
         </nav>
         <div class="d-flex align-items-center">
             <%-- Display welcome message if user is authenticated --%>
             <asp:Label ID="WelcomeMessage" runat="server" CssClass="text-white" Visible="false"></asp:Label>
 
             <% if (!User.Identity.IsAuthenticated) { %>
                 <a href="Login.aspx" class="btn btn-sm btn-outline-light me-2">Login</a>
                 <a href="Register.aspx" class="btn btn-sm btn-green">Register</a>
             <% } %>
         </div>
     </div>
 </header>

    <div class="mt-4"> <!-- Add margin top to move all sections down -->
        <h2 class="text-center">Login to Your Account</h2> <!-- Add header -->

        <div class="row justify-content-center mt-4"> <!-- Add margin top to move all sections down -->
            <div class="col-md-6">
                <section id="loginForm">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Use a local account to log in</h4>
                            <hr />
                            <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>
                            <div class="mb-3 row">
                                <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-3 col-form-label">User name</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                        CssClass="text-danger" ErrorMessage="The user name field is required" />
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-3 col-form-label">Password</asp:Label>
                                <div class="col-md-9">
                                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <div class="col-md-9 offset-md-3">
                                    <div class="form-check">
                                        <asp:CheckBox runat="server" ID="RememberMe" />
                                        <asp:Label runat="server" AssociatedControlID="RememberMe" CssClass="form-check-label">Remember me?</asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <div class="col-md-9 offset-md-3">
                                    <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-green" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <p class="text-center">
                        <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" style="color: #006400;">Register</asp:HyperLink>
                        if you don't have a local account
                    </p>
                </section>
            </div>

            <%--<div class="col-md-4">
                <section id="socialLoginForm">
                    <uc:openauthproviders runat="server" id="OpenAuthLogin" />
                </section>
            </div>--%>
        </div>
    </div>
</asp:Content>


