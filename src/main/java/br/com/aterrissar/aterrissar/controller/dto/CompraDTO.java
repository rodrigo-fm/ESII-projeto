package br.com.aterrissar.aterrissar.controller.dto;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import br.com.aterrissar.aterrissar.modelo.Compra;
import br.com.aterrissar.aterrissar.modelo.PassagemAerea;
import br.com.aterrissar.aterrissar.modelo.Usuario;

public class CompraDTO implements Serializable {
	private static final long serialVersionUID = 1L;


	private Long id;
	private LocalDateTime dataCompra = LocalDateTime.now();
	
	private Usuario usuario = new Usuario();
	
	private PassagemAerea passagemAerea = new PassagemAerea(); 			
	
	public CompraDTO(Compra compra) {
		super();
		this.id = compra.getId();
		this.dataCompra = compra.getDataCompra();
		this.usuario = compra.getUsuario();
		this.passagemAerea = compra.getPassagemAerea();
	}

	public CompraDTO() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDateTime getDataCompra() {
		return dataCompra;
	}

	public void setDataCompra(LocalDateTime dataCompra) {
		this.dataCompra = dataCompra;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public PassagemAerea getPassagemAerea() {
		return passagemAerea;
	}

	public void setPassagemAerea(PassagemAerea passagemAerea) {
		this.passagemAerea = passagemAerea;
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
		CompraDTO other = (CompraDTO) obj;
		return Objects.equals(id, other.id);
	}
	
	public static List<CompraDTO> converter(List<Compra> compraRetorno) {
		return compraRetorno.stream().map(CompraDTO::new).collect(Collectors.toList());
	}
}
