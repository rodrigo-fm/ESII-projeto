package br.com.aterrissar.aterrissar.controller.dto;

import java.io.Serializable;

import br.com.aterrissar.aterrissar.modelo.Usuario;

public class ContaDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String nomeCompleto;
	private String tipoUsuario;
	private String email;
	private String senha;
	
	public ContaDTO() {}
	
	public ContaDTO(Usuario usuario) {
		this.id = usuario.getId();
		this.nomeCompleto = usuario.getNomeCompleto();
		this.tipoUsuario = usuario.getTipoUsuario();
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
	public String getTipoUsuario() { return tipoUsuario; }
	
	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

}
