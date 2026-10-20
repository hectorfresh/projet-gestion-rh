package com.gestion_rh.gestion_rh.repository.rh;

import com.gestion_rh.gestion_rh.model.rh.StatutBesoin;
import com.gestion_rh.gestion_rh.model.rh.ValidationBesoin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ValidationBesoinRepository extends JpaRepository<ValidationBesoin, Long> {
}
