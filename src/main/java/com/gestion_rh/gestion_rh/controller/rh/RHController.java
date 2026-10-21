package com.gestion_rh.gestion_rh.controller.rh;

import com.gestion_rh.gestion_rh.model.rh.Besoin;
import com.gestion_rh.gestion_rh.service.rh.BesoinService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/ressources-humaine")
public class RHController {
    private final BesoinService besoinService;

    public RHController(BesoinService besoinService) {
        this.besoinService = besoinService;
    }

    @GetMapping("/liste")
    public String afficherListeDemandePasEncoreValider(Model model) {
        List<Besoin> besoinList = besoinService.rechercheBesoinPasEncoreDansValidation();
        HashMap<Besoin, Boolean> hashMap = new HashMap<>();

        for (Besoin besoin : besoinList) {
            hashMap.put(besoin, null);
        }

        model.addAttribute("besoinsAvecBool",hashMap);
        return "/ressources-humaine/liste";
    }
}
