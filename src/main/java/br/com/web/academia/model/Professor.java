package br.com.web.academia.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
public class Professor implements Serializable {

    @Transient
    private static final long serialVersionUID = 1526246363091440148L;
    @Id
    @Column(unique = true, nullable = false)
    private String cpf;
    private String name;
    @Column(unique = true, nullable = false)
    private String email;
    private String telefone;

    @ManyToMany
    private List<Treino> treinos = new ArrayList<>();
    @ManyToMany
    private List<Aluno> alunos = new ArrayList<>();

    public String getCpf() {
        return cpf;
    }
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getTelefone() {
        return telefone;
    }
    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public List<Treino> getTreinos() {
        return treinos;
    }

    public void setTreinos(List<Treino> treinos) {
        this.treinos = treinos;
    }

    public List<Aluno> getAlunos() {
        return alunos;
    }

    public void setAlunos(List<Aluno> alunos) {
        this.alunos = alunos;
    }
}