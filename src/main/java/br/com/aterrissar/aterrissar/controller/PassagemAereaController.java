package br.com.aterrissar.aterrissar.controller;

import java.net.URI;
import java.util.List;

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

import com.fasterxml.jackson.databind.node.ObjectNode;

import br.com.aterrissar.aterrissar.controller.dto.CartaoDeCreditoDTO;
import br.com.aterrissar.aterrissar.controller.dto.PassagemAereaDTO;
import br.com.aterrissar.aterrissar.service.PassagemAereaService;

@RestController
@RequestMapping("passagem-aerea")
public class PassagemAereaController {

	@Autowired
	PassagemAereaService service;

	@GetMapping(value = "/{id}")
	public ResponseEntity<PassagemAereaDTO> buscaCartaoPorId(@PathVariable Long id) {
		PassagemAereaDTO passagemDTO = service.findById(id);
		return ResponseEntity.ok().body(passagemDTO);
	}

	@GetMapping(value = "/voo/{id}")
	public ResponseEntity<List<PassagemAereaDTO>> buscaListaDeCartaoPorId(@PathVariable Long id) {
		List<PassagemAereaDTO> passagemDTO = service.listaTodasAsPassagens(id);
		return ResponseEntity.ok().body(passagemDTO);
	}

//	@PostMapping
//	public ResponseEntity<PassagemAereaDTO> inserirNovoCartaoDeCredito(@RequestBody PassagemAereaDTO passagemDTO){
//		passagemDTO = service.insereNovaPassagem(passagemDTO);
//		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(passagemDTO.getId()).toUri();
//		return ResponseEntity.created(uri).body(passagemDTO);
//	}
//	

	@PostMapping
	public ResponseEntity<PassagemAereaDTO> inserirNovaPassagemAerea(@RequestBody ObjectNode json) {
		PassagemAereaDTO passagemDTO = new PassagemAereaDTO();
		passagemDTO.setClasse(json.get("classe").textValue());
		passagemDTO.setPreco(json.get("preco").doubleValue());
		passagemDTO.setVoo(json.get("voo").get("id").longValue(), json.get("voo").get("origem").textValue(),
				json.get("voo").get("destino").textValue(), json.get("voo").get("dataPartida").textValue(),
				json.get("voo").get("duracao").intValue(), json.get("voo").get("companhiaAerea").textValue());
		passagemDTO = service.insereNovaPassagem(passagemDTO);
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(passagemDTO.getId()).toUri();
		return ResponseEntity.created(uri).body(passagemDTO);
	}

	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deletarConta(@PathVariable Long id) {
		service.deletarPassagemAerea(id);
		return ResponseEntity.noContent().build();
	}

	@PutMapping(value = "/{id}")
	public ResponseEntity<PassagemAereaDTO> update(@PathVariable Long id, @RequestBody PassagemAereaDTO passagemDTO) {
		passagemDTO = service.update(id, passagemDTO);
		return ResponseEntity.ok().body(passagemDTO);
	}
}
