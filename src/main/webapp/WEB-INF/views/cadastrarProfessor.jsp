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
        <h3>Cadastro de Professor</h3>
</div>


<div class="row justify-content-center">

        <form action="/cadastrarProfessor" method="post">
            <div class="form-group">
                <label>CPF</label>
                <input type="text" class="form-control" placeholder="CPF" autocomplete="off"  name="cpf"   onkeypress="$(this).mask('000.000.000-00');>
            </div>

            <div class="form-group">
                <label>Nome</label>
                <input type="text" class="form-control" placeholder="Nome" autocomplete="off" name="name">
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="text" class="form-control" placeholder="E-mail" autocomplete="off" name="email">
            </div>
            <div class="form-group">
                <label>Telefone</label>
                <input type="text" class="form-control" placeholder="Telefone" autocomplete="off" name="telefone">
            </div>
            <div class="row justify-content-center">
            <button class="btn btn-primary" type="submit">Cadastrar</button>
        </form>
    </div>
    </div>

</div> </br>
<div class="row justify-content-center">
            <a class="btn btn-success" href="/">Ir para o início</a>
</body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
</html>