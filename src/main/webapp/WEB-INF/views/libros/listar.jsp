<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Lista de libros</title>
  <jsp:include page="/WEB-INF/views/cabecera.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/menu.jsp"/>
<div class="container">
  <div class="row">
    <h3>Lista de libros</h3>
  </div>
  <div class="row">
    <div class="col-md-12">
      <a class="btn btn-primary btn-md" href="<s:url
value="/libros/create"/>">Nuevo libro</a>
      <br><br>
      <table class="table table-striped table-bordered table-hover" id="tabla">
        <thead>
        <tr>
          <th>Codigo</th>
          <th>Nombre</th>
          <th>Existencias</th>
          <th>Precio</th>
          <th>Editorial</th>
          <th>Autor</th>
          <th>Genero</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.listaLibros}" var="libro">
        <tr>
          <td>${libro.codigoLibro}</td>
          <td>${libro.nombreLibro}</td>
          <td>${libro.existencias}</td>
          <td>${libro.precio}</td>
          <td>${libro.editorialesByCodigoEditorial.nombreEditorial}</td>
          <td>${libro.autoresByCodigoAutor.nombreAutor}</td>
          <td>${libro.generosByIdGenero.nombreGenero}</td>
          </tr>
        </c:forEach>
          </tbody>
          </table>
          </div>
          </div>
          </div>
          <script>
          $(document).ready(function () {
          $('#tabla').DataTable();
          });
          </script>
<jsp:include page="/WEB-INF/views/pie.jsp"/>
          </body>
          </html>
