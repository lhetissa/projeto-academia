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
</head>
<body>

<div class="row justify-content-center">
<img src="imagens/academia.jpg"  alt="academia">
</div>
<p>

<div class="container">
    <div class="container">
        <div class="row">
            <div class="col-4">
                <form action="/alterarAluno" method="post">
                    <div class="form-group">
                        <label>CPF</label>
                        <input type="text" class="form-control" placeholder="CPF" name="cpf" value="${aluno.cpf}" readonly>
                    </div>
                    <div class="form-group">
                        <label>Nome</label>
                        <input type="text" class="form-control" placeholder="Nome" name="name" value="${aluno.name}">
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" class="form-control" placeholder="E-mail" name="email" value="${aluno.email}">
                    </div>
                    <div class="form-group">
                        <label>Telefone</label>
                        <input type="text" class="form-control" placeholder="Telefone" name="telefone" value="${aluno.telefone}">
                    </div>
                    <button class="btn btn-primary" type="submit">Alterar</button>
                </form>
            </div>
            <div class="col-8">
                <div class="row">
                    <div class="col-5">
                        <select name="addProfessores" id="addProfessores" size="6" multiple="multiple" class="form-control">
                            <c:forEach var="professorR" items="${professorRem}">
                                <option value="${professorR.cpf}"> ${professorR.cpf} - ${professorR.name} </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-1">
                        <br><br>
                        <a href="javascript:add_to_professor(event);" onclick="" style="width:25px;">&gt;&gt;</a>
                        <br>
                        <a href="javascript:remove_from_professor(event);" onclick="" style="width:25px;">&lt;&lt;</a>
                    </div>
                    <div class="col-5">
                        <select name="removeProfessores" id="removeProfessores" size="6" multiple="multiple" class="form-control">
                            <c:forEach var="professorA" items="${professorAdd}">
                                <option value="${professorA.cpf}"> ${professorA.cpf} - ${professorA.name} </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-12">
                        <p></p>
                        <input type="button" class="btn btn-success" onclick="Get_Selected_professores();" value="Salvar professores"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</br>
<script>
    function add_to_professor(evt)
    {
        var ListSelected_selected = $("#removeProfessores");
        var ListAll_selected = $("#addProfessores option:selected");
        $(ListSelected_selected).append($(ListAll_selected).clone());
        $(ListAll_selected).remove();
    }
    function remove_from_professor(evt)
    {
        var ListSelected_selected = $("#removeProfessores option:selected");
        var ListAll_selected = $("#addProfessores");
        $(ListAll_selected).append($(ListSelected_selected).clone());
        $(ListSelected_selected).remove();
        SortProfessores("addProfessores");
    }
    function SortProfessores(elementId)
    {
        var sortedList = $.makeArray($("#" + elementId + " option")).sort(function (a, b) {
            return $(a).text() < $(b).text() ? -1 : 1;
        });
        $("#" + elementId).empty().html(sortedList);
    }
    function Get_Selected_professores()
    {
        var addProfessor = [];
        $("#removeProfessores option").each(function () {
            addProfessor.push($(this).val());
        });
        var removeProfessor = [];
        $("#addProfessores option").each(function () {
            removeProfessor.push($(this).val());
        });

        $.post( "/salvarProfessorAluno", {
            alunoCpf: "${aluno.cpf}",
            addProfessor: JSON.stringify(addProfessor),
            removeProfessor: JSON.stringify(removeProfessor)
        })
        .done(function() {
            alert( "Professores salvos com sucesso!" );
        })
        .fail(function() {
            alert( "Erro ao salvar professores." );
        })
    }
</script>
<div class="row justify-content-center">
            <a class="btn btn-success" href="/">Ir para o início</a>

</body>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

</html>