package br.com.aterrissar.aterrissar.service;

import java.util.Optional;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.aterrissar.aterrissar.controller.dto.DadosPessoaisDTO;
import br.com.aterrissar.aterrissar.modelo.DadosPessoais;
import br.com.aterrissar.aterrissar.repository.DadosPessoaisRepository;
import br.com.aterrissar.aterrissar.service.exceptions.DatabaseException;
import br.com.aterrissar.aterrissar.service.exceptions.ResourceNotFoundException;

@Service
@SuppressWarnings("deprecation")
public class DadosPessoaisService {

	@Autowired
	private DadosPessoaisRepository repository;

	@Transactional
	public DadosPessoaisDTO insereNovosDadosPessoais(DadosPessoaisDTO dadosDTO) {
		DadosPessoais dados = new DadosPessoais();
		dados.setId(dadosDTO.getId());
		dados.setRg(dadosDTO.getRg());
		dados.setCpf(dadosDTO.getCpf());
		repository.save(dados);
		return new DadosPessoaisDTO(dados);
	}

	@Transactional
	public DadosPessoaisDTO findById(Long id) {
		Optional<DadosPessoais> obj = repository.findById(id);
		DadosPessoais dadosPessoais = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
		return new DadosPessoaisDTO(dadosPessoais);
	}

	public void deletarDadosPessoais(Long id) {
		try {
			repository.deleteById(id);
		} catch (EmptyResultDataAccessException e) {
			throw new ResourceNotFoundException("Id not found " + id);
		} catch (DataIntegrityViolationException e) {
			throw new DatabaseException("Integrity violation");
		}

	}

	@Transactional
	public DadosPessoaisDTO update(Long id, DadosPessoaisDTO dadosDTO) {
		try {
			DadosPessoais dados = repository.getOne(id);
			dados.setRg(dadosDTO.getRg());
			dados.setCpf(dadosDTO.getCpf());
			return new DadosPessoaisDTO(dados);
		} catch (EntityNotFoundException e) {
			throw new ResourceNotFoundException("Id not found " + id);
		}
	}

}
