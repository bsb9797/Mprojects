package com.example.service;

public class AuthenticationService {
	 
    private static final String DEFAULT_USERNAME = "bhargav";
    private static final String DEFAULT_PASSWORD = "b123";
 
    public boolean authenticate(String username, String password) {
        return DEFAULT_USERNAME.equals(username) && DEFAULT_PASSWORD.equals(password);
    }
}