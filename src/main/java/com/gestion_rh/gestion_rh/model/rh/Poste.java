package com.gestion_rh.gestion_rh.model.rh;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity 
@Table(name = "poste")
@Getter
@Setter
public class Poste {
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;

    @ManyToOne
    @JoinColumn(name="role_id")
    private Role role;

    @ManyToOne
    @JoinColumn(name="departement_id")
    private Departement departement;
}
