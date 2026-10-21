package com.gestion_rh.gestion_rh.service.rh;

import com.gestion_rh.gestion_rh.model.rh.*;
import com.gestion_rh.gestion_rh.repository.rh.*;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class BesoinService {

    private final BesoinRepository besoinRepository;
    private final PosteRepository posteRepository;
    private final EmployeRepository employeRepository;
    private final StatutBesoinRepository statutRepository;
    private final ValidationBesoinRepository validationBesoinRepository;

    public BesoinService(
            BesoinRepository besoinRepository,
            PosteRepository posteRepository,
            EmployeRepository employeRepository,
            StatutBesoinRepository statutRepository, ValidationBesoinRepository validationBesoinRepository) {

        this.besoinRepository = besoinRepository;
        this.posteRepository = posteRepository;
        this.employeRepository = employeRepository;
        this.statutRepository = statutRepository;
        this.validationBesoinRepository = validationBesoinRepository;
    }

    @Transactional
    public Besoin creerBesoin(
            Besoin besoin,
            Long posteId,
            Long demandeurId) {

        Poste poste = posteRepository.findById(posteId)
                .orElseThrow(() ->
                        new RuntimeException("Poste introuvable"));

        Employe demandeur = employeRepository.findById(demandeurId)
                .orElseThrow(() ->
                        new RuntimeException("Employé introuvable"));

        besoin.setPoste(poste);
        besoin.setDemandeur(demandeur);
        besoin.setDateCreation(LocalDateTime.now());

        return besoinRepository.save(besoin);
    }

    @Transactional(readOnly = true)
    public List<Besoin> rechercheBesoinPasEncoreDansValidation() {
        return besoinRepository.findAllWithNoChild();
    }

    @Transactional(readOnly = true)
    public Besoin getById(Long id) {
        return besoinRepository.findById(id)
                .orElseThrow(() ->
                        new RuntimeException("Besoin introuvable"));
    }

    @Transactional(readOnly = true)
    public List<Besoin> getAll() {
        return besoinRepository.findAll();
    }

    @Transactional(readOnly = true)
    public List<Besoin> getByDemandeur(int demandeurId) {
        return besoinRepository.findByDemandeur_Id(demandeurId);
    }
}