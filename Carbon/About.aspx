<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

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

        <h2 class="mb-4">About Eco Impact Africa</h2>

        <section class="row">
            <div class="col-md-6">
                <p style="text-align: justify;">
                    Eco Impact Africa is a dedicated organization established with the mission of fostering a culture of sustainability and providing comprehensive environmental solutions. We envision a future where individuals and businesses thrive in harmony with the environment, making a positive impact for generations to come.
                </p>
                <p style="text-align: justify;">
                    Our team is comprised of experienced professionals passionate about sustainability. We offer a wide range of services to empower our clients to achieve their environmental goals, exceeding their expectations with tailored solutions and a commitment to excellence.
                </p>
            </div>
            <div class="col-md-6 d-flex align-items-center justify-content-center">
                <img src="https://images.unsplash.com/photo-1451847251646-8a6c0dd1510c?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Eco Impact Africa - Globe Image" class="img-fluid rounded mx-auto">
            </div>
        </section>

        <section class="row mt-4">
            <div class="col-md-12">
                <h3>Our Values</h3>
                <ul class="list-unstyled">
                    <li style="text-align: justify;"><strong>Integrity:</strong> We conduct our business with honesty and transparency.</li>
                    <li style="text-align: justify;"><strong>Collaboration:</strong> We work together with clients and partners to achieve shared goals.</li>
                    <li style="text-align: justify;"><strong>Innovation:</strong> We embrace new technologies and approaches to create sustainable solutions.</li>
                    <li style="text-align: justify;"><strong>Impact:</strong> We strive to make a positive difference in the environment and society.</li>
                </ul>
            </div>
        </section>


    </main>
</asp:Content>
