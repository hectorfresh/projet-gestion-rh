package com.gestion_rh.gestion_rh.repository.rh;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.gestion_rh.gestion_rh.model.rh.Poste;


@Repository 
public interface PosteRepository extends JpaRepository<Poste, Long> {
    
}
