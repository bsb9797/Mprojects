package com.example.pg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;
 
import com.example.pg.entity.PgPlace;
import com.example.pg.entity.Owner;
import com.example.pg.service.PgService;
 
@RestController
@RequestMapping("/pg")
public class PgController {
 
    @Autowired
    private PgService pgService;
 
    // Retrieve available PGs by city
    @GetMapping("/city/{city}")
    public List<PgPlace> getPgByCity(@PathVariable String city) {
        return pgService.getAvailablePgByCity(city);
    }
 
    // Retrieve available PGs by locality
    @GetMapping("/locality/{locality}")
    public List<PgPlace> getPgByLocality(@PathVariable String locality) {
        return pgService.getAvailablePgByLocality(locality);
    }
 
    // Retrieve PG details by ID
    @GetMapping("/details/{id}")
    public PgPlace getPgDetails(@PathVariable Long id) {
        return pgService.getPgDetailsById(id);
    }
 
    // Retrieve owner details only if PG is available
    @GetMapping("/owner/{pgId}")
    public Owner getOwnerDetails(@PathVariable Long pgId) {
        return pgService.getOwnerDetailsByPgId(pgId);
    }
}
 