package br.com.aterrissar.aterrissar.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.aterrissar.aterrissar.modelo.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

}