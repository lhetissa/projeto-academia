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
                 <a href="/cadastrarProfessor" class="btn btn-success">Cadastrar</a>&nbsp;
                  </div>
                  </br>
<div class="container">
<div class="container">
    <div class="row">
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Nome</th>
                <th scope="col">CPF</th>
                <th scope="col">E-mail</th>
                <th scope="col">Telefone</th>
                <th scope="col">Ações</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="professor" items="${professores}">
                <tr>
                    <td>${professor.name}</td>
                    <td>${professor.cpf}</td>
                    <td>${professor.email}</td>
                    <td>${professor.telefone}</td>
                     <td>
                       <a href="/alterarProfessor?id=${professor.cpf}" class="btn btn-success">Alterar</a>&nbsp;
                       <button class="btn btn-danger" onclick="confirmar('${professor.name}', '${professor.cpf}')">
                                               Excluir
                                               </button>
                     </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row justify-content-center">
        <a class="btn btn-success" href="/">Ir para o início</a>
    </div>
</div>

</body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
function confirmar(name, cpf)
{
var r=confirm("Tem certeza que deseja excluir o professor "+name+" ?");
if (r==true)
  {
  window.location.href="/excluirProfessor?id="+cpf;
  }
}
</script>

</html>