package br.com.aterrissar.aterrissar.controller;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.fasterxml.jackson.databind.node.ObjectNode;

import br.com.aterrissar.aterrissar.controller.dto.CompraDTO;
import br.com.aterrissar.aterrissar.controller.dto.PassagemAereaDTO;
import br.com.aterrissar.aterrissar.service.CompraService;

@RestController
@RequestMapping("compra")
public class CompraController {

	@Autowired
	private CompraService service;

	@GetMapping(value = "/{id}")
	public ResponseEntity<CompraDTO> buscaCompraId(@PathVariable Long id) {
		CompraDTO compraDTO = service.findById(id);
		return ResponseEntity.ok().body(compraDTO);
	}

	@GetMapping(value = "/usuario/{id}")
	public ResponseEntity<List<PassagemAereaDTO>> listaTodasAsComprasDoUsuario(@PathVariable Long id) {
		List<PassagemAereaDTO> compraDTO = service.listaTodasAsComprasDoUsuario(id);
		return ResponseEntity.ok().body(compraDTO);
	}

	@PostMapping(value = "/usuario/{id_usuario}/passagem-aerea/{id_passagem}")
	public ResponseEntity<CompraDTO> inserirNovoCompra(@PathVariable Long id_usuario,@PathVariable Long id_passagem, @RequestBody CompraDTO compraDTO){
		compraDTO = service.insereNovaCompra(id_usuario,id_passagem , compraDTO);
		return ResponseEntity.ok().body(compraDTO);
	}

//	@PostMapping(value = "/usuario/{id_usuario}/passagem-aerea{id_passagem}")
//	public ResponseEntity<CompraDTO> inserirNovaPassagemAerea(@PathVariable Long id_usuario,
//			@PathVariable Long id_passagem, @RequestBody ObjectNode json) {
//		CompraDTO compraDTO = new CompraDTO();
//		compraDTO.setId(json.get("id").longValue());
//		compraDTO.setDataCompra(json.get("dataCompra").textValue());
//		compraDTO.setUsuario(json.get("usuario").get("id").longValue(),
//				json.get("usuario").get("nomeCompleto").textValue(), json.get("usuario").get("email").textValue(),
//				json.get("usuario").get("senha").textValue(), json.get("usuario").get("tipoUsuario").textValue());
//		compraDTO.setPassagemAerea(json.get("passageAerea").get("id").longValue(), json.get("passageAerea").get("classe").textValue(),
//				json.get("passageAerea").get("preco").doubleValue());
//		compraDTO = service.insereNovaCompra(id_usuario,id_passagem , compraDTO);
//		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(compraDTO.getId())
//				.toUri();
//		return ResponseEntity.created(uri).body(compraDTO);
//	}

}
