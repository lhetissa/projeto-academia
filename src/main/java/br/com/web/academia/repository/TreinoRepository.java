package br.com.web.academia.repository;

import br.com.web.academia.model.Aluno;
import br.com.web.academia.model.Treino;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TreinoRepository extends JpaRepository<Treino, Long> {



}
