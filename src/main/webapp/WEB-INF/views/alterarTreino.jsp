<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" 		uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<%@ taglib prefix="sec" 	uri="http://www.springframework.org/security/tags" %>--%>
<fmt:setLocale value = "pt_BR"/>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Academia</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div>
<div class="row justify-content-center">
<img src="imagens/academia.jpg"  alt="academia">
</div>
<p>
<div class="container">
    <div class="container">
        <div class="row">
            <div class="col-4">
                <form action="/alterarTreino" method="post">
                    <input type="hidden" name="id" value="${treino.id}">
                    <div class="form-group">
                        <label>Tipo de Treino</label>
                        <input type="text" class="form-control" autocomplete="off" placeholder="Tipo de Treino" value="${treino.tipoTreino}" name="tipoTreino">
                    </div>
                    <div class="form-group">
                        <label>Descrição</label>
                        <input type="text" class="form-control" placeholder="Descrição" name="descricao" value="${treino.descricao}">
                    </div>
                    <div class="form-group">
                        <label>Grupo Muscular</label>
                        <input type="text" class="form-control" placeholder="Grupo Muscular" autocomplete="off" value="${treino.grupoMuscular}" name="grupoMuscular">
                    </div>
                    <div class="form-group">
                        <label>Exercícios</label>
                        <input type="text" class="form-control" placeholder="Exercícios" autocomplete="off" value="${treino.exercicios}" name="exercicios">
                    </div>
                    <button class="btn btn-success" type="submit">Alterar</button>
                </form>
            </div>
            <div class="col-8">
                <div class="row">
                    <div class="col-5">
                        <select name="addAlunos" id="addAlunos" size="6" multiple="multiple" class="form-control">
                            <c:forEach var="alunoR" items="${alunoRem}">
                                <option value="${alunoR.cpf}"> ${alunoR.cpf} - ${alunoR.name} </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-1">
                        <br><br>
                        <a href="javascript:add_to_aluno(event);" onclick="" style="width:25px;">&gt;&gt;</a>
                        <br>
                        <a href="javascript:remove_from_aluno(event);" onclick="" style="width:25px;">&lt;&lt;</a>
                    </div>
                    <div class="col-5">
                        <select name="removeAlunos" id="removeAlunos" size="6" multiple="multiple" class="form-control">
                            <c:forEach var="alunoA" items="${alunoAdd}">
                                <option value="${alunoA.cpf}"> ${alunoA.cpf} - ${alunoA.name} </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-12">
                        <p></p>
                        <input type="button" class="btn btn-success" onclick="Get_Selected_alunos();" value="Salvar alunos"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function add_to_aluno(evt)
    {
        var ListSelected_selected = $("#removeAlunos");
        var ListAll_selected = $("#addAlunos option:selected");
        $(ListSelected_selected).append($(ListAll_selected).clone());
        $(ListAll_selected).remove();
    }
    function remove_from_aluno(evt)
    {
        var ListSelected_selected = $("#removeAlunos option:selected");
        var ListAll_selected = $("#addAlunos");
        $(ListAll_selected).append($(ListSelected_selected).clone());
        $(ListSelected_selected).remove();
        SortAlunos("addAlunos");
    }
    function SortAlunos(elementId)
    {
        var sortedList = $.makeArray($("#" + elementId + " option")).sort(function (a, b) {
            return $(a).text() < $(b).text() ? -1 : 1;
        });
        $("#" + elementId).empty().html(sortedList);
    }
    function Get_Selected_alunos()
    {
        var addAluno = [];
        $("#removeAlunos  option").each(function () {
            addAluno.push($(this).val());
        });
        var removeAluno = [];
        $("#addAlunos  option").each(function () {
            removeAluno.push($(this).val());
        });

        $.post( "/salvarAlunoTreino", {
            treinoId: ${treino.id},
            addAluno: JSON.stringify(addAluno),
            removeAluno: JSON.stringify(removeAluno)
        })
        .done(function() {
            alert( "Alunos salvos com sucesso!" );
        })
        .fail(function() {
            alert( "Erro ao salvar alunos." );
        })
    }
</script>

</br>
<div class="row justify-content-center">
            <a class="btn btn-success" href="/">Ir para o início</a>
            </div>
</body>

</html>