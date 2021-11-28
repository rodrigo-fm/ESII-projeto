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

import br.com.aterrissar.aterrissar.controller.dto.DadosPessoaisDTO;
import br.com.aterrissar.aterrissar.service.DadosPessoaisService;

@RestController
@RequestMapping("dados-pessoais")
public class DadosPessoaisController {

	@Autowired	
	DadosPessoaisService service;
	
	@GetMapping(value = "/{id}")
	public ResponseEntity<DadosPessoaisDTO> buscaContaDeUsuarioPorId(@PathVariable Long id){
		DadosPessoaisDTO dadosDTO = service.findById(id);
		return ResponseEntity.ok().body(dadosDTO);
	}
	
	@PostMapping
	public ResponseEntity<DadosPessoaisDTO> inserirNovaContaDeUsuario(@RequestBody DadosPessoaisDTO dadosDTO){
		dadosDTO = service.insereNovosDadosPessoais(dadosDTO);
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(dadosDTO.getId()).toUri();
		return ResponseEntity.created(uri).body(dadosDTO);
	}
	
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deletarConta(@PathVariable Long id){
		service.deletarDadosPessoais(id);
		return ResponseEntity.noContent().build();
	}
	
	@PutMapping(value = "/{id}")
	public ResponseEntity<DadosPessoaisDTO> update(@PathVariable Long id, @RequestBody DadosPessoaisDTO dadosDTO){
		dadosDTO = service.update(id, dadosDTO);
		return ResponseEntity.ok().body(dadosDTO);
	}
}
