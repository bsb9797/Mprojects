package com.example.service;

import java.util.ArrayList;
import java.util.List;

import com.example.exception.DataNotFoundException;
import com.example.model.Vehicle;
import com.example.service.calculator.VehicleTaxCalculator;
import com.example.util.IdGenerator;
 
public class VehicleService {
 
    private final List<Vehicle> vehicles = new ArrayList<>();
    private final VehicleTaxCalculator taxCalculator = new VehicleTaxCalculator();
 
    public Vehicle createAndAddVehicle(String registrationNumber,
                                       String brand,
                                       int maxVelocity,
                                       int capacity,
                                       com.example.model.VehicleType type,
                                       double purchaseCost) {
 
        Vehicle vehicle = new Vehicle();
        vehicle.setId(IdGenerator.nextVehicleId());
        vehicle.setRegistrationNumber(registrationNumber);
        vehicle.setBrand(brand);
        vehicle.setMaxVelocity(maxVelocity);
        vehicle.setCapacity(capacity);
        vehicle.setType(type);
        vehicle.setPurchaseCost(purchaseCost);
        vehicle.setVehicleTax(0.0);
 
        vehicles.add(vehicle);
        return vehicle;
    }
 
    public List<Vehicle> getAllVehicles() {
        return vehicles;
    }
 
    public Vehicle findByRegistrationNumber(String regNo) {
        return vehicles.stream()
                       .filter(v -> v.getRegistrationNumber().equals(regNo))
                       .findFirst()
                       .orElseThrow(() ->
                               new DataNotFoundException("Vehicle with registration number " + regNo + " not found."));
    }
 
    public double calculateTaxForVehicle(String regNo) {
        Vehicle vehicle = findByRegistrationNumber(regNo);
        double tax = taxCalculator.calculateTax(vehicle);
        vehicle.setVehicleTax(tax);
        return tax;
    }
 
    public double getTotalVehicleTax() {
        return vehicles.stream()
                       .mapToDouble(Vehicle::getVehicleTax)
                       .sum();
    }
 
    public int getVehicleCount() {
        return vehicles.size();
    }
 
    public boolean isEmpty() {
        return vehicles.isEmpty();
    }
}
