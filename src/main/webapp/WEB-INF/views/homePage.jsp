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
    <ul class="nav justify-content-center">

            <li class="nav-item">
                <a class="nav-link active btn btn-success" aria-current="page" href= "/listarAlunos">Alunos</a>
              </li> &nbsp;
               <li class="nav-item">
               <a class="nav-link active btn btn-success"  aria-current="page" href= "/listarProfessores">Professores</a>
                 </li> &nbsp;
                 <li class="nav-item">
                 <a class="nav-link active btn btn-success"  aria-current="page" href= "/listarTreinos">Treinos</a>
                                          </li>


        </div>
    </div>
    </ul>

</body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

</html>