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
<div class="row justify-content-center">
        <h3>Cadastro de Treino</h3>
</div>


<div class="row justify-content-center">


        <form action="/cadastrarTreino" method="post">
            <div class="form-group">
                <label>Tipo de Treino</label>
                <input type="text" class="form-control" autocomplete="off" placeholder="Tipo de Treino" name="tipoTreino">
            </div>

            <div class="form-floating">
                <label>Descrição</label>
                <textarea class="form-control" placeholder="Descrição" autocomplete="off" name="descricao"></textarea>
            </div>

            <div class="form-group">
                <label>Grupo Muscular</label>
                <input type="text" class="form-control" placeholder="Grupo Muscular " autocomplete="off" name="grupoMuscular">
            </div>
            <div class="form-group">
                <label>Exercícios</label>
                <input type="text" class="form-control" placeholder="Exercícios" autocomplete="off" name="exercicios">
            </div>
            <div class="row justify-content-center">
            <button class="btn btn-success" type="submit">Cadastrar</button>
            </div>
        </form>
    </div>
    </br>
    <div class="row justify-content-center">
            <a class="btn btn-success" href="/">Ir para o início</a>
</div>
</div>

</body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

</html>