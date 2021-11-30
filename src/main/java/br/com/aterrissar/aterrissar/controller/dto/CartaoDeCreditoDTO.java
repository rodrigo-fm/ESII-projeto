package br.com.aterrissar.aterrissar.controller.dto;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import br.com.aterrissar.aterrissar.modelo.CartaoDeCredito;
import br.com.aterrissar.aterrissar.modelo.Usuario;

public class CartaoDeCreditoDTO implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long id;
	private String numeroCartao;
	private String nomeTitular;
	private String validade;
	private String bandeira;
	private Usuario usuario = new Usuario();
	
	public CartaoDeCreditoDTO() {}
	
	public CartaoDeCreditoDTO(CartaoDeCredito cartao) {
		super();
		this.id = cartao.getId();
		this.numeroCartao = cartao.getNumeroCartao();
		this.nomeTitular = cartao.getNomeTitular();
		this.validade = cartao.getValidade();
		this.bandeira = cartao.getBandeira();
		this.usuario = (cartao.getUsuario());
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNumeroCartao() {
		return numeroCartao;
	}

	public void setNumeroCartao(String numeroCartao) {
		this.numeroCartao = numeroCartao;
	}

	public String getNomeTitular() {
		return nomeTitular;
	}

	public void setNomeTitular(String nomeTitular) {
		this.nomeTitular = nomeTitular;
	}

	public String getValidade() {
		return validade;
	}

	public void setValidade(String validade) {
		this.validade = validade;
	}

	public String getBandeira() {
		return bandeira;
	}

	public void setBandeira(String bandeira) {
		this.bandeira = bandeira;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartaoDeCreditoDTO other = (CartaoDeCreditoDTO) obj;
		return Objects.equals(id, other.id);
	}
	
	public static List<CartaoDeCreditoDTO> converter(List<CartaoDeCredito> cartaoRetorno) {
		return cartaoRetorno.stream().map(CartaoDeCreditoDTO::new).collect(Collectors.toList());
	}

}
