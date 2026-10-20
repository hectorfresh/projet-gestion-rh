
package com.gestion_rh.gestion_rh.controller.rh;

import com.gestion_rh.gestion_rh.model.rh.Besoin;
import com.gestion_rh.gestion_rh.repository.rh.EmployeRepository;
import com.gestion_rh.gestion_rh.service.rh.BesoinService;
import com.gestion_rh.gestion_rh.service.rh.PosteService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.format.annotation.DateTimeFormat;

@Controller
@RequestMapping("/besoin")
public class BesoinController {

    private final PosteService posteService;
    private final BesoinService besoinService;
    private final EmployeRepository employeRepository;

    public BesoinController(
            PosteService posteService,
            BesoinService besoinService, EmployeRepository employeRepository) {
        this.posteService = posteService;
        this.besoinService = besoinService;
        this.employeRepository = employeRepository;
    }

    @GetMapping("/form")
    public String afficherFormulaire(Model model) {
        model.addAttribute("besoin", new Besoin());
        model.addAttribute("postes", posteService.findAll());
        model.addAttribute("employes",employeRepository.findAll());

        return "/rh/form-besoin";
    }

    @PostMapping("/save")
    public String creerBesoin(
            @ModelAttribute("besoin") Besoin besoin,
            @RequestParam Long posteId,
            @RequestParam Long demandeurId) {

        besoinService.creerBesoin(
                besoin, posteId, demandeurId
        );

        return "redirect:/besoin/form";
    }
}
