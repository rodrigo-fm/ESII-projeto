package br.com.aterrissar.aterrissar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.aterrissar.aterrissar.controller.dto.ContaDTO;
import br.com.aterrissar.aterrissar.modelo.Usuario;
import br.com.aterrissar.aterrissar.repository.ContaRepository;

@Controller
@RestController
//@RequestMapping("usuario")
public class ContaController {
	
	@Autowired
	ContaRepository contaRepository;
	
	@RequestMapping("Contas")
	public List<ContaDTO> todosOsUsuarios(){
		List<Usuario> contas = contaRepository.findAll();
		return ContaDTO.convert(contas);
	}

}
