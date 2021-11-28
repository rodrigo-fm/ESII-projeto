package br.com.aterrissar.aterrissar.controller.dto;

import br.com.aterrissar.aterrissar.modelo.Usuario;

public class UsuarioDTO {
	
	private Long id;
	private String nomeCompleto;
	private String email;
	private String senha;
	
	public UsuarioDTO(Usuario usuario) {
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
	
	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

//	public static List<UsuarioDTO> convert(List<Usuario> topicos) {
//		return topicos.stream().map(UsuarioDTO::new).collect(Collectors.toList()) ;
//	}
}
