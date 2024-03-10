using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;

public partial class DataEntry : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Account/Login.aspx");
        }
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

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        // Get form data for Transport Emissions
        string vehicleType = vehicleTypeDropDown.SelectedValue;
        double distanceTravelled = double.Parse(distanceTravelledTextBox.Text);
        string fuelType = fuelTypeDropDown.SelectedValue;
        double fuelEfficiency = double.Parse(fuelEfficiencyTextBox.Text);

        // Get form data for Electricity Consumption
        string energySource = energySourceDropDown.SelectedValue;
        double electricityUsage = 0;

        // Parse electricity usage if provided
        if (!string.IsNullOrEmpty(electricityUsageTextBox.Text))
        {
            double.TryParse(electricityUsageTextBox.Text, out electricityUsage);
        }

        // Calculate carbon emissions
        double transportEmissions = CalculateTransportEmissions(vehicleType, fuelType, distanceTravelled, fuelEfficiency);
        double electricityEmissions = CalculateElectricityEmissions(energySource, electricityUsage);

        // Store data in JSON format
        StoreFormDataInJson(vehicleType, distanceTravelled, fuelType, fuelEfficiency, energySource, electricityUsage, transportEmissions, electricityEmissions);

        // Redirect to DataHistory.aspx
        Response.Redirect("DataHistory.aspx");
    }

    private void StoreFormDataInJson(string vehicleType, double distanceTravelled, string fuelType, double fuelEfficiency, string energySource, double electricityUsage, double transportEmissions, double electricityEmissions)
    {
        // Check if the data file exists
        string dataFilePath = Server.MapPath("~/App_Data/dataHistory.json");
        List<object> formDataList;

        // Read existing data from file or initialize formDataList to an empty list
        if (File.Exists(dataFilePath))
        {
            // Read existing data from file
            string existingData = File.ReadAllText(dataFilePath);

            // Deserialize existing data into formDataList
            formDataList = JsonConvert.DeserializeObject<List<object>>(existingData);

            // Ensure formDataList is not null
            if (formDataList == null)
            {
                formDataList = new List<object>();
            }
        }
        else
        {
            formDataList = new List<object>();
        }

        // Create new data object
        var formData = new
        {
            entryDate = DateTime.Now,
            transport = new
            {
                vehicleType,
                distanceTravelled,
                fuelType,
                fuelEfficiency
            },
            electricity = new
            {
                energySource,
                electricityUsage
            },
            carbonFootprint = new
            {
                transportEmissions,
                electricityEmissions
            }
        };

        // Add new data to the list
        formDataList.Add(formData);

        // Convert the list to JSON
        string formDataJson = JsonConvert.SerializeObject(formDataList);

        // Write JSON to file
        File.WriteAllText(dataFilePath, formDataJson);
    }

    private double CalculateElectricityEmissions(string energySource, double electricityUsage)
    {
        // Placeholder logic to get emissions factor for different fuel types (kg CO2 per liter)
        double emissionsFactor = 0.0;

        if (energySource == "grid")
        {
            // Assuming emissions factor for gasoline is approximately 2.4 kg CO2 per liter
            emissionsFactor = 0.3;
        }
        else if (energySource == "solar")
        {
            // Assuming emissions factor for diesel is approximately 2.65 kg CO2 per liter
            emissionsFactor = 0.1;
        }
        else if (energySource == "wind")
        {
            // Assuming emissions factor for solar is approximately 2.65 kg CO2 per liter
            emissionsFactor = 0.2;
        }
        else
        {
            emissionsFactor = 0.25;
        }

        // Calculate electricity emissions
        return electricityUsage * emissionsFactor;
    }
    private double CalculateTransportEmissions(string vehicleType, string fuelType, double distanceTravelled, double fuelEfficiency)
    {
        double carbonFactor = 0.0;
        double distanceFactor = distanceTravelled * 2.35;

        // Set the carbon factor based on the vehicle type
        if (vehicleType == "car")
        {
            carbonFactor = 0.5;
        }
        else if (vehicleType == "truck")
        {
            carbonFactor = 0.7;
        }
        else if (vehicleType == "bus")
        {
            carbonFactor = 0.6;
        }

        // Calculate emissions for non-electric vehicles
        if (fuelType != "electric")
        {
            double emissionsFactor = GetEmissionsFactor(fuelType); // Get emissions factor based on fuel type

            // Calculate emissions
            return emissionsFactor * distanceFactor * carbonFactor * fuelEfficiency; // Assuming distance is in km
        }

        // For electric vehicles, carbon emissions are zero
        return 0.0;
    }

    // Helper method to get emissions factor based on fuel type
    private double GetEmissionsFactor(string fuelType)
    {
        switch (fuelType)
        {
            case "gasoline":
                // Assuming emissions factor for gasoline is approximately 2.4 kg CO2 per liter
                return 2.4;
            case "diesel":
                // Assuming emissions factor for diesel is approximately 2.7 kg CO2 per liter
                return 2.7;
            case "petrol":
                // Assuming emissions factor for petrol is approximately 1.7 kg CO2 per liter
                return 1.7;
            default:
                return 0.0; // Default emissions factor for unknown fuel types
        }
    }

}
