package com.example.model;

public class Vehicle extends BaseEntity {
 
    private String registrationNumber;
    private String brand;
    private int maxVelocity;
    private int capacity;
    private VehicleType type;
    private double purchaseCost;
    private double vehicleTax; // 0.0 means not calculated yet
 
    public String getRegistrationNumber() {
        return registrationNumber;
    }
 
    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }
 
    public String getBrand() {
        return brand;
    }
 
    public void setBrand(String brand) {
        this.brand = brand;
    }
 
    public int getMaxVelocity() {
        return maxVelocity;
    }
 
    public void setMaxVelocity(int maxVelocity) {
        this.maxVelocity = maxVelocity;
    }
 
    public int getCapacity() {
        return capacity;
    }
 
    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }
 
    public VehicleType getType() {
        return type;
    }
 
    public void setType(VehicleType type) {
        this.type = type;
    }
 
    public double getPurchaseCost() {
        return purchaseCost;
    }
 
    public void setPurchaseCost(double purchaseCost) {
        this.purchaseCost = purchaseCost;
    }
 
    public double getVehicleTax() {
        return vehicleTax;
    }
 
    public void setVehicleTax(double vehicleTax) {
        this.vehicleTax = vehicleTax;
    }
}
 
