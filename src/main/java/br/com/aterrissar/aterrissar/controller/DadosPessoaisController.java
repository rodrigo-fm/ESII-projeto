package br.com.aterrissar.aterrissar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.aterrissar.aterrissar.modelo.DadosPessoais;
import br.com.aterrissar.aterrissar.repository.DadosPessoaisRepository;

@RestController
public class DadosPessoaisController {

	@Autowired
	DadosPessoaisRepository dadosPessoaisRepository;
	
	@RequestMapping("dados-pessoais")
	public List<DadosPessoais> todosOsDadosPessoais(){
		List<DadosPessoais> dadosPessoaisLista = dadosPessoaisRepository.findAll();
		return dadosPessoaisLista;
	}
}
