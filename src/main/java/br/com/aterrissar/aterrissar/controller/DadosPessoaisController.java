package br.com.aterrissar.aterrissar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.aterrissar.aterrissar.modelo.DadosPessoais;
import br.com.aterrissar.aterrissar.repository.DadosPessoaisRepository;

@RestController
@RequestMapping("dados-pessoais")
public class DadosPessoaisController {

	@Autowired
	DadosPessoaisRepository dadosPessoaisRepository;
	
	@GetMapping
	public List<DadosPessoais> todosOsDadosPessoais(){
		List<DadosPessoais> dadosPessoaisLista = dadosPessoaisRepository.findAll();
		return dadosPessoaisLista;
	}
	
//	@PostMapping
//	public ResponseEntity<DadosPessoais> inserirNovoUsuario(@RequestBody DadosPessoais dadosPessoais){
//		
//		if(dadosPessoais.get)
//		dadosPessoaisRepository.save(dadosPessoais);
//		URI uri = ServletUriComponentsBuilder.fromCurrentRequest().path("/{id}").buildAndExpand(dadosPessoais.getId()).toUri();
//		return ResponseEntity.created(uri).body(dadosPessoais);
//	}
}
