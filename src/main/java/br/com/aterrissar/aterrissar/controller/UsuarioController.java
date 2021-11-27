package br.com.aterrissar.aterrissar.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import br.com.aterrissar.aterrissar.modelo.Usuario;
import br.com.aterrissar.aterrissar.repository.UsuarioRepository;

@RestController
@RequestMapping("/usuario")
public class UsuarioController {

	@Autowired
	UsuarioRepository usuarioRepository;
	
	@GetMapping
	public ResponseEntity<List<Usuario>> todosOsUsuarios(){
		List<Usuario> usuarioLista = usuarioRepository.findAll();
		return ResponseEntity.ok().body(usuarioLista);
	}

	@GetMapping(value = "/{id}")
	public ResponseEntity<Optional<Usuario>> buscarUsuarioPorId(@PathVariable Long id){
		Optional<Usuario> usuarioLista = usuarioRepository.findById(id);
		return ResponseEntity.ok().body(usuarioLista);
	}
	
	@PostMapping
	public ResponseEntity<Usuario> inserirNovoUsuario(@RequestBody Usuario usuario){
		usuarioRepository.save(usuario);
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(usuario.getId()).toUri();
		return ResponseEntity.created(uri).body(usuario);
	}

}
