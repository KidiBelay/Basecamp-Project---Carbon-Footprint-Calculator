<%@ Page Title="DataEntry" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="DataEntry.aspx.cs" Inherits="DataEntry" EnableEventValidation="false" %>

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
        <section class="row">
            <div class="col-md-6">
                <h3>Transport Emissions</h3>
                <div class="mb-3">
                    <label for="vehicleTypeDropDown" class="form-label">Vehicle Type</label>
                    <asp:DropDownList ID="vehicleTypeDropDown" runat="server" CssClass="form-select">
                        <asp:ListItem Value="car">Car</asp:ListItem>
                        <asp:ListItem Value="truck">Truck</asp:ListItem>
                        <asp:ListItem Value="bus">Bus</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="distanceTravelledTextBox" class="form-label">Distance Travelled (km)</label>
                    <asp:TextBox ID="distanceTravelledTextBox" runat="server" CssClass="form-control" placeholder="Enter distance in km"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="fuelTypeDropDown" class="form-label">Fuel Type</label>
                    <asp:DropDownList ID="fuelTypeDropDown" runat="server" CssClass="form-select">
                        <asp:ListItem Value="gasoline">Gasoline</asp:ListItem>
                        <asp:ListItem Value="diesel">Diesel</asp:ListItem>
                        <asp:ListItem Value="petrol">Petrol</asp:ListItem>
                        <asp:ListItem Value="electric">Electric</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="fuelEfficiencyTextBox" class="form-label">Fuel Efficiency (gallons per trip)</label>
                    <asp:TextBox ID="fuelEfficiencyTextBox" runat="server" CssClass="form-control" placeholder="Enter gallons per trip"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-6">
                <h3>Electricity Consumption</h3>
                <div class="mb-3">
                    <label for="energySourceDropDown" class="form-label">Energy Source</label>
                    <asp:DropDownList ID="energySourceDropDown" runat="server" CssClass="form-select">
                        <asp:ListItem Value="grid">Grid</asp:ListItem>
                        <asp:ListItem Value="solar">Solar</asp:ListItem>
                        <asp:ListItem Value="wind">Wind</asp:ListItem>
                        <asp:ListItem Value="others">Others</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="electricityUsageTextBox" class="form-label">Electricity Usage (Kilowatt-Hours)</label>
                    <asp:TextBox ID="electricityUsageTextBox" runat="server" CssClass="form-control" placeholder="Enter electricity usage in kWh"></asp:TextBox>
                </div>
            </div>
        </section>
        <asp:Button ID="submitButton" runat="server" Text="Submit" CssClass="btn btn-green" OnClick="SubmitButton_Click" />
    </main>
</asp:Content>