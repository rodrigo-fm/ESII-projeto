package br.com.aterrissar.aterrissar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.aterrissar.aterrissar.controller.dto.PassagemDTO;
import br.com.aterrissar.aterrissar.modelo.Passagem;
import br.com.aterrissar.aterrissar.repository.PassagemRepository;

@Controller
@RestController
public class PassagemController {
	
	@Autowired
	PassagemRepository passagemRepository;
	
	@RequestMapping("passagem")
	public List<PassagemDTO> todasAsPassagem(){
		List<Passagem> passagem = passagemRepository.findAll();
		return PassagemDTO.convert(passagem);
	}

}
