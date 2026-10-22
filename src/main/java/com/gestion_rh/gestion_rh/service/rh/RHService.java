package com.gestion_rh.gestion_rh.service.rh;

import com.gestion_rh.gestion_rh.model.rh.Besoin;
import com.gestion_rh.gestion_rh.model.rh.ValidationBesoin;
import com.gestion_rh.gestion_rh.repository.rh.StatutBesoinRepository;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;

@Service
public class RHService {
    private final ValidationBesoinService validationBesoinService;
    private final StatutBesoinRepository statutBesoinRepository;

    public RHService(ValidationBesoinService validationBesoinService, StatutBesoinRepository saveStatutBesoinRepository) {
        this.validationBesoinService = validationBesoinService;
        this.statutBesoinRepository = saveStatutBesoinRepository;
    }

    public void ValiderListeBesoin(LinkedHashMap<Besoin, Boolean> map) {

        map.forEach((Besoin besoin,Boolean valeur)->{
            if(valeur != null) {
                ValidationBesoin validationBesoin = new ValidationBesoin();
                validationBesoin.setBesoin(besoin);

                if(valeur) {
                    validationBesoin.setStatut(statutBesoinRepository.getReferenceById((long)1));
                } else {
                    validationBesoin.setStatut(statutBesoinRepository.getReferenceById((long)2));
                }
                validationBesoinService.enregister(validationBesoin);
            }


        });
    }
}
