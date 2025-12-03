package com.example.util;

public final class IdGenerator {
	 
    private static long propertyIdCounter = 1;
    private static long vehicleIdCounter = 1;
 
    private IdGenerator() {
    }
 
    public static long nextPropertyId() {
        return propertyIdCounter++;
    }
 
    public static long nextVehicleId() {
        return vehicleIdCounter++;
    }
}