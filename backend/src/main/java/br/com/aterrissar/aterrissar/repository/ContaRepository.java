package br.com.aterrissar.aterrissar.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.aterrissar.aterrissar.modelo.Conta;

public interface ContaRepository extends JpaRepository<Conta, Long>{

}
