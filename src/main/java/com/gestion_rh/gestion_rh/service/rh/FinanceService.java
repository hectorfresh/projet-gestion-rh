package com.gestion_rh.gestion_rh.service.rh;

import com.gestion_rh.gestion_rh.model.rh.Finance;
import com.gestion_rh.gestion_rh.model.rh.ValidationBesoin;
import com.gestion_rh.gestion_rh.repository.rh.EmployeRepository;
import com.gestion_rh.gestion_rh.repository.rh.FinanceRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FinanceService {

    private final FinanceRepository financeRepository;
    private final EmployeRepository employeRepository;


    public FinanceService(FinanceRepository financeRepository, FinanceRepository financeRepository1, EmployeRepository employeRepository) {
        this.financeRepository = financeRepository;
        this.employeRepository = employeRepository;

    }

    public ValidationBesoin enregister(ValidationBesoin besoin) {
        int sumFinance = financeRepository.getTotalAnnee(java.time.Year.now().getValue());
        int sumEmploye;

        return besoin;
    }

    public List<Finance> findByAnnee(int annee) {
        return financeRepository.findByAnnee(annee);
    }

    @Transactional
    public List<Finance> findAll() {
        return financeRepository.findAll();
    }

    public Finance findById(Long id) {
        return financeRepository.findById(id).orElse(null);
    }


}
