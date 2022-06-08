package br.com.web.academia.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
public class Treino {

    @Id
    @GeneratedValue
    private Long id;
    private String tipoTreino;
    private String grupoMuscular;
    private String descricao;
    private String exercicios;

    @ManyToMany(mappedBy = "treinos", cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
    private List<Professor> professores = new ArrayList<>();
    @ManyToMany(mappedBy = "treinos", cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE})
    private List<Aluno> alunos = new ArrayList<>();

    public List<Professor> getProfessores() {
        return professores;
    }
    public void setProfessores(List<Professor> professores) {
        this.professores = professores;
    }
    public List<Aluno> getAlunos() {
        return alunos;
    }
    public void setAlunos(List<Aluno> alunos) {
        this.alunos = alunos;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getTipoTreino() {
        return tipoTreino;
    }
    public void setTipoTreino(String tipoTreino) {
        this.tipoTreino = tipoTreino;
    }
    public String getGrupoMuscular() {
        return grupoMuscular;
    }
    public void setGrupoMuscular(String grupoMuscular) {
        this.grupoMuscular = grupoMuscular;
    }
    public String getDescricao() {
        return descricao;
    }
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    public String getExercicios() {
        return exercicios;
    }
    public void setExercicios(String exercicios) {
        this.exercicios = exercicios;
    }


}