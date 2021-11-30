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

import br.com.aterrissar.aterrissar.controller.dto.CartaoDeCreditoDTO;
import br.com.aterrissar.aterrissar.service.CartaoDeCreditoService;

@RestController
@RequestMapping("cartao-de-credito")
public class CartaoDeCreditoController {
	
	@Autowired	
	CartaoDeCreditoService service;
	
	@GetMapping(value = "/{id}")
	public ResponseEntity<CartaoDeCreditoDTO> buscaCartaoPorId(@PathVariable Long id){
		CartaoDeCreditoDTO cartaoDTO = service.findById(id);
		return ResponseEntity.ok().body(cartaoDTO);
	}
	
	@GetMapping(value = "/usuario/{id}")
	public ResponseEntity<List<CartaoDeCreditoDTO>> buscaListaDeCartaoPorId(@PathVariable Long id){
		List<CartaoDeCreditoDTO> cartaoDTO = service.listaTodosOsCartoesDoUsuario(id);
		return ResponseEntity.ok().body(cartaoDTO);
	}
	
	@PostMapping
	public ResponseEntity<CartaoDeCreditoDTO> inserirNovoCartaoDeCredito(@RequestBody CartaoDeCreditoDTO cartaoDTO){
		cartaoDTO = service.insereNovosCartaoDeCredito(cartaoDTO);
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(cartaoDTO.getId()).toUri();
		return ResponseEntity.created(uri).body(cartaoDTO);
	}
	
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deletarConta(@PathVariable Long id){
		service.deletarCartaoDeCredito(id);
		return ResponseEntity.noContent().build();
	}
	//teste
	
	
	@PutMapping(value = "/{id}")
	public ResponseEntity<CartaoDeCreditoDTO> update(@PathVariable Long id, @RequestBody CartaoDeCreditoDTO cartaoDTO){
		cartaoDTO = service.update(id, cartaoDTO);
		return ResponseEntity.ok().body(cartaoDTO);
	}
}
