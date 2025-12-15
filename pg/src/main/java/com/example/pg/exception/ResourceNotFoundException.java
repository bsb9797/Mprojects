package com.example.pg.exception;


public class ResourceNotFoundException extends RuntimeException {

   public ResourceNotFoundException(String message) {
       super(message);
   }
}