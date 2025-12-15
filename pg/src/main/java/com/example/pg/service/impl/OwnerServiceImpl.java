package com.example.pg.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.pg.repository.PgPlaceRepository;
import com.example.pg.repository.OwnerRepository;
import com.example.pg.entity.PgPlace;
import com.example.pg.entity.Owner;
import com.example.pg.service.OwnerService;
import com.example.pg.exception.ResourceNotFoundException;
import com.example.pg.exception.InvalidAgeException;
 
import java.util.List;
 
@Service
public class OwnerServiceImpl implements OwnerService {
 
    @Autowired
    private PgPlaceRepository pgPlaceRepository;
 
    @Autowired
    private OwnerRepository ownerRepository;
 
    @Override
    public PgPlace addPgPlace(PgPlace pgPlace, Long ownerId) {
        Owner owner = ownerRepository.findById(ownerId)
                .orElseThrow(() -> new ResourceNotFoundException("Owner not found with ID: " + ownerId));
 
        // validation: owner must be 18+
        if (owner.getAge() < 18) {
            throw new InvalidAgeException("Owner must be 18 years or older to add PG place");
        }
 
        pgPlace.setOwner(owner);
        pgPlace.setAvailable(true);
        pgPlace.setVisitorCount(0);
 
        return pgPlaceRepository.save(pgPlace);
    }
 
    @Override
    public List<PgPlace> getAllPgPlacesByOwner(Long ownerId) {
        return pgPlaceRepository.findByOwnerId(ownerId);
    }
 
    @Override
    public PgPlace changeAvailabilityStatus(Long pgId, boolean available) {
        PgPlace pgPlace = pgPlaceRepository.findById(pgId)
                .orElseThrow(() -> new ResourceNotFoundException("PG Place not found with ID: " + pgId));
 
        pgPlace.setAvailable(available);
        return pgPlaceRepository.save(pgPlace);
    }
 
    @Override
    public PgPlace updatePgPlace(PgPlace pgPlace) {
        PgPlace existing = pgPlaceRepository.findById(pgPlace.getId())
                .orElseThrow(() -> new ResourceNotFoundException("PG Place not found with ID: " + pgPlace.getId()));
 
        existing.setCity(pgPlace.getCity());
        existing.setLocality(pgPlace.getLocality());
        existing.setBuiltUpArea(pgPlace.getBuiltUpArea());
        existing.setRentAmount(pgPlace.getRentAmount());
        existing.setAvailable(pgPlace.isAvailable());
 
        return pgPlaceRepository.save(existing);
    }
 
    @Override
    public void deletePgPlace(Long pgId) {
        PgPlace pgPlace = pgPlaceRepository.findById(pgId)
                .orElseThrow(() -> new ResourceNotFoundException("PG Place not found with ID: " + pgId));
        pgPlaceRepository.delete(pgPlace);
    }
}
 
