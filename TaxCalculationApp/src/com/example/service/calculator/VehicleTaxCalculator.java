package com.example.service.calculator;

import com.example.model.Vehicle;
import com.example.model.VehicleType;
 
public class VehicleTaxCalculator implements TaxCalculator<Vehicle> {
 
    @Override
    public double calculateTax(Vehicle vehicle) {
 
        double base = vehicle.getMaxVelocity() + vehicle.getCapacity();
        double percent;
 
        VehicleType type = vehicle.getType();
 
        if (type == VehicleType.PETROL) {
            percent = 0.10;
        } else if (type == VehicleType.DIESEL) {
            percent = 0.11;
        } else { // CNG_LPG
            percent = 0.12;
        }
 
        double tax = base + (percent * vehicle.getPurchaseCost());
        return tax;
    }
}