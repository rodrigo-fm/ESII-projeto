package br.com.aterrissar.aterrissar.controller.dto;

import java.io.Serializable;
import java.time.LocalDateTime;

import br.com.aterrissar.aterrissar.modelo.Voo;

public class VooDTO implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String origem;
	private String destino;
	private LocalDateTime dataPartida;
	private Integer duracao;
	private String companhiaAerea;
	
	public VooDTO(Voo voo) {
		super();
		this.id = voo.getId();
		this.origem = voo.getOrigem();
		this.destino = voo.getDestino();
		this.dataPartida = voo.getDataPartida();
		this.duracao = voo.getDuracao();
		this.companhiaAerea = voo.getCompanhiaAerea();
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getOrigem() {
		return origem;
	}
	public void setOrigem(String origem) {
		this.origem = origem;
	}
	public String getDestino() {
		return destino;
	}
	public void setDestino(String destino) {
		this.destino = destino;
	}
	public LocalDateTime getDataPartida() {
		return dataPartida;
	}
	public void setDataPartida(LocalDateTime dataPartida) {
		this.dataPartida = dataPartida;
	}
	public Integer getDuracao() {
		return duracao;
	}
	public void setDuracao(Integer duracao) {
		this.duracao = duracao;
	}
	public String getCompanhiaAerea() {
		return companhiaAerea;
	}
	public void setCompanhiaAerea(String companhiaAerea) {
		this.companhiaAerea = companhiaAerea;
	}

	
}
