package com.gestion_rh.gestion_rh.service.rh;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gestion_rh.gestion_rh.model.rh.Poste;
import com.gestion_rh.gestion_rh.repository.rh.PosteRepository;

@Service 
public class PosteService {
    private final PosteRepository posteRepository;
    

    @Autowired 
    public PosteService(PosteRepository posteRepository){
        this.posteRepository=posteRepository;
    }

    public List<Poste> findAll(){
        return posteRepository.findAll();
    }
    

    
}
