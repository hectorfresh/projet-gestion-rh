package com.gestion_rh.gestion_rh.model.rh;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="contrat")
@Setter
@Getter
public class Contrat {
    /**
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int salaire;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="poste_id")
    private Poste poste;

}
