package br.com.aterrissar.aterrissar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.aterrissar.aterrissar.controller.dto.UsuarioDTO;
import br.com.aterrissar.aterrissar.modelo.Usuario;
import br.com.aterrissar.aterrissar.repository.UsuarioRepository;

@Controller
@RestController
//@RequestMapping("usuario")
public class UsuarioController {
	
	@Autowired
	UsuarioRepository usuarioRepository;
	
	@RequestMapping("usuario")
	public List<UsuarioDTO> todosOsUsuarios(){
		List<Usuario> usuarios = usuarioRepository.findAll();
		return UsuarioDTO.convert(usuarios);
	}

}
