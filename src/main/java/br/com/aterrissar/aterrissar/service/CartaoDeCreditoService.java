package br.com.aterrissar.aterrissar.service;

import java.util.Optional;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.aterrissar.aterrissar.controller.dto.CartaoDeCreditoDTO;
import br.com.aterrissar.aterrissar.controller.dto.DadosPessoaisDTO;
import br.com.aterrissar.aterrissar.modelo.CartaoDeCredito;
import br.com.aterrissar.aterrissar.modelo.DadosPessoais;
import br.com.aterrissar.aterrissar.repository.CartaoDeCreditoRepository;
import br.com.aterrissar.aterrissar.service.exceptions.DatabaseException;
import br.com.aterrissar.aterrissar.service.exceptions.ResourceNotFoundException;

@Service
@SuppressWarnings("deprecation")
public class CartaoDeCreditoService {

	@Autowired
	private CartaoDeCreditoRepository repository;

	@Transactional
	public CartaoDeCreditoDTO insereNovosCartaoDeCredito(CartaoDeCreditoDTO cartaoDTO) {
		CartaoDeCredito cartao = new CartaoDeCredito();
		cartao.setId(cartaoDTO.getId());
		cartao.setNomeTitular(cartaoDTO.getNomeTitular());
		cartao.setNumeroCartao(cartaoDTO.getNumeroCartao());
		cartao.setBandeira(cartaoDTO.getBandeira());
		cartao.setValidade(cartaoDTO.getValidade());
		cartao.setUsuario(null);
		repository.save(cartao);
		return new CartaoDeCreditoDTO(cartao);
	}

	@Transactional
	public CartaoDeCreditoDTO findById(Long id) {
		Optional<CartaoDeCredito> obj = repository.findById(id);
		CartaoDeCredito cartao = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
		return new CartaoDeCreditoDTO(cartao);
	}

	public void deletarCartaoDeCredito(Long id) {
		try {
			repository.deleteById(id);
		} catch (EmptyResultDataAccessException e) {
			throw new ResourceNotFoundException("Id not found " + id);
		} catch (DataIntegrityViolationException e) {
			throw new DatabaseException("Integrity violation");
		}

	}

	@Transactional
	public CartaoDeCreditoDTO update(Long id, CartaoDeCreditoDTO cartaoDTO) {
		try {
			CartaoDeCredito cartao = repository.getOne(id);
			cartao.setNomeTitular(cartaoDTO.getNomeTitular());
			cartao.setNumeroCartao(cartaoDTO.getNumeroCartao());
			cartao.setBandeira(cartaoDTO.getBandeira());
			cartao.setValidade(cartaoDTO.getValidade());
			return new CartaoDeCreditoDTO(cartao);
		} catch (EntityNotFoundException e) {
			throw new ResourceNotFoundException("Id not found " + id);
		}
	}

}
