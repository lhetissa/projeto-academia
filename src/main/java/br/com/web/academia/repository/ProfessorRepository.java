package br.com.web.academia.repository;

import br.com.web.academia.model.Professor;
import br.com.web.academia.model.Treino;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProfessorRepository extends JpaRepository<Professor, String> {
}
