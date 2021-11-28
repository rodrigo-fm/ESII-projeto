package br.com.aterrissar.aterrissar.service;

import java.util.Optional;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.aterrissar.aterrissar.controller.dto.VooDTO;
import br.com.aterrissar.aterrissar.modelo.Voo;
import br.com.aterrissar.aterrissar.repository.VooRepository;
import br.com.aterrissar.aterrissar.service.exceptions.DatabaseException;
import br.com.aterrissar.aterrissar.service.exceptions.ResourceNotFoundException;

@Service
@SuppressWarnings("deprecation")
public class VooService {

	@Autowired
	private VooRepository repository;

	@Transactional
	public VooDTO insereUmNovoVoo(VooDTO vooDTO) {
		Voo voo = new Voo();
		voo.setId(vooDTO.getId());
		voo.setOrigem(vooDTO.getDestino());
		voo.setCompanhiaAerea(vooDTO.getCompanhiaAerea());
		voo.setDuracao(vooDTO.getDuracao());
		voo.setDestino(vooDTO.getDestino());
		voo.setDataPartida(vooDTO.getDataPartida());
		repository.save(voo);
		return new VooDTO(voo);
	}

	@Transactional
	public VooDTO findById(Long id) {
		Optional<Voo> obj = repository.findById(id);
		Voo voo = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
		return new VooDTO(voo);
	}

	public void deletarVoo(Long id) {
		try {
			repository.deleteById(id);
		} catch (EmptyResultDataAccessException e) {
			throw new ResourceNotFoundException("Id not found " + id);
		} catch (DataIntegrityViolationException e) {
			throw new DatabaseException("Integrity violation");
		}

	}

	@Transactional
	public VooDTO update(Long id, VooDTO vooDTO) {
		try {
			Voo voo = repository.getOne(id);
			voo.setId(vooDTO.getId());
			voo.setOrigem(vooDTO.getDestino());
			voo.setCompanhiaAerea(vooDTO.getCompanhiaAerea());
			voo.setDuracao(vooDTO.getDuracao());
			voo.setDestino(vooDTO.getDestino());
			voo.setDataPartida(vooDTO.getDataPartida());
			return new VooDTO(voo);
		} catch (EntityNotFoundException e) {
			throw new ResourceNotFoundException("Id not found " + id);
		}
	}

}
