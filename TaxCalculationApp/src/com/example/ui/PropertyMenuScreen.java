package com.example.ui;

import java.util.List;

import com.example.exception.DataNotFoundException;
import com.example.exception.ValidationException;
import com.example.model.Property;
import com.example.service.PropertyService;
import com.example.util.FormatUtil;
import com.example.util.InputValidator;
 
public class PropertyMenuScreen {
 
    private final ConsoleHelper ui;
    private final PropertyService propertyService;
 
    public PropertyMenuScreen(ConsoleHelper ui, PropertyService propertyService) {
        this.ui = ui;
        this.propertyService = propertyService;
    }
 
    public void show() {
        int choice;
        do {
            ui.printHeader("PROPERTY TAX");
            ui.println("1. ADD PROPERTY DETAILS");
            ui.println("2. CALCULATE PROPERTY TAX");
            ui.println("3. DISPLAY ALL PROPERTIES");
            ui.println("4. BACK TO MAIN MENU");
            choice = ui.readInt("ENTER YOUR CHOICE : ");
 
            switch (choice) {
            case 1:
                addProperty();
                break;
            case 2:
                calculatePropertyTax();
                break;
            case 3:
                displayAllProperties();
                break;
            case 4:
                break;
            default:
                ui.println("INVALID OPTION.");
            }
        } while (choice != 4);
    }
 
    private void addProperty() {
        try {
            ui.println("\nENTER THE PROPERTY DETAILS");
 
            double baseValue = InputValidator.validateBaseValue(
                    ui.readDouble("ENTER THE BASE VALUE OF LAND  : "));
            double builtUpArea = InputValidator.validateBuiltUpArea(
                    ui.readDouble("ENTER THE BUILT-UP AREA OF LAND : "));
            int age = InputValidator.validateAge(
                    ui.readInt("ENTER THE AGE OF LAND IN YEARS   : "));
            boolean inCity = InputValidator.validateInCityChar(
                    ui.readChar("IS THE LAND LOCATED IN CITY? (Y: YES, N: NO) : "));
 
            Property property = propertyService.createAndAddProperty(baseValue, builtUpArea, age, inCity);
            ui.println("PROPERTY ADDED WITH ID : " + property.getId() + "\n");
        } catch (ValidationException e) {
            ui.println("ERROR : " + e.getMessage() + "\n");
        }
    }
 
    private void calculatePropertyTax() {
        if (propertyService.isEmpty()) {
            ui.println("\nNO PROPERTY DATA PRESENT AT THIS MOMENT.\n");
            return;
        }
 
        displayAllProperties();
        long id = ui.readInt("ENTER THE PROPERTY ID TO CALCULATE THE TAX : ");
 
        try {
            double tax = propertyService.calculateTaxForProperty(id);
            ui.println("PROPERTY TAX FOR PROPERTY ID " + id + " IS " + FormatUtil.formatAmount(tax) + "\n");
        } catch (DataNotFoundException e) {
            ui.println("ERROR : " + e.getMessage() + "\n");
        }
    }
 
    private void displayAllProperties() {
        List<Property> list = propertyService.getAllProperties();
        if (list.isEmpty()) {
            ui.println("\nNO PROPERTY DATA PRESENT AT THIS MOMENT.\n");
            return;
        }
 
        ui.printTableSeparator();
        System.out.printf("%-5s %-12s %-12s %-10s %-8s %-12s%n",
                "ID", "BUILT-UP", "BASE VALUE", "AGE(YRS)", "IN CITY", "PROPERTY TAX");
        ui.printTableSeparator();
 
        for (Property p : list) {
            System.out.printf("%-5d %-12s %-12s %-10d %-8s %-12s%n",
                    p.getId(),
                    FormatUtil.formatAmount(p.getBuiltUpArea()),
                    FormatUtil.formatAmount(p.getBaseValue()),
                    p.getAgeInYears(),
                    p.isInCity() ? "Y" : "N",
                    FormatUtil.formatAmount(p.getPropertyTax()));
        }
        ui.printTableSeparator();
        ui.println("");
    }
}