package com.example.pg.service;

import java.util.List;
import com.example.pg.entity.PgPlace;
import com.example.pg.entity.Owner;
 
public interface PgService {
 
    // Retrieve available PGs in a city
    List<PgPlace> getAvailablePgByCity(String city);
 
    // Retrieve available PGs in a locality
    List<PgPlace> getAvailablePgByLocality(String locality);
 
    // Retrieve PG place details by id
    PgPlace getPgDetailsById(Long pgId);
 
    // Retrieve owner details of a PG (only if available)
    Owner getOwnerDetailsByPgId(Long pgId);
}
