package com.gestion_rh.gestion_rh.model.rh;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="statut_besoin")
@Getter
@Setter
public class StatutBesoin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;
}
