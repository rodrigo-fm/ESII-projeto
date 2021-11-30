package br.com.aterrissar.aterrissar.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.aterrissar.aterrissar.controller.dto.CartaoDeCreditoDTO;
import br.com.aterrissar.aterrissar.controller.dto.PassagemAereaDTO;
import br.com.aterrissar.aterrissar.controller.dto.VooDTO;
import br.com.aterrissar.aterrissar.modelo.CartaoDeCredito;
import br.com.aterrissar.aterrissar.modelo.PassagemAerea;
import br.com.aterrissar.aterrissar.repository.PassagemAereaRepository;
import br.com.aterrissar.aterrissar.service.exceptions.DatabaseException;
import br.com.aterrissar.aterrissar.service.exceptions.ResourceNotFoundException;

@Service
@SuppressWarnings("deprecation")
public class PassagemAereaService {

	@Autowired
	private PassagemAereaRepository repository;
	
	@Autowired
	private VooService vooService;

	@Transactional
	public PassagemAereaDTO insereNovaPassagem(PassagemAereaDTO passagemAereaDTO) {
		PassagemAerea passagem = new PassagemAerea();
		passagem.setId(passagemAereaDTO.getId());
		passagem.setVoo(passagemAereaDTO.getVoo());
		passagem.setPreco(passagemAereaDTO.getPreco());
		passagem.setClasse(passagemAereaDTO.getClasse());
		VooDTO vooDTO = new VooDTO(passagem.getVoo());
		vooService.insereUmNovoVoo(vooDTO);
		repository.save(passagem);
		return new PassagemAereaDTO(passagem);
	}
	
	@Transactional
	public PassagemAereaDTO findById(Long id) {
		Optional<PassagemAerea> obj = repository.findById(id);
		PassagemAerea passagem = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
		return new PassagemAereaDTO(passagem);
	}
	
	@Transactional
	public List<PassagemAereaDTO> listaTodasAsPassagens(Long id) {
		List<PassagemAerea> passagem = repository.findAll();
		List<PassagemAerea> passagemRetorno = new ArrayList<PassagemAerea>();
		for(PassagemAerea passagemAerea : passagem) {
 			if(passagemAerea.getVoo().getId() == id) {
				passagemRetorno.add(passagemAerea);
			}
		}
		return PassagemAereaDTO.converter(passagemRetorno);
	}

	public void deletarPassagemAerea(Long id) {
		try {
			repository.deleteById(id);
		} catch (EmptyResultDataAccessException e) {
			throw new ResourceNotFoundException("Id not found " + id);
		} catch (DataIntegrityViolationException e) {
			throw new DatabaseException("Integrity violation");
		}

	}

	@Transactional
	public PassagemAereaDTO update(Long id, PassagemAereaDTO passagemDTO) {
		try {
			PassagemAerea passagem = repository.getOne(id);
			passagem.setPreco(passagemDTO.getPreco());
			passagem.setClasse(passagemDTO.getClasse());
			passagem.setVoo(passagemDTO.getVoo());
			return new PassagemAereaDTO(passagem);
		} catch (EntityNotFoundException e) {
			throw new ResourceNotFoundException("Id not found " + id);
		}
	}
	
}
