<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
    <%--https://images.unsplash.com/photo-1580234033313-184d6414b800?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D--%>
    <header class="d-flex flex-column align-items-center py-5 mb-4" style="background-image: url('https://images.unsplash.com/photo-1611273426858-450d8e3c9fce?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'); background-size: cover; background-position: center;">
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
        <div class="text-center mt-4">
            <h1 class="display-4 text-white">Eco Impact Africa</h1>
            <p class="lead text-white">Empowering Sustainable Practices, Together</p>
            <a href="DataEntry.aspx" class="btn btn-lg btn-green mt-3">Calculate Your Footprint</a>
        </div>
    </header>
    <main class="container">
        <section class="row">
            <div class="col-md-6">
                <h2>Our Mission & Vision</h2>
                <p>
                    Eco Impact Africa is dedicated to providing comprehensive environmental solutions and fostering a culture of sustainability. We envision a future where businesses and individuals can thrive in harmony with the environment.
                </p>
                <h2>Services</h2>
                <ul class="list-unstyled">
                    <li>Environmental Regulations Compliance</li>
                    <li>Sustainability Auditing & Consulting</li>
                    <li>Environmental Impact Assessments</li>
                    <li>On-Site Environmental Management</li>
                    <li>Training & Workshops</li>
                </ul>
            </div>
            <div class="col-md-6 d-flex align-items-center justify-content-center">
                <img src="https://images.unsplash.com/photo-1451847251646-8a6c0dd1510c?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Sustainable practices image" class="img-fluid rounded mx-auto">
            </div>
        </section>
        <section class="row text-center mt-4 mb-5">
            <div class="col-md-12">
                <h3>Why Choose Us?</h3>
                <p>
                    Eco Impact Africa offers a team of experienced professionals, tailored solutions, and a commitment to exceeding client expectations. We are passionate about sustainability and empower our clients to make a positive impact.
                </p>
                <a href="About.aspx" class="btn btn-green mt-3">Learn More</a>
            </div>
        </section>
    </main>
</asp:Content>
