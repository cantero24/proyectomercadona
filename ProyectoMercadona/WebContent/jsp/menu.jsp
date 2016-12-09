<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h5><%= session.getAttribute("usuario") %> ha iniciado sesión</h5>
	
	
	<div class="container-fluid">
        <div class="row text-center">
            <div class="col-md-6">
                <a href="producto" class="btn btn-lg btn-info">Productos</a>
            </div>
            <div class="col-md-6">
                <a href="pedidos" class="btn btn-lg btn-info">Pedidos</a>
            </div>
        </div>
    </div>
    
</body>
</html> 