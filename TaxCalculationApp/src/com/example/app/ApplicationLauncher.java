package com.example.app;

import com.example.service.AuthenticationService;
import com.example.service.PropertyService;
import com.example.service.VehicleService;
import com.example.ui.ConsoleHelper;
import com.example.ui.LoginScreen;
import com.example.ui.MainMenuScreen;
import com.example.ui.PropertyMenuScreen;
import com.example.ui.TotalSummaryScreen;
import com.example.ui.VehicleMenuScreen;
 
public class ApplicationLauncher {
 
    public static void main(String[] args) {
        new ApplicationLauncher().start();
    }
 
    private void start() {
        ConsoleHelper ui = new ConsoleHelper();
 
        // Services
        AuthenticationService authService = new AuthenticationService();
        PropertyService propertyService = new PropertyService();
        VehicleService vehicleService = new VehicleService();
 
        // UI screens
        LoginScreen loginScreen = new LoginScreen(ui, authService);
        PropertyMenuScreen propertyMenuScreen = new PropertyMenuScreen(ui, propertyService);
        VehicleMenuScreen vehicleMenuScreen = new VehicleMenuScreen(ui, vehicleService);
        TotalSummaryScreen totalSummaryScreen = new TotalSummaryScreen(ui, propertyService, vehicleService);
        MainMenuScreen mainMenuScreen = new MainMenuScreen(ui, propertyMenuScreen, vehicleMenuScreen, totalSummaryScreen);
 
        if (loginScreen.show()) {
            mainMenuScreen.show();
        }
    }
}