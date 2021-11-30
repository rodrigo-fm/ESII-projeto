package br.com.aterrissar.aterrissar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.aterrissar.aterrissar.controller.dto.CompraDTO;
import br.com.aterrissar.aterrissar.controller.dto.PassagemAereaDTO;
import br.com.aterrissar.aterrissar.service.CompraService;

@RestController
@RequestMapping("compra")
public class CompraController {
	
	@Autowired	
	private CompraService service;
	
	@GetMapping(value = "/{id}")
	public ResponseEntity<CompraDTO> buscaCompraId(@PathVariable Long id){
		CompraDTO compraDTO = service.findById(id);
		return ResponseEntity.ok().body(compraDTO);
	}
	
	@GetMapping(value = "/usuario/{id}")
	public ResponseEntity<List<PassagemAereaDTO>> listaTodasAsComprasDoUsuario(@PathVariable Long id){
		List<PassagemAereaDTO> compraDTO = service.listaTodasAsComprasDoUsuario(id);
		return ResponseEntity.ok().body(compraDTO);
	}
	
	@PostMapping(value = "/usuario/{id}")
	public ResponseEntity<CompraDTO> inserirNovoCompra(@PathVariable Long id, @RequestBody CompraDTO compraDTO){
		compraDTO = service.insereNovaCompra(id, compraDTO);
		return ResponseEntity.ok().body(compraDTO);
	}
	
//	@DeleteMapping(value = "/{id}")
//	public ResponseEntity<Void> deletarConta(@PathVariable Long id){
//		service.deletarCartaoDeCredito(id);
//		return ResponseEntity.noContent().build();
//	}
	
}
