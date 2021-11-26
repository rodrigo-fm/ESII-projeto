package br.com.aterrissar.aterrissar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.aterrissar.aterrissar.modelo.Usuario;
import br.com.aterrissar.aterrissar.repository.UsuarioRepository;

@RestController
public class UsuarioController {

	@Autowired
	UsuarioRepository usuarioRepository;
	
	@RequestMapping("usuario")
	public List<Usuario> todosOsUsuarios(){
		List<Usuario> usuarioLista = usuarioRepository.findAll();
		return usuarioLista;
	}

}
