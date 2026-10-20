package com.gestion_rh.gestion_rh.model.rh;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Entity
@Table(name="validation_besoin")
@Getter
@Setter
public class ValidationBesoin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="besoin_id")
    private Besoin besoin;

    @ManyToOne
    @JoinColumn(name="statut_besoin_id")
    private StatutBesoin statut;

    @ManyToOne
    @JoinColumn(name="employe_id")
    private Employe acteur;

    private LocalDateTime dateDeValidation;



}
