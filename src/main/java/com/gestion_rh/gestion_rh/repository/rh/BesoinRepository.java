package com.gestion_rh.gestion_rh.repository.rh;


import com.gestion_rh.gestion_rh.model.rh.Besoin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BesoinRepository extends JpaRepository<Besoin, Long> {

    List<Besoin> findByDemandeur_Id(int demandeurId);

    @Query("""
            SELECT b FROM besoin b
            WHERE NOT EXIST (
                SELECT v FROM validation_besoin v WHERE v.besoin = b
            )
            """)
    List<Besoin> findAllWithNoChild();
}
