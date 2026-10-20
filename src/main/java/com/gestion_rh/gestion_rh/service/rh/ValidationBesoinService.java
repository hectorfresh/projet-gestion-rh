package com.gestion_rh.gestion_rh.service.rh;

import com.gestion_rh.gestion_rh.model.rh.ValidationBesoin;
import com.gestion_rh.gestion_rh.repository.rh.ValidationBesoinRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ValidationBesoinService {
    ValidationBesoinRepository validationBesoinRepository;

    public ValidationBesoinService(ValidationBesoinRepository validationBesoinRepository) {
        this.validationBesoinRepository = validationBesoinRepository;
    }

    public ValidationBesoin enregister(ValidationBesoin validationBesoin) {

        return validationBesoinRepository.save(validationBesoin);
    }

    public List<ValidationBesoin> getAll() {

        return validationBesoinRepository.findAll();
    }





}
