<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

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
    <div class="mt-4"> <!-- Add margin top to move the content down -->
        <h2 class="text-center"><%: Title %></h2>

        <div class="row justify-content-center mt-4"> <!-- Add margin top to move the content down -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Create a new account</h4>
                        <hr />
                        <asp:ValidationSummary runat="server" CssClass="text-danger" />
                        <div class="mb-3 row">
                            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 col-form-label">User name</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                    CssClass="text-danger" ErrorMessage="The user name field is required." />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 col-form-label">Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                    CssClass="text-danger" ErrorMessage="The password field is required." />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 col-form-label">Confirm password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <div class="col-md-offset-2 col-md-10">
                                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-green" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

