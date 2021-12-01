package br.com.aterrissar.aterrissar.modelo;

import java.io.Serializable;
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
public class Compra implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotBlank
	private String dataCompra;

	@ManyToOne
	@JoinColumn(name = "id_usuario") 
	private Usuario usuario = new Usuario();
	
	@OneToOne
	@JoinColumn(name = "id_Passagem_aerea")
	private PassagemAerea passagemAerea = new PassagemAerea(); 			
	
	public Compra() {
	}

	public Compra(Compra compra) {
		super();
		this.id = compra.getId();
		this.dataCompra = compra.getDataCompra();
		this.usuario = compra.getUsuario();
		this.passagemAerea = compra.getPassagemAerea();
	}
	
//	public Compra(Long id, @NotBlank String dataCompra, Usuario usuario, PassagemAerea passagemAerea) {
//		super();
//		this.id = id;
//		this.dataCompra = dataCompra;
//		this.usuario = usuario;
//		this.passagemAerea = passagemAerea;
//	}


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDataCompra() {
		return dataCompra;
	}

	public void setDataCompra(String dataCompra) {
		this.dataCompra = dataCompra;
	}

	public PassagemAerea getPassagemAerea() {
		return passagemAerea;
	}

	public void setPassagemAerea(PassagemAerea passagemAerea) {
		this.passagemAerea = passagemAerea;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
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
