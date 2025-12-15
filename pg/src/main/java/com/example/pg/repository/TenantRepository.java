package com.example.pg.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import com.example.pg.entity.Tenant;

public interface TenantRepository extends JpaRepository<Tenant, Long> {
}