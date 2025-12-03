package com.example.service.calculator;

import com.example.model.Property;

public class PropertyTaxCalculator implements TaxCalculator<Property> {
 
	 @Override
	    public double calculateTax(Property property) {
	 
	        // AGE FACTOR as per sample output:
	        // ageFactor = 0.2 × ageInYears
	        double ageFactor = property.getAgeInYears() * 0.2;
	 
	        double builtUpArea = property.getBuiltUpArea();
	        double baseValue = property.getBaseValue();
	 
	        // Base formula
	        double tax = builtUpArea * ageFactor * baseValue;
	 
	        // Extra ½ × built-up area if property is in city
	        if (property.isInCity()) {
	            tax += 0.35 * builtUpArea;
	        }
//	 
	        return tax;
    }
}