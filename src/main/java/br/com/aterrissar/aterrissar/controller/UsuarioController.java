package br.com.aterrissar.aterrissar.controller;

import java.net.URI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import br.com.aterrissar.aterrissar.controller.dto.ContaDTO;
import br.com.aterrissar.aterrissar.service.UsuarioService;

@RestController
@RequestMapping("/usuario")
public class UsuarioController {

	@Autowired	
	UsuarioService service;
	
//	@GetMapping
//	public ResponseEntity<List<Usuario>> todosOsUsuarios(){
//		List<Usuario> usuarioLista = usuarioRepository.findAll();
//		return ResponseEntity.ok().body(usuarioLista);
//	}
//
//	@GetMapping(value = "/{id}")
//	public ResponseEntity<CategoryDTO> findById(@PathVariable Long id) {
//		CategoryDTO dto = service.findById(id);
//		return ResponseEntity.ok().body(dto);
//	}
	@GetMapping(value = "/{id}")
	public ResponseEntity<ContaDTO> buscaContaDeUsuarioPorId(@PathVariable Long id){
		ContaDTO contaDTO = service.findById(id);
		return ResponseEntity.ok().body(contaDTO);
	}
	
	@PostMapping
	public ResponseEntity<ContaDTO> inserirNovaContaDeUsuario(@RequestBody ContaDTO contaDTO){
		contaDTO = service.insereNovoUsuario(contaDTO);
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(contaDTO.getId()).toUri();
		return ResponseEntity.created(uri).body(contaDTO);
	}
	
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deletarConta(@PathVariable Long id){
		service.deletarUsuario(id);
		return ResponseEntity.noContent().build();
	}
	
//	@PutMapping(value = "/{id}")
//	public ResponseEntity<CategoryDTO> update(@PathVariable Long id, @RequestBody CategoryDTO dto) {
//		dto = service.update(id, dto);
//		return ResponseEntity.ok().body(dto);
//	}
	
	@PutMapping(value = "/{id}")
	public ResponseEntity<ContaDTO> update(@PathVariable Long id, @RequestBody ContaDTO contaDTO){
		contaDTO = service.update(id, contaDTO);
		return ResponseEntity.ok().body(contaDTO);
	}
}
