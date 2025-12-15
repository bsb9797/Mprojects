package com.example.pg.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.pg.repository.PgPlaceRepository;
import com.example.pg.repository.OwnerRepository;
import com.example.pg.entity.PgPlace;
import com.example.pg.entity.Owner;
import com.example.pg.service.PgService;
import com.example.pg.exception.ResourceNotFoundException;
 
import java.util.List;
 
@Service
public class PgServiceImpl implements PgService {
 
    @Autowired
    private PgPlaceRepository pgPlaceRepository;
 
    @Autowired
    private OwnerRepository ownerRepository;
 
    @Override
    public List<PgPlace> getAvailablePgByCity(String city) {
        return pgPlaceRepository.findByCityAndAvailableTrue(city);
    }
 
    @Override
    public List<PgPlace> getAvailablePgByLocality(String locality) {
        return pgPlaceRepository.findByLocalityAndAvailableTrue(locality);
    }
 
    @Override
    public PgPlace getPgDetailsById(Long pgId) {
        return pgPlaceRepository.findById(pgId)
                .orElseThrow(() -> new ResourceNotFoundException("PG Place not found with ID: " + pgId));
    }
 
    @Override
    public Owner getOwnerDetailsByPgId(Long pgId) {
        PgPlace pgPlace = getPgDetailsById(pgId);
 
        // show owner details only if PG is available
        if (!pgPlace.isAvailable()) {
            throw new ResourceNotFoundException("PG Place is occupied. Owner details not available.");
        }
 
        return pgPlace.getOwner();
    }
}
 
