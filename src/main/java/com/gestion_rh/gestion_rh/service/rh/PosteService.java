package com.gestion_rh.gestion_rh.service.rh;
import java.util.List;

import com.gestion_rh.gestion_rh.model.rh.Departement;
import com.gestion_rh.gestion_rh.repository.rh.DepartementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gestion_rh.gestion_rh.model.rh.Poste;
import com.gestion_rh.gestion_rh.repository.rh.PosteRepository;

@Service 
public class PosteService {
    private final PosteRepository posteRepository;
    private final DepartementRepository departementRepository;
    

    @Autowired 
    public PosteService(PosteRepository posteRepository, DepartementRepository departementRepository) {
        this.posteRepository=posteRepository;
        this.departementRepository=departementRepository;
    }

    public Poste creerPoste(Poste poste) {
        Long departementId = poste.getDepartement().getId();

        Departement departement = departementRepository
                .findById(departementId)
                .orElseThrow(() ->
                        new RuntimeException("Département introuvable"));

        poste.setDepartement(departement);

        return posteRepository.save(poste);
    }

    public List<Poste> findAll(){
        return posteRepository.findAll();
    }
    

    
}
