package br.com.aterrissar.aterrissar.controller.dto;

import java.util.List;
import java.util.stream.Collectors;

import br.com.aterrissar.aterrissar.modelo.Usuario;

public class ContaDTO {
	
	private Long id;
	private String nomeCompleto;
	private String email;
	
	public ContaDTO(Usuario usuario) {
		this.id = usuario.getId();
		this.nomeCompleto = usuario.getNomeCompleto();
		this.email = usuario.getEmail();
	}
	
	public Long getId() {
		return id;
	}
	public String getNomeCompleto() {
		return nomeCompleto;
	}
	public String getEmail() {
		return email;
	}
	
	public static List<ContaDTO> convert(List<Usuario> topicos) {
		return topicos.stream().map(ContaDTO::new).collect(Collectors.toList()) ;
	}
}
