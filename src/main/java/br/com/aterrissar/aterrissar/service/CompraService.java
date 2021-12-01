package br.com.aterrissar.aterrissar.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.aterrissar.aterrissar.controller.dto.CompraDTO;
import br.com.aterrissar.aterrissar.controller.dto.PassagemAereaDTO;
import br.com.aterrissar.aterrissar.modelo.Compra;
import br.com.aterrissar.aterrissar.modelo.PassagemAerea;
import br.com.aterrissar.aterrissar.modelo.Usuario;
import br.com.aterrissar.aterrissar.repository.CompraRepository;
import br.com.aterrissar.aterrissar.repository.PassagemAereaRepository;
import br.com.aterrissar.aterrissar.repository.UsuarioRepository;
import br.com.aterrissar.aterrissar.service.exceptions.ResourceNotFoundException;

@Service
@SuppressWarnings("deprecation")
public class CompraService implements Serializable {
	private static final long serialVersionUID = 1L;

	@Autowired
	private CompraRepository repository;
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Autowired
	private PassagemAereaRepository passagemRepository;

	@Transactional
	public CompraDTO insereNovaCompra(Long id_usuario, Long id_passagem, CompraDTO compraDTO) {
		Compra compra = new Compra();
		Optional<PassagemAerea> objPassagemAerea = passagemRepository.findById(id_passagem);
		PassagemAerea passagemAerea = objPassagemAerea.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
		Optional<Usuario> objUsuario = usuarioRepository.findById(id_usuario);
		Usuario usuario = objUsuario.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
		compra.setId(compraDTO.getId());
		compra.setDataCompra(compraDTO.getDataCompra());
		compra.setPassagemAerea(passagemAerea);
		compra.setUsuario(usuario);
		repository.save(compra);
		return new CompraDTO(compra);
	}

	@Transactional
	public CompraDTO findById(Long id) {
		Optional<Compra> obj = repository.findById(id);
		Compra compra = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
		return new CompraDTO(compra);
	}
	
	@Transactional
	public List<PassagemAereaDTO> listaTodasAsComprasDoUsuario(Long id) {
		List<Compra> compra = repository.findAll();
		List<Compra> compraRetorno = new ArrayList<Compra>();
		List<PassagemAerea> passagemAerea = new ArrayList<PassagemAerea>();
		for(Compra CompraExistente : compra) {
 			if(CompraExistente.getUsuario().getId() == id) {
				compraRetorno.add(CompraExistente);
				passagemAerea.add(CompraExistente.getPassagemAerea());
			}
		}
//		return CompraDTO.converter(compraRetorno);
		return PassagemAereaDTO.converter(passagemAerea);
	}

//	public void deletarCartaoDeCredito(Long id) {
//		try {
//			repository.deleteById(id);
//		} catch (EmptyResultDataAccessException e) {
//			throw new ResourceNotFoundException("Id not found " + id);
//		} catch (DataIntegrityViolationException e) {
//			throw new DatabaseException("Integrity violation");
//		}
//
//	}

	
}
