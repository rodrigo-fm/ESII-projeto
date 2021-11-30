package br.com.aterrissar.aterrissar.controller.dto;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

import br.com.aterrissar.aterrissar.modelo.PassagemAerea;
import br.com.aterrissar.aterrissar.modelo.Voo;
import br.com.aterrissar.aterrissar.service.VooService;

public class PassagemAereaDTO implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long id;
	private String classe;
	private Double preco;

	private Voo voo = new Voo();

	public PassagemAereaDTO() {
	}

	public PassagemAereaDTO(PassagemAerea passagemAerea) {
		super();
		this.id = passagemAerea.getId();
		this.classe = passagemAerea.getClasse();
		this.preco = passagemAerea.getPreco();
		this.voo = passagemAerea.getVoo();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getClasse() {
		return classe;
	}

	public void setClasse(String classe) {
		this.classe = classe;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public Voo getVoo() {
		return voo;
	}

	public void setVoo(Voo voo) {
		this.voo = voo;
	}

	public static List<PassagemAereaDTO> converter(List<PassagemAerea> passagemAerea) {
		return passagemAerea.stream().map(PassagemAereaDTO::new).collect(Collectors.toList());
	}

	public void setVoo(long id, String origem, String destino, String dataPartida, Integer duracao,
			String companhiaAerea) {
		Voo voo = new Voo();
		voo.setId(id);
		voo.setOrigem(origem);
		voo.setDestino(destino);
		voo.setDataPartida(dataPartida);
		voo.setCompanhiaAerea(companhiaAerea);
		voo.setDuracao(duracao);
		this.setVoo(voo);
	}

}
