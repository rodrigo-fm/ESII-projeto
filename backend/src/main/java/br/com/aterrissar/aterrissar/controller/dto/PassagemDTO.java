package br.com.aterrissar.aterrissar.controller.dto;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

import br.com.aterrissar.aterrissar.modelo.Passagem;
import br.com.aterrissar.aterrissar.modelo.Conta;

public class PassagemDTO {
	
	private Long id;
	private Integer numeroAcento; 
	private Float preco;
	private String classe;
	private String origem;
	private String destino;
	private LocalDateTime horarioPartida;
	private Integer duracaoVoo;
	
	public PassagemDTO(Passagem passagem) {
		this.id = passagem.getId();
		this.numeroAcento = passagem.getNumeroAcento();
		this.preco = passagem.getPreco();
		this.classe = passagem.getClasse();
		this.origem = passagem.getOrigem();
		this.destino = passagem.getDestino();
		this.horarioPartida = passagem.getHorarioPartida();
		this.duracaoVoo = passagem.getDuracaoVoo();
		
	}
	
	public Long getId() {
		return id;
	}
	public Integer getNumeroAcento() {
		return numeroAcento;
	}
	public Float getPreco() {
		return preco;
	}
	public String getClasse() {
		return classe;
	}
	public String getOrigen() {
		return origem;
	}
	public String getDestino() {
		return destino;
	}
	public LocalDateTime getHorarioPartida() {
		return horarioPartida;
	}
	public Integer getDuracaoVoo() {
		return duracaoVoo;
	}

	public static List<PassagemDTO> convert(List<Passagem> passagem) {
		return passagem.stream().map(PassagemDTO::new).collect(Collectors.toList()) ;
	}
	
}