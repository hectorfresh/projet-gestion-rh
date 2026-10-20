package com.gestion_rh.gestion_rh.repository.rh;


import com.gestion_rh.gestion_rh.model.rh.Besoin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BesoinRepository extends JpaRepository<Besoin, Long> {

    List<Besoin> findByDemandeur_Id(int demandeurId);

}
