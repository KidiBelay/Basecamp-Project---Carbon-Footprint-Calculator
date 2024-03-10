<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
                <a href="Default.aspx" class="nav-link px-3">Home</a>
                <a href="About.aspx" class="nav-link px-3">About</a>
                <a href="Contact.aspx" class="nav-link px-3">Contact</a>
                <a href="DataHistory.aspx" class="nav-link px-3">Data History</a>
            </nav>
            <div class="d-flex align-items-center">
                <%-- Display welcome message if user is authenticated --%>
                <asp:Label ID="WelcomeMessage" runat="server" CssClass="text-white" Visible="false"></asp:Label>
    
                <% if (!User.Identity.IsAuthenticated) { %>
                    <a href="Account/Login.aspx" class="btn btn-sm btn-outline-light me-2">Login</a>
                    <a href="Account/Register.aspx" class="btn btn-sm btn-green">Register</a>
                <% } %>
            </div>
        </div>
    </header>

    <main class="container">

        <h2 class="mb-4">Contact Us</h2>

        <section class="row">
            <div class="col-md-6">
                <h3>Get in Touch</h3>
                <p>We are here to answer your questions and discuss your sustainability needs. Feel free to reach out to us using the form below or through the information provided.</p>
                <asp:Panel ID="pnlContactForm" runat="server">
                    <div class="mb-3">
                        <label for="name" class="form-label">Your Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email address"></asp:TextBox>
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label">Message</label>
                        <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" placeholder="Write your message here"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn btn-green" OnClick="btnSend_Click" />
                </asp:Panel>
                <asp:Label ID="lblSuccessMessage" runat="server" Visible="false" Text="Your message has been sent successfully." CssClass="text-success"></asp:Label>
                <asp:Label ID="lblErrorMessage" runat="server" Visible="false" Text="An error occurred while sending your message. Please try again later." CssClass="text-danger"></asp:Label>
            </div>
            <div class="col-md-6">
                <h3>Contact Information</h3>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <i class="fas fa-map-marker-alt me-2"></i> Addis Ababa, Ethiopia
                    </li>
                    <li class="list-group-item">
                        <i class="fas fa-phone-alt me-2"></i> (251) 900-000000
                    </li>
                    <li class="list-group-item">
                        <i class="fas fa-envelope me-2"></i> info@ecoimpactafrica.com
                    </li>
                </ul>
            </div>
        </section>

    </main>
</asp:Content>
