package com.example.service.calculator;

import com.example.model.BaseEntity;

public interface TaxCalculator<T extends BaseEntity> {
 
    double calculateTax(T entity);
}
