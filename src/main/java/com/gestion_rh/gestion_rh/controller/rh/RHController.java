package com.gestion_rh.gestion_rh.controller.rh;

import com.gestion_rh.gestion_rh.model.rh.Besoin;
import com.gestion_rh.gestion_rh.service.rh.BesoinService;
import com.gestion_rh.gestion_rh.service.rh.RHService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
@RequestMapping("/ressources-humaine")
public class RHController {
    private final BesoinService besoinService;
    private final RHService rhService;

    public RHController(BesoinService besoinService, RHService rhService) {
        this.besoinService = besoinService;
        this.rhService = rhService;
    }

    @GetMapping("/liste")
    public String afficherListeDemandePasEncoreValider(Model model) {
        List<Besoin> besoinList = besoinService.rechercheBesoinPasEncoreDansValidation();
        LinkedHashMap<Besoin, Boolean> map = new LinkedHashMap<>();

        for (Besoin besoin : besoinList) {
            map.put(besoin, null);
        }

        model.addAttribute("besoinsAvecBool",map);
        return "/ressources-humaine/liste";
    }

    @PostMapping("/save")
    public String saveDecisions(
            @RequestParam("ids") List<Long> ids,
            @RequestParam("values") List<String> values) {

        LinkedHashMap<Besoin, Boolean> decisions =
                new LinkedHashMap<>();

        for (int i = 0; i < ids.size(); i++) {

            Besoin besoin = besoinService.getById(ids.get(i));

            String value = values.get(i);

            Boolean accepted = value.isEmpty()
                    ? null
                    : Boolean.valueOf(value);

            decisions.put(besoin, accepted);
        }

        rhService.ValiderListeBesoin(decisions);

        return "redirect:/ressources-humaine/liste";
    }
}
