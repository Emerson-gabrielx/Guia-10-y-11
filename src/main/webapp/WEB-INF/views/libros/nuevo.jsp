<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nuevo libro</title>
    <jsp:include page="/WEB-INF/views/cabecera.jsp"/>
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.c
ss" rel="stylesheet" />
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"
    ></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/menu.jsp"/>
<div class="container">
    <div class="row">
        <h3>Nuevo libro</h3>
    </div>
    <div class="row">
        <div class=" col-md-7">
            <f:form action="create" modelAttribute="libro" method="post">
            <div class="well well-sm"><strong><span class="glyphicon
glyphicon-asterisk"></span>Campos requeridos</strong></div>
            <div class="form-group">
                <label for="codigoLibro">Codigo del libro:</label>
                <div class="input-group">
                    <f:input path="codigoLibro" cssClass="formcontrol"/>
                    <span class="input-group-addon"><span
                            class="glyphicon glyphicon-asterisk"></span></span>
                </div>
            </div>
            <div class="form-group">
                <label for="nombreLibro">Nombre del libro:</label>
                <div class="input-group">
                    <f:input path="nombreLibro" cssClass="formcontrol"/>
                    <span class="input-group-addon"><span
                            class="glyphicon glyphicon-asterisk"></span></span>
                </div>
            </div>
            <div class="form-group">
                <label for="existencias">Existencias:</label>
                <div class="input-group">
                    <f:input path="existencias" cssClass="formcontrol"/>
                    <span class="input-group-addon"><span
                            class="glyphicon glyphicon-asterisk"></span></span>
                </div>
            </div>
            <div class="form-group">
                <label for="precio">Precio:</label>
                <div class="input-group">
                    <f:input path="precio" cssClass="form-control"/>
                    <span class="input-group-addon"><span
                            class="glyphicon glyphicon-asterisk"></span></span>
                </div>
            </div>
            <div class="form-group">
                <label for="autor">Autor:</label>
                <div class="input-group">
                    <f:select path="autoresByCodigoAutor.codigoAutor"
                              cssClass="form-control" id="autor">
                        <f:options items="${listaAutores}"
                                   itemLabel="nombreAutor"
                                   itemValue="codigoAutor"/>
                    </f:select>
                    <span class="input-group-addon"><span
                            class="glyphicon glyphicon-asterisk"></span></span>
                </div>
            </div>
            <div class="form-group">
                <label for="editorialesByCodigoEditorial.codigoEditorial">Editorial:</label>
                <div class="input-group">
                    <f:select
                            path="editorialesByCodigoEditorial.codigoEditorial" cssClass="form-control">
                        <f:options items="${listaEditoriales}"
                                   itemLabel="nombreEditorial"
                                   itemValue="codigoEditorial"/>
                    </f:select>
                    <span class="input-group-addon"><span
                            class="glyphicon glyphicon-asterisk"></span></span>
                </div>
            </div>
                <div class="form-group">
                    <label for="generosByIdGenero.idGenero">Genero:</label>
                    <div class="input-group">
                        <f:select path="generosByIdGenero.idGenero"
                                  cssClass="form-control">
                            <f:options items="${listaGeneros}"
                                       itemLabel="nombreGenero" itemValue="idGenero"/>
                        </f:select>
                        <span class="input-group-addon"><span
                                class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <f:button class="btn btn-info">Guardar</f:button>
                <a class="btn btn-danger" href="<s:url
value="/libros/list"/>">Cancelar</a>
            </f:form>
        </div>
    </div>
</div>
<script>
    $('#autor').select2();
</script>
<jsp:include page="/WEB-INF/views/pie.jsp"/>
</body>
</html>