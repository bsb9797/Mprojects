package com.example.pg.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import com.example.pg.entity.Owner;

public interface OwnerRepository extends JpaRepository<Owner, Long> {
}
