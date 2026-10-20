package com.gestion_rh.gestion_rh.repository.rh;

import com.gestion_rh.gestion_rh.model.rh.StatutBesoin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StatutBesoinRepository extends JpaRepository<StatutBesoin, Long> {
    Optional<StatutBesoin> findByNomIgnoreCase(String nom);
}
