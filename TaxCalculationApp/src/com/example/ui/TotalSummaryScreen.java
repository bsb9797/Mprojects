package com.example.ui;

import com.example.service.PropertyService;
import com.example.service.VehicleService;
import com.example.util.FormatUtil;
 
public class TotalSummaryScreen {
 
    private final ConsoleHelper ui;
    private final PropertyService propertyService;
    private final VehicleService vehicleService;
 
    public TotalSummaryScreen(ConsoleHelper ui,
                              PropertyService propertyService,
                              VehicleService vehicleService) {
        this.ui = ui;
        this.propertyService = propertyService;
        this.vehicleService = vehicleService;
    }
 
    public void show() {
        ui.printHeader("TOTAL TAX SUMMARY");
 
        int propertyCount = propertyService.getPropertyCount();
        double propertyTotalTax = propertyService.getTotalPropertyTax();
 
        int vehicleCount = vehicleService.getVehicleCount();
        double vehicleTotalTax = vehicleService.getTotalVehicleTax();
 
        double grandTotal = propertyTotalTax + vehicleTotalTax;
 
        ui.printTableSeparator();
        System.out.printf("%-5s %-15s %-10s %-12s%n", "SR.NO", "PARTICULAR", "QUANTITY", "TAX");
        ui.printTableSeparator();
        System.out.printf("%-5d %-15s %-10d %-12s%n",
                1, "PROPERTIES", propertyCount, FormatUtil.formatAmount(propertyTotalTax));
        System.out.printf("%-5d %-15s %-10d %-12s%n",
                2, "VEHICLES", vehicleCount, FormatUtil.formatAmount(vehicleTotalTax));
        ui.printTableSeparator();
        System.out.printf("%-5s %-15s %-10s %-12s%n",
                "", "TOTAL", propertyCount + vehicleCount, FormatUtil.formatAmount(grandTotal));
        ui.printTableSeparator();
        ui.println("");
    }
}
