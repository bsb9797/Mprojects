package com.example.pg.service;

import java.util.List;
import com.example.pg.entity.PgPlace;
 
public interface OwnerService {
 
    // Add new PG place
    PgPlace addPgPlace(PgPlace pgPlace, Long ownerId);
 
    // Retrieve all PGs added by owner
    List<PgPlace> getAllPgPlacesByOwner(Long ownerId);
 
    // Change availability status
    PgPlace changeAvailabilityStatus(Long pgId, boolean available);
 
    // Edit PG place details
    PgPlace updatePgPlace(PgPlace pgPlace);
 
    // Delete PG place
    void deletePgPlace(Long pgId);
}