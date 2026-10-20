package com.gestion_rh.gestion_rh.repository.rh;

import com.gestion_rh.gestion_rh.model.rh.Finance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FinanceRepository extends JpaRepository<Finance, Long> {
    List<Finance> findByAnnee(int annee);

    @Query("SELECT SUM(f.montant) FROM Finance f WHERE f.annee = :annee")
    int getTotalAnnee(@Param("annee") Integer annee);


}
