package com.gestion_rh.gestion_rh.controller.rh;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gestion_rh.gestion_rh.service.rh.PosteService;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/poste")
public class PosteController {
   private final PosteService posteService;

   @Autowired 
   public PosteController(PosteService posteService){
    this.posteService=posteService;
   }

   @GetMapping("/list")
   public String listePoste(Model model){
    model.addAttribute("listePostes",posteService.findAll());
    return "rn/formulaire_besoin";
   }




    
}
