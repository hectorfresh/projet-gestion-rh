package com.gestion_rh.gestion_rh.repository.rh;

import com.gestion_rh.gestion_rh.model.rh.Contrat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ContratRepository extends JpaRepository<Contrat, Long> {

}
