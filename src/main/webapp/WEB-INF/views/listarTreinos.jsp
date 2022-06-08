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
                         <a href="/cadastrarTreino" class="btn btn-success">Cadastrar</a>&nbsp;
                  </div>
  </br>

<div class="container">
    <div class="row">

            <c:forEach var="treino" items="${treinos}">


&nbsp &nbsp
                <div class="card text-dark bg-light mb-3"  style="width: 16rem;">
                      <div class="card-body">
                        <h5 class="card-title">Tipo de Treino: ${treino.tipoTreino}</h5>
                        <p class="card-text">Descrição: ${treino.descricao} </p>
                      </div>
                      <ul class="list-group list-group-flush">
                        <li class="list-group-item">Grupo Muscular: ${treino.grupoMuscular}</li>
                        <li class="list-group-item">Exercícios: ${treino.exercicios}</li>
                        <li class="list-group-item">Alunos: ${treino.alunos.size()}</li>
                      </ul>
                      <div class="card-body">
                        <a href="/alterarTreino?id=${treino.id}" class="btn btn-success">Alterar </a>
                        <button class="btn btn-danger" onclick="confirmar('${treino.tipoTreino}', '${treino.id}')">
                                                                     Excluir
                                                                     </button>
                </div>
                </div>
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
function confirmar(name, id)
{
var r=confirm("Tem certeza que deseja excluir o treino "+name+" ?");
if (r==true)
  {
  window.location.href="/excluirTreino?id="+id;
  }
}
</script>
</html>