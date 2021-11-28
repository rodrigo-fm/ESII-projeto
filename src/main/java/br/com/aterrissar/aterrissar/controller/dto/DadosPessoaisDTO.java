package br.com.aterrissar.aterrissar.controller.dto;

import java.util.Objects;

import br.com.aterrissar.aterrissar.modelo.DadosPessoais;

public class DadosPessoaisDTO {

	private Long id;
	private String cpf;
	private String rg;

	public DadosPessoaisDTO() {
	}

	public DadosPessoaisDTO(DadosPessoais dadosPessoais) {
		super();
		this.id = dadosPessoais.getId();
		this.cpf = dadosPessoais.getCpf();
		this.rg = dadosPessoais.getRg();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
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
		DadosPessoaisDTO other = (DadosPessoaisDTO) obj;
		return Objects.equals(id, other.id);
	}

}
