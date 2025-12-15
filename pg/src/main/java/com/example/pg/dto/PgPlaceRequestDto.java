package com.example.pg.dto;


public class PgPlaceRequestDto {
 
    private String registrationNumber;
    private String city;
    private String locality;
    private double rentAmount;
    private double builtUpArea;
 
    public PgPlaceRequestDto() {
    }
 
    public String getRegistrationNumber() {
        return registrationNumber;
    }
 
    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }
 
    public String getCity() {
        return city;
    }
 
    public void setCity(String city) {
        this.city = city;
    }
 
    public String getLocality() {
        return locality;
    }
 
    public void setLocality(String locality) {
        this.locality = locality;
    }
 
    public double getRentAmount() {
        return rentAmount;
    }
 
    public void setRentAmount(double rentAmount) {
        this.rentAmount = rentAmount;
    }
 
    public double getBuiltUpArea() {
        return builtUpArea;
    }
 
    public void setBuiltUpArea(double builtUpArea) {
        this.builtUpArea = builtUpArea;
    }
}
 
