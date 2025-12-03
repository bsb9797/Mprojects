package com.example.ui;

public class MainMenuScreen {
	 
    private final ConsoleHelper ui;
    private final PropertyMenuScreen propertyMenuScreen;
    private final VehicleMenuScreen vehicleMenuScreen;
    private final TotalSummaryScreen totalSummaryScreen;
 
    public MainMenuScreen(ConsoleHelper ui,
                          PropertyMenuScreen propertyMenuScreen,
                          VehicleMenuScreen vehicleMenuScreen,
                          TotalSummaryScreen totalSummaryScreen) {
        this.ui = ui;
        this.propertyMenuScreen = propertyMenuScreen;
        this.vehicleMenuScreen = vehicleMenuScreen;
        this.totalSummaryScreen = totalSummaryScreen;
    }
 
    public void show() {
        int choice;
        do {
            ui.printHeader("MAIN MENU");
            ui.println("1. PROPERTY TAX");
            ui.println("2. VEHICLE TAX");
            ui.println("3. TOTAL");
            ui.println("4. EXIT");
            choice = ui.readInt("ENTER YOUR CHOICE : ");
 
            switch (choice) {
            case 1:
                propertyMenuScreen.show();
                break;
            case 2:
                vehicleMenuScreen.show();
                break;
            case 3:
                totalSummaryScreen.show();
                break;
            case 4:
                ui.println("\nTHANKS VISIT AGAIN.\n");
                break;
            default:
                ui.println("INVALID OPTION.");
            }
        } while (choice != 4);
    }
}