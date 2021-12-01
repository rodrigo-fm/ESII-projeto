package br.com.aterrissar.aterrissar.service;

import java.util.Optional;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import br.com.aterrissar.aterrissar.controller.dto.ContaDTO;
import br.com.aterrissar.aterrissar.controller.dto.LoginDTO;
import br.com.aterrissar.aterrissar.controller.dto.UsuarioDadosPessoaisDTO;
import br.com.aterrissar.aterrissar.modelo.Usuario;
import br.com.aterrissar.aterrissar.repository.UsuarioRepository;
import br.com.aterrissar.aterrissar.service.exceptions.DatabaseException;
import br.com.aterrissar.aterrissar.service.exceptions.ResourceNotFoundException;

@Service
public class UsuarioService {

	@Autowired
	private UsuarioRepository usuarioRepository;
//	
//	@Autowired
//	private PassagemRepository passagemRepository;
//	
//	@Autowired
//	private PassagemService passagemService;
//	
//	public void updatePassagem(Long id, Long passagemId) {
//		
//		Usuario usuario = new Usuario();
//		
//		try {
//			usuario = usuarioRepository.findById(id).get();
//		} catch (NoSuchElementException e) {
//			System.out.println("usuario not found");
//		}
//		
//		Passagem passagem = passagemRepository.findById(passagemId).get();
//		passagemRepository.save(passagem);
//		
//		usuario.setPassagens(passagem);
//		passagem.setUsuario(usuario);
//		
//		usuarioRepository.save(usuario);
//		passagemRepository.save(passagem);
//		
//	}

	@Transactional
	public ContaDTO insereNovoUsuario(ContaDTO contaDTO) {
		Usuario usuario = new Usuario();
		usuario.setEmail(contaDTO.getEmail());
		usuario.setTipoUsuario(contaDTO.getTipoUsuario());
		usuario.setNomeCompleto(contaDTO.getNomeCompleto());
		usuario.setSenha(contaDTO.getSenha());
		usuario.setDadosPessoais(null);
		usuarioRepository.save(usuario);
		return new ContaDTO(usuario);
	}

	@Transactional
	public ContaDTO findById(Long id) {
		Optional<Usuario> obj = usuarioRepository.findById(id);
		Usuario usuario = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
		return new ContaDTO(usuario);
	}
	
	@Transactional
	public UsuarioDadosPessoaisDTO findByIdUsuario(Long id) {
		Optional<Usuario> obj = usuarioRepository.findById(id);
		Usuario usuario = obj.orElseThrow(() -> new ResourceNotFoundException("Entity not found"));
		return new UsuarioDadosPessoaisDTO(usuario);
	}

	public void deletarUsuario(Long id) {
		try {
			usuarioRepository.deleteById(id);
		} catch (EmptyResultDataAccessException e) {
			throw new ResourceNotFoundException("Id not found " + id);
		}catch (DataIntegrityViolationException e) {
			throw new DatabaseException("Integrity violation");
		}

	}
	
	@Transactional
	public ContaDTO update(Long id, ContaDTO contaDTO) {
		try {
			Usuario usuario = usuarioRepository.getOne(id);
			usuario.setNomeCompleto(contaDTO.getNomeCompleto());
			usuario.setEmail(contaDTO.getEmail());
			usuario.setSenha(contaDTO.getSenha());
			usuario.setDadosPessoais(null);
			return new ContaDTO(usuario);
		} catch (EntityNotFoundException e) {
			throw new ResourceNotFoundException("Id not found " + id);
		}
	}

	@Transactional
	public LoginDTO realizarLogin(String email, String senha) {
		try {
			Usuario usuario = usuarioRepository.findByEmailAndSenha(email, senha);
			return new LoginDTO(usuario);
		} catch(EntityNotFoundException e) {
			throw new ResourceNotFoundException("Usuário não encontrado");
		}
	}

}
