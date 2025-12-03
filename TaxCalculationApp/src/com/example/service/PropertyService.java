package com.example.service;


import java.util.ArrayList;
import java.util.List;

import com.example.exception.DataNotFoundException;
import com.example.model.Property;
import com.example.service.calculator.PropertyTaxCalculator;
import com.example.util.IdGenerator;
 
public class PropertyService {
 
    private final List<Property> properties = new ArrayList<>();
    private final PropertyTaxCalculator taxCalculator = new PropertyTaxCalculator();
 
    public Property createAndAddProperty(double baseValue,
                                         double builtUpArea,
                                         int ageInYears,
                                         boolean inCity) {
 
        Property property = new Property();
        property.setId(IdGenerator.nextPropertyId());
        property.setBaseValue(baseValue);
        property.setBuiltUpArea(builtUpArea);
        property.setAgeInYears(ageInYears);
        property.setInCity(inCity);
        property.setPropertyTax(0.0);
 
        properties.add(property);
        return property;
    }
 
    public List<Property> getAllProperties() {
        return properties;
    }
 
    public Property findById(long id) {
        return properties.stream()
                         .filter(p -> p.getId() == id)
                         .findFirst()
                         .orElseThrow(() ->
                                 new DataNotFoundException("Property with ID " + id + " not found."));
    }
 
    public double calculateTaxForProperty(long id) {
        Property property = findById(id);
        double tax = taxCalculator.calculateTax(property);
        property.setPropertyTax(tax);
        return tax;
    }
 
    public double getTotalPropertyTax() {
        return properties.stream()
                         .mapToDouble(Property::getPropertyTax)
                         .sum();
    }
 
    public int getPropertyCount() {
        return properties.size();
    }
 
    public boolean isEmpty() {
        return properties.isEmpty();
    }
}
