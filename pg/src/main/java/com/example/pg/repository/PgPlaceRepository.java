package com.example.pg.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.example.pg.entity.PgPlace;
 
public interface PgPlaceRepository extends JpaRepository<PgPlace, Long> {
 
    // Retrieve available PGs by city
    List<PgPlace> findByCityAndAvailableTrue(String city);
 
    // Retrieve available PGs by locality
    List<PgPlace> findByLocalityAndAvailableTrue(String locality);
 
    // Retrieve all PGs added by an owner
    List<PgPlace> findByOwnerId(Long ownerId);
}
