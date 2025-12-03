package com.example.util;

import com.example.exception.ValidationException;

public final class InputValidator {
 
    private InputValidator() {
    }
 
    // Property validations
 
    public static double validateBaseValue(double baseValue) {
        if (baseValue <= 0) {
            throw new ValidationException("Base value must be a positive non-zero number.");
        }
        return baseValue;
    }
 
    public static double validateBuiltUpArea(double area) {
        if (area <= 0) {
            throw new ValidationException("Built-up area must be a positive non-zero number.");
        }
        return area;
    }
 
    public static int validateAge(int age) {
        if (age <= 0) {
            throw new ValidationException("Age must be a positive non-zero number.");
        }
        return age;
    }
 
    public static boolean validateInCityChar(char c) {
        if (c == 'Y' || c == 'y') {
            return true;
        }
        if (c == 'N' || c == 'n') {
            return false;
        }
        throw new ValidationException("Please enter Y or N only.");
    }
 
    // Vehicle validations
 
    public static String validateRegistrationNumber(String regNo) {
        if (regNo == null || regNo.length() != 4) {
            throw new ValidationException("Registration number must be exactly 4 digits.");
        }
        for (char c : regNo.toCharArray()) {
            if (!Character.isDigit(c)) {
                throw new ValidationException("Registration number must contain only digits.");
            }
        }
        if ("0000".equals(regNo)) {
            throw new ValidationException("0000 is not a valid registration number.");
        }
        return regNo;
    }
 
    public static String validateBrand(String brand) {
        if (brand == null || brand.trim().isEmpty()) {
            throw new ValidationException("Brand name cannot be empty.");
        }
        return brand.trim();
    }
 
    public static int validateVelocity(int velocity) {
        if (velocity < 120 || velocity > 300) {
            throw new ValidationException("Maximum velocity must be between 120 and 300 kmph.");
        }
        return velocity;
    }
 
    public static int validateCapacity(int seats) {
        if (seats < 2 || seats > 50) {
            throw new ValidationException("Capacity must be between 2 and 50 seats.");
        }
        return seats;
    }
 
    public static double validatePurchaseCost(double cost) {
        if (cost <= 0) {
            throw new ValidationException("Purchase cost must be a positive non-zero value.");
        }
        // Range from problem statement (approx, can adjust if trainer says)
        if (cost < 50000 || cost > 1000000) {
            throw new ValidationException("Purchase cost must be between 50000 and 1000000.");
        }
        return cost;
    }
}