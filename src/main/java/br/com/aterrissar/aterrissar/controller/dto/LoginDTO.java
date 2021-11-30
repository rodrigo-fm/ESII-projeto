package br.com.aterrissar.aterrissar.controller.dto;

import br.com.aterrissar.aterrissar.modelo.Usuario;

import java.io.Serializable;

public class LoginDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    private Long id;
    private String tipoUsuario;
    private String email;
    private String senha;

    public LoginDTO() {}

    public LoginDTO(Usuario usuario) {
        this.id = usuario.getId();
        this.tipoUsuario = usuario.getTipoUsuario();
        this.email = usuario.getEmail();
        this.senha = usuario.getSenha();
    }

    public Long getId() {
        return id;
    }
    public String getEmail() {
        return email;
    }
    public String getSenha() {
        return senha;
    }
    public String getTipoUsuario() { return tipoUsuario; }
    public void setSenha(String senha) {
        this.senha = senha;
    }

}
