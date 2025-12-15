package com.example.pg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;
 
import com.example.pg.entity.PgPlace;
import com.example.pg.service.OwnerService;
 
@RestController
@RequestMapping("/owner")
public class OwnerController {
 
    @Autowired
    private OwnerService ownerService;
 
    // Add new PG place
    @PostMapping("/pg/{ownerId}")
    public PgPlace addPgPlace(@RequestBody PgPlace pgPlace,
                              @PathVariable Long ownerId) {
        return ownerService.addPgPlace(pgPlace, ownerId);
    }
 
    // Retrieve all PGs added by owner
    @GetMapping("/pg/{ownerId}")
    public List<PgPlace> getAllPgByOwner(@PathVariable Long ownerId) {
        return ownerService.getAllPgPlacesByOwner(ownerId);
    }
 
    // Update PG details
    @PutMapping("/pg")
    public PgPlace updatePgPlace(@RequestBody PgPlace pgPlace) {
        return ownerService.updatePgPlace(pgPlace);
    }
 
    // Change PG availability
    @PutMapping("/pg/{pgId}/availability/{status}")
    public PgPlace changeAvailability(@PathVariable Long pgId,
                                      @PathVariable boolean status) {
        return ownerService.changeAvailabilityStatus(pgId, status);
    }
 
    // Delete PG place
    @DeleteMapping("/pg/{pgId}")
    public void deletePgPlace(@PathVariable Long pgId) {
        ownerService.deletePgPlace(pgId);
    }
}
 
