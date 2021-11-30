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

import br.com.aterrissar.aterrissar.controller.dto.CartaoDeCreditoDTO;
import br.com.aterrissar.aterrissar.controller.dto.VooDTO;
import br.com.aterrissar.aterrissar.service.VooService;

@RestController
@RequestMapping("voo")
public class VooController {

	@Autowired
	private VooService service;

	@GetMapping(value = "/{id}")
	public ResponseEntity<VooDTO> buscaVooPorId(@PathVariable Long id) {
		VooDTO vooDTO = service.findById(id);
		return ResponseEntity.ok().body(vooDTO);
	}

	@PostMapping
	public ResponseEntity<VooDTO> inserirNovoVoo(@RequestBody VooDTO voooDTO) {
		voooDTO = service.insereUmNovoVoo(voooDTO);
		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(voooDTO.getId())
				.toUri();
		return ResponseEntity.created(uri).body(voooDTO);
	}

	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deletarConta(@PathVariable Long id) {
		service.deletarVoo(id);
		return ResponseEntity.noContent().build();
	}

	@PutMapping(value = "/{id}")
	public ResponseEntity<VooDTO> update(@PathVariable Long id, @RequestBody VooDTO vooDTO) {
		vooDTO = service.update(id, vooDTO);
		return ResponseEntity.ok().body(vooDTO);
	}
}
