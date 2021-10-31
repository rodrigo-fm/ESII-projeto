package br.com.aterrissar.aterrissar.modelo;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "tb_passagem")
public class Passagem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotBlank
	private Integer numeroAcento;
	@NotBlank
	private Float preco;
	@NotBlank
	private String classe;
	@NotBlank
	private String origem;
	@NotBlank
	private String destino;
	@NotBlank
	private LocalDateTime horarioPartida = LocalDateTime.now();
	@NotBlank
	private Integer duracaoVoo;

	public Passagem() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getNumeroAcento() {
		return numeroAcento;
	}

	public void setNumeroAcento(Integer numeroAcento) {
		this.numeroAcento = numeroAcento;
	}

	public Float getPreco() {
		return preco;
	}

	public void setPreco(Float preco) {
		this.preco = preco;
	}

	public String getClasse() {
		return classe;
	}

	public void setClasse(String classe) {
		this.classe = classe;
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

	public LocalDateTime getHorarioPartida() {
		return horarioPartida;
	}

	public void setHorarioPartida(LocalDateTime horarioPartida) {
		this.horarioPartida = horarioPartida;
	}

	public Integer getDuracaoVoo() {
		return duracaoVoo;
	}

	public void setDuracaoVoo(Integer duracaoVoo) {
		this.duracaoVoo = duracaoVoo;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((classe == null) ? 0 : classe.hashCode());
		result = prime * result + ((destino == null) ? 0 : destino.hashCode());
		result = prime * result + ((duracaoVoo == null) ? 0 : duracaoVoo.hashCode());
		result = prime * result + ((horarioPartida == null) ? 0 : horarioPartida.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((numeroAcento == null) ? 0 : numeroAcento.hashCode());
		result = prime * result + ((origem == null) ? 0 : origem.hashCode());
		result = prime * result + ((preco == null) ? 0 : preco.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Passagem other = (Passagem) obj;
		if (classe == null) {
			if (other.classe != null)
				return false;
		} else if (!classe.equals(other.classe))
			return false;
		if (destino == null) {
			if (other.destino != null)
				return false;
		} else if (!destino.equals(other.destino))
			return false;
		if (duracaoVoo == null) {
			if (other.duracaoVoo != null)
				return false;
		} else if (!duracaoVoo.equals(other.duracaoVoo))
			return false;
		if (horarioPartida == null) {
			if (other.horarioPartida != null)
				return false;
		} else if (!horarioPartida.equals(other.horarioPartida))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (numeroAcento == null) {
			if (other.numeroAcento != null)
				return false;
		} else if (!numeroAcento.equals(other.numeroAcento))
			return false;
		if (origem == null) {
			if (other.origem != null)
				return false;
		} else if (!origem.equals(other.origem))
			return false;
		if (preco == null) {
			if (other.preco != null)
				return false;
		} else if (!preco.equals(other.preco))
			return false;
		return true;
	}

}
