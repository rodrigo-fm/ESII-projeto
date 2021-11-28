package br.com.aterrissar.aterrissar.controller.dto;

import br.com.aterrissar.aterrissar.modelo.Usuario;

public class ContaDTO {
	
	private Long id;
	private String nomeCompleto;
	private String email;
	private String senha;
	
	public ContaDTO() {}
	
	public ContaDTO(Usuario usuario) {
		this.id = usuario.getId();
		this.nomeCompleto = usuario.getNomeCompleto();
		this.email = usuario.getEmail();
		this.senha = usuario.getSenha();
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
	
	
	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

//	public static ContaDTO convert(Usuario topicos) {
//		return topicos.map(ContaDTO::new).collect(Collectors.toList()) ;
//	}
}
