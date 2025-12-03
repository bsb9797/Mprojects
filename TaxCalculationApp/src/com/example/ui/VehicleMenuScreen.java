package com.example.ui;

import java.util.List;

import com.example.exception.DataNotFoundException;
import com.example.exception.ValidationException;
import com.example.model.Vehicle;
import com.example.model.VehicleType;
import com.example.service.VehicleService;
import com.example.util.FormatUtil;
import com.example.util.InputValidator;
 
public class VehicleMenuScreen {
 
    private final ConsoleHelper ui;
    private final VehicleService vehicleService;
 
    public VehicleMenuScreen(ConsoleHelper ui, VehicleService vehicleService) {
        this.ui = ui;
        this.vehicleService = vehicleService;
    }
 
    public void show() {
        int choice;
        do {
            ui.printHeader("VEHICLE TAX");
            ui.println("1. ADD VEHICLE DETAILS");
            ui.println("2. CALCULATE VEHICLE TAX");
            ui.println("3. DISPLAY ALL VEHICLES");
            ui.println("4. BACK TO MAIN MENU");
            choice = ui.readInt("ENTER YOUR CHOICE : ");
 
            switch (choice) {
            case 1:
                addVehicle();
                break;
            case 2:
                calculateVehicleTax();
                break;
            case 3:
                displayAllVehicles();
                break;
            case 4:
                break;
            default:
                ui.println("INVALID OPTION.");
            }
        } while (choice != 4);
    }
 
    private void addVehicle() {
        try {
            ui.println("\nENTER THE VEHICLE DETAILS");
 
            String regNo = InputValidator.validateRegistrationNumber(
                    ui.readString("ENTER THE VEHICLE REGISTRATION NUMBER : "));
            String brand = InputValidator.validateBrand(
                    ui.readString("ENTER BRAND OF THE VEHICLE            : "));
            int velocity = InputValidator.validateVelocity(
                    ui.readInt("ENTER THE MAXIMUM VELOCITY (KMPH)     : "));
            int capacity = InputValidator.validateCapacity(
                    ui.readInt("ENTER CAPACITY (NUMBER OF SEATS)      : "));
 
            ui.println("CHOOSE THE TYPE OF THE VEHICLE :");
            ui.println("1. PETROL DRIVEN");
            ui.println("2. DIESEL DRIVEN");
            ui.println("3. CNG/LPG DRIVEN");
            int typeChoice = ui.readInt("ENTER YOUR CHOICE : ");
 
            VehicleType type;
            switch (typeChoice) {
            case 1:
                type = VehicleType.PETROL;
                break;
            case 2:
                type = VehicleType.DIESEL;
                break;
            case 3:
                type = VehicleType.CNG_LPG;
                break;
            default:
                throw new ValidationException("Invalid vehicle type selected.");
            }
 
            double cost = InputValidator.validatePurchaseCost(
                    ui.readDouble("ENTER THE PURCHASE COST OF THE VEHICLE : "));
 
            Vehicle vehicle = vehicleService.createAndAddVehicle(regNo, brand, velocity,
                    capacity, type, cost);
            ui.println("VEHICLE ADDED WITH INTERNAL ID : " + vehicle.getId() + "\n");
        } catch (ValidationException e) {
            ui.println("ERROR : " + e.getMessage() + "\n");
        }
    }
 
    private void calculateVehicleTax() {
        if (vehicleService.isEmpty()) {
            ui.println("\nNO VEHICLE DATA PRESENT AT THIS MOMENT.\n");
            return;
        }
 
        displayAllVehicles();
        String regNo = ui.readString("ENTER THE REGISTRATION NO OF VEHICLE TO CALCULATE THE TAX : ");
 
        try {
            double tax = vehicleService.calculateTaxForVehicle(regNo);
            ui.println("VEHICLE TAX FOR REGISTRATION NO " + regNo + " IS " + FormatUtil.formatAmount(tax) + "\n");
        } catch (DataNotFoundException e) {
            ui.println("ERROR : " + e.getMessage() + "\n");
        }
    }
 
    private void displayAllVehicles() {
        List<Vehicle> list = vehicleService.getAllVehicles();
        if (list.isEmpty()) {
            ui.println("\nNO VEHICLE DATA PRESENT AT THIS MOMENT.\n");
            return;
        }
 
        ui.printTableSeparator();
        System.out.printf("%-12s %-10s %-12s %-10s %-11s %-12s %-12s%n",
                "REG NO", "BRAND", "MAX VELOCITY", "SEATS", "TYPE",
                "PURCHASE", "VEHICLE TAX");
        ui.printTableSeparator();
 
        for (Vehicle v : list) {
            System.out.printf("%-12s %-10s %-12d %-10d %-11s %-12s %-12s%n",
                    v.getRegistrationNumber(),
                    v.getBrand(),
                    v.getMaxVelocity(),
                    v.getCapacity(),
                    v.getType().name(),
                    FormatUtil.formatAmount(v.getPurchaseCost()),
                    FormatUtil.formatAmount(v.getVehicleTax()));
        }
        ui.printTableSeparator();
        ui.println("");
    }
}
