package br.com.web.academia.controller;

import br.com.web.academia.model.Aluno;
import br.com.web.academia.model.Professor;
import br.com.web.academia.model.Treino;
import br.com.web.academia.repository.AlunoRepository;
import br.com.web.academia.repository.ProfessorRepository;
import br.com.web.academia.repository.TreinoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

@Controller
public class AcademiaController {
    @Autowired
    AlunoRepository alunoRepository;
    @Autowired
    ProfessorRepository professorRepository;
    @Autowired
    TreinoRepository treinoRepository;

    @RequestMapping("/")
    public String home(Model model) {
        return "homePage";
    }

    //    Seção dos alunos
    @RequestMapping("/listarAlunos")
    public String listarAlunos(Model model) {
        model.addAttribute("alunos", alunoRepository.findAll());
        return "listarAlunos";
    }

    @GetMapping("/cadastrarAluno")
    public String cadastrarAluno(Model model) {
        return "cadastrarAluno";
    }

    @PostMapping("/cadastrarAluno")
    public String cadastrarAlunoPost(Aluno aluno) {
        aluno.setCpf(aluno.getCpf().replaceAll("\\D+",""));
        alunoRepository.save(aluno);
        return "redirect:/listarAlunos";
    }

    @GetMapping("/alterarAluno")
    public String alterarAluno(Model model, String id) {
        Aluno aluno = alunoRepository.findById(id).get();
        List<Professor> professores = professorRepository.findAll();
        professores.removeAll(aluno.getProfessores());

        model.addAttribute("aluno", aluno);
        model.addAttribute("professorRem", professores);
        model.addAttribute("professorAdd", aluno.getProfessores());
        model.addAttribute("professores", professorRepository.findAll());
        return "alterarAluno";
    }

    @PostMapping("/alterarAluno")
    public String alterarAlunoPost(Aluno aluno) {
        Aluno alunoAtual = alunoRepository.findById(aluno.getCpf()).get();
        alunoAtual.setEmail(aluno.getEmail());
        alunoAtual.setName(aluno.getName());
        alunoAtual.setTelefone(aluno.getTelefone());
        alunoAtual.setEmail(aluno.getEmail());

        alunoRepository.save(alunoAtual);
        return "redirect:/listarAlunos";
    }

    @RequestMapping("/excluirAluno")
    public String alterarAlunoPost(String id) {
        alunoRepository.deleteById(id);
        return "redirect:/listarAlunos";
    }

    @Transactional
    @PostMapping("/salvarProfessorAluno")
    @ResponseBody
    public void salvarProfessorAluno(String alunoCpf, String[] addProfessor, String[] removeProfessor) {
        Aluno aluno = alunoRepository.findById(alunoCpf).get();
        List<String> listAddProfessores = Arrays.asList(addProfessor);
        List<String> listRemoveProfessor = Arrays.asList(removeProfessor);
        for(Professor p : professorRepository.findAll()) {
            for(String x : listAddProfessores) {
                if(p.getCpf().equals(x.replaceAll("\\D+",""))) {
                    if(!p.getAlunos().contains(aluno)) {
                        p.getAlunos().add(aluno);
                    }
                }
            }
            for(String x : listRemoveProfessor) {
                if(p.getCpf().equals(x.replaceAll("\\D+",""))) {
                    if(p.getAlunos().contains(aluno)) {
                        p.getAlunos().remove(aluno);
                    }
                }
            }
        }
        alunoRepository.save(aluno);
    }

    //    Seção dos professores
    @RequestMapping("/listarProfessores")
    public String listarProfessores(Model model) {
        model.addAttribute("professores", professorRepository.findAll());
        return "listarProfessores";
    }

    @GetMapping("/cadastrarProfessor")
    public String cadastrarProfessor(Model model) {
        return "cadastrarProfessor";
    }

    @PostMapping("/cadastrarProfessor")
    public String cadastrarProfessorPost(Professor professor) {
        professor.setCpf(professor.getCpf().replaceAll("\\D+",""));
        professorRepository.save(professor);
        return "redirect:/listarProfessores";
    }

    @GetMapping("/alterarProfessor")
    public String alterarProfessor(Model model, String id) {
        model.addAttribute("professor", professorRepository.findById(id).get());
        return "alterarProfessor";
    }


    @PostMapping("/alterarProfessor")
    public String alterarProfessorPost(Professor professor) {
        professorRepository.save(professor);
        return "redirect:/listarProfessores";
    }

    @RequestMapping("/excluirProfessor")
    public String alterarProfessorPost(String id) {
        professorRepository.deleteById(id);
        return "redirect:/listarProfessores";
    }

    //    Seção dos treinos
    @RequestMapping("/listarTreinos")
    public String listarTreinos(Model model) {
        model.addAttribute("treinos", treinoRepository.findAll());
        return "listarTreinos";
    }

    @GetMapping("/cadastrarTreino")
    public String cadastrarTreino(Model model) {
        return "cadastrarTreino";
    }

    @PostMapping("/cadastrarTreino")
    public String cadastrarTreinoPost(Treino treino) {
        treinoRepository.save(treino);
        return "redirect:/listarTreinos";
    }

    @GetMapping("/alterarTreino")
    public String alterarTreino(Model model, Long id) {
        Treino treino = treinoRepository.findById(id).get();
        List<Aluno> alunos = alunoRepository.findAll();
        alunos.removeAll(treino.getAlunos());

        model.addAttribute("treino", treino);
        model.addAttribute("alunoRem", alunos);
        model.addAttribute("alunoAdd", treino.getAlunos());

        return "alterarTreino";
    }

    @PostMapping("/alterarTreino")
    public String alterarTreinoPost(Treino treino) {
        Treino treinoSalvo = treinoRepository.findById(treino.getId()).get();
        treinoSalvo.setTipoTreino(treino.getTipoTreino());
        treinoSalvo.setExercicios(treino.getExercicios());
        treinoSalvo.setDescricao(treino.getDescricao());
        treinoSalvo.setGrupoMuscular(treino.getGrupoMuscular());
        treinoRepository.save(treinoSalvo);
        return "redirect:/listarTreinos";
    }

    @Transactional
    @PostMapping("/salvarAlunoTreino")
    @ResponseBody
    public void salvarAlunoTreino(Long treinoId, String[] addAluno, String[] removeAluno) {
        Treino treino = treinoRepository.findById(treinoId).get();
        List<String> listAddAlunos = Arrays.asList(addAluno);
        List<String> listRemoveAluno = Arrays.asList(removeAluno);
        for(Aluno a : alunoRepository.findAll()) {
            for(String x : listAddAlunos) {
                if(a.getCpf().equals(x.replaceAll("\\D+",""))) {
                    if(!a.getTreinos().contains(treino)) {
                        a.getTreinos().add(treino);
                    }
                }
            }
            for(String x : listRemoveAluno) {
                if(a.getCpf().equals(x.replaceAll("\\D+",""))) {
                    if(a.getTreinos().contains(treino)) {
                        a.getTreinos().remove(treino);
                    }
                }
            }
        }
        treinoRepository.save(treino);
    }

    @RequestMapping("/excluirTreino")
    public String alterarTreinoPost(Long id) {
        treinoRepository.deleteById(id);
        return "redirect:/listarTreinos";
    }

}