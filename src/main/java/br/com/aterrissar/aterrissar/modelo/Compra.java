package br.com.aterrissar.aterrissar.modelo;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "Compra")
public class Compra {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotBlank
	private LocalDateTime dataCompra = LocalDateTime.now();
	@NotBlank
	private Integer quantidadeComprada;

	@ManyToOne
	@JoinColumn(name = "id_usuario") 
	Usuario usuario = new Usuario();
	
	@OneToOne
	@JoinColumn(name = "id_Passagem_aerea")
	PassagemAerea passagemAerea = new PassagemAerea(); //possivel merda
			
	
	public Compra() {
	}

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

	public Integer getQuantidadeComprada() {
		return quantidadeComprada;
	}

	public void setQuantidadeComprada(Integer quantidadeComprada) {
		this.quantidadeComprada = quantidadeComprada;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		Compra other = (Compra) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

}
