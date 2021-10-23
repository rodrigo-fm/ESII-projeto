package br.com.aterrissar.aterrissar.controller.dto;

import java.util.List;
import java.util.stream.Collectors;

import br.com.aterrissar.aterrissar.modelo.Usuario;

public class UsuarioDTO {
	
	private Long id;
	private String nomeCompleto;
	private String cpf;
	private String email;
	
	public UsuarioDTO(Usuario usuario) {
		this.id = usuario.getId();
		this.nomeCompleto = usuario.getNomeCompleto();
		this.cpf = usuario.getCpf();
		this.email = usuario.getEmail();
	}
	
	public Long getId() {
		return id;
	}
	public String getNomeCompleto() {
		return nomeCompleto;
	}
	public String getCpf() {
		return cpf;
	}
	public String getEmail() {
		return email;
	}
	
	public static List<UsuarioDTO> convert(List<Usuario> usuario) {
		return usuario.stream().map(UsuarioDTO::new).collect(Collectors.toList()) ;
	}
}
