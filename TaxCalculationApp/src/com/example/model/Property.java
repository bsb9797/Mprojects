package com.example.model;

public class Property extends BaseEntity {
	 
    private double baseValue;
    private double builtUpArea;
    private int ageInYears;
    private boolean inCity;
    private double propertyTax; // 0.0 means not calculated yet
 
    public double getBaseValue() {
        return baseValue;
    }
 
    public void setBaseValue(double baseValue) {
        this.baseValue = baseValue;
    }
 
    public double getBuiltUpArea() {
        return builtUpArea;
    }
 
    public void setBuiltUpArea(double builtUpArea) {
        this.builtUpArea = builtUpArea;
    }
 
    public int getAgeInYears() {
        return ageInYears;
    }
 
    public void setAgeInYears(int ageInYears) {
        this.ageInYears = ageInYears;
    }
 
    public boolean isInCity() {
        return inCity;
    }
 
    public void setInCity(boolean inCity) {
        this.inCity = inCity;
    }
 
    public double getPropertyTax() {
        return propertyTax;
    }
 
    public void setPropertyTax(double propertyTax) {
        this.propertyTax = propertyTax;
    }
}
