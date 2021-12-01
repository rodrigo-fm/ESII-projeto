package br.com.aterrissar.aterrissar.controller.dto;

import java.io.Serializable;

import br.com.aterrissar.aterrissar.modelo.DadosPessoais;
import br.com.aterrissar.aterrissar.modelo.Usuario;

public class UsuarioDadosPessoaisDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String nomeCompleto;
	private String email;
	private DadosPessoais dadosPessoais = new DadosPessoais();
	
	public UsuarioDadosPessoaisDTO(Usuario usuario) {
		this.id = usuario.getId();
		this.nomeCompleto = usuario.getNomeCompleto();
		this.setEmail(usuario.getEmail());
		this.dadosPessoais = usuario.getDadosPessoais();
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
	

	public void setEmail(String email) {
		this.email = email;
	}

	public DadosPessoais getDadosPessoais() {
		return dadosPessoais;
	}

	public void setDadosPessoais(DadosPessoais dadosPessoais) {
		this.dadosPessoais = dadosPessoais;
	}
	
}
