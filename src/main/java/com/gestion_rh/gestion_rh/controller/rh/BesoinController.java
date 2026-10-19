package com.gestion_rh.gestion_rh.controller.rh;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BesoinController {

    @GetMapping("/formulaire")
    public String afficherFormulaire() {
        return "rh/formulaire_besoin";
    }
}