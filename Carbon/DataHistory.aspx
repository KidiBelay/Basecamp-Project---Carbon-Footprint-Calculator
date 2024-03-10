<%@ Page Title="DataHistory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="DataHistory.aspx.cs" Inherits="DataHistory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
       td {
           text-transform: capitalize;
       }
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
                <!-- Display welcome message if user is authenticated -->
                <asp:Label ID="WelcomeMessage" runat="server" CssClass="text-white" Visible="false"></asp:Label>

                <% if (!User.Identity.IsAuthenticated) { %>
                    <a href="Account/Login.aspx" class="btn btn-sm btn-outline-light me-2">Login</a>
                    <a href="Account/Register.aspx" class="btn btn-sm btn-green">Register</a>
                <% } %>
            </div>
        </div>
    </header>

    <div class="container">
        <h2 class="mb-4">Data History (Report) Page</h2>

        <!-- Transport Emissions Section -->
        <div class="mb-5">
            <h3>Transport Emissions</h3>
            <table id="transportTable" class="table table-striped table-hover">
                <!-- Table header -->
                <thead class="table-light">
                    <tr>
                        <th>Vehicle Type</th>
                        <th>Distance</th>
                        <th>Fuel Type</th>
                        <th>Fuel Efficiency (Gallons/Km/Mile)</th>
                        <th>Entry Date</th>
                        <th>Carbon Emmision</th>
                    </tr>
                </thead>
                <!-- Table body -->
                <tbody>
                    <!-- Table rows will be dynamically populated here -->
                </tbody>
            </table>
        </div>

        <!-- Electricity Consumption Section -->
        <div>
            <h3>Electricity Consumption</h3>
            <table id="electricityTable" class="table table-striped table-hover" >
                <!-- Table header -->
                <thead class="table-light">
                    <tr>
                        <th>Energy Source</th>
                        <th>Electricity Usage (Kilowatt-Hours)</th>
                        <th>Entry Date</th>
                        <th>Carbon Emmision</th>
                    </tr>
                </thead>
                <!-- Table body -->
                <tbody>
                    <!-- Table rows will be dynamically populated here -->
                </tbody>
            </table>
        </div>

        <!-- Display total carbon emissions -->
        <div>
            <h3>Total Carbon Emissions</h3>
            <asp:Label ID="lblTotalTransportCarbonEmissions" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="lblTotalElectricityCarbonEmissions" runat="server" Text=""></asp:Label><br />
            <asp:Label ID="lblOverallTotalCarbonEmissions" runat="server" Text=""></asp:Label>
        </div>

        <!-- Hidden field to store JSON data -->
        <asp:HiddenField ID="dataHistoryHiddenField" runat="server" />
    </div>

    <script>
        // Function to format date as YYYY/MM/DD
        function formatDate(dateString) {
            var date = new Date(dateString);
            var year = date.getFullYear();
            var month = ('0' + (date.getMonth() + 1)).slice(-2);
            var day = ('0' + date.getDate()).slice(-2);
            return year + '/' + month + '/' + day;
        }

        // Function to populate data history
        function populateDataHistory(dataHistory) {
            var transportTable = document.getElementById("transportTable").getElementsByTagName('tbody')[0];
            var electricityTable = document.getElementById("electricityTable").getElementsByTagName('tbody')[0];

            // Populate transport emissions table
            dataHistory.forEach(function (entry) {
                var transportEntry = entry.transport;
                var electricityEntry = entry.electricity;

                if (transportEntry) {
                    var transportRow = transportTable.insertRow();
                    transportRow.innerHTML = "<td>" + (transportEntry.vehicleType || '') + "</td><td>" + (transportEntry.distanceTravelled || '') + "</td><td>" + (transportEntry.fuelType || '') + "</td><td>" + (transportEntry.fuelEfficiency || '') + "</td><td>" + formatDate(entry.entryDate || '') + "</td><td>" + (entry.carbonFootprint.transportEmissions || '') + "</td>";
                }

                if (electricityEntry) {
                    var electricityRow = electricityTable.insertRow();
                    electricityRow.innerHTML = "<td>" + (electricityEntry.energySource || '') + "</td><td>" + (electricityEntry.electricityUsage || '') + "</td><td>" + formatDate(entry.entryDate || '') + "</td><td>" + (entry.carbonFootprint.electricityEmissions || '') + "</td>";
                }
            });
        }

        // Call populateDataHistory function when the page loads
        window.onload = function () {
            // Retrieve data history from the hidden field
            var dataHistoryJson = document.getElementById('<%= dataHistoryHiddenField.ClientID %>').value;
            if (dataHistoryJson) {
                var dataHistory = JSON.parse(dataHistoryJson);
                populateDataHistory(dataHistory);
            } else {
                console.error("No data history provided.");
            }
        };
    </script>
</asp:Content>
