package br.com.aterrissar.aterrissar.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.aterrissar.aterrissar.modelo.Usuario;

public interface ContaRepository extends JpaRepository<Usuario, Long>{

}
