package com.gestion_rh.gestion_rh.model.rh;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name="besoin")
@Setter
@Getter
public class Besoin {
    /**
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "poste_id")
    private Poste poste;

    private String motif;

    private int budget;

    private LocalDate dateSouhaitee;

    @ManyToOne(optional = false)
    private Employe demandeur;

    private LocalDateTime dateCreation;

}
