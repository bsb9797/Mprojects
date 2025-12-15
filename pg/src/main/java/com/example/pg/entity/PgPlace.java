package com.example.pg.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
 
@Entity
@Table(name = "pg_place")
public class PgPlace {
 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
 
    private String registrationNumber;
 
    private String city;
 
    private String locality;
 
    private double rentAmount;
 
    private double builtUpArea;
 
    private boolean available;
 
    private int visitorCount;
 
    @ManyToOne
    @JoinColumn(name = "owner_id")
    @JsonIgnore
    private Owner owner;
 
    public PgPlace() {
    }
 
    public PgPlace(String registrationNumber, String city, String locality,
                   double rentAmount, double builtUpArea, boolean available) {
        this.registrationNumber = registrationNumber;
        this.city = city;
        this.locality = locality;
        this.rentAmount = rentAmount;
        this.builtUpArea = builtUpArea;
        this.available = available;
        this.visitorCount = 0;
    }
 
    // getters and setters
    public Long getId() {
        return id;
    }
 
    public void setId(Long id) {
        this.id = id;
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
 
    public boolean isAvailable() {
        return available;
    }
 
    public void setAvailable(boolean available) {
        this.available = available;
    }
 
    public int getVisitorCount() {
        return visitorCount;
    }
 
    public void setVisitorCount(int visitorCount) {
        this.visitorCount = visitorCount;
    }
 
    public Owner getOwner() {
        return owner;
    }
 
    public void setOwner(Owner owner) {
        this.owner = owner;
    }
}
 
