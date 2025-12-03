package com.example.ui;

import com.example.service.AuthenticationService;

public class LoginScreen {
 
    private final ConsoleHelper ui;
    private final AuthenticationService authService;
 
    public LoginScreen(ConsoleHelper ui, AuthenticationService authService) {
        this.ui = ui;
        this.authService = authService;
    }
 
    public boolean show() {
        ui.printHeader("WELCOME TO TAX CALCULATION APP");
        ui.println("PLEASE LOGIN TO CONTINUE");
 
        int attempts = 0;
        while (attempts < 3) {
            String username = ui.readString("USERNAME  : ");
            String password = ui.readString("PASSWORD  : ");
 
            if (authService.authenticate(username, password)) {
                ui.println("LOGIN SUCCESSFUL.\n");
                return true;
            } else {
                ui.println("INVALID CREDENTIALS. TRY AGAIN.\n");
                attempts++;
            }
        }
        ui.println("TOO MANY FAILED ATTEMPTS. EXITING...");
        return false;
    }
}
