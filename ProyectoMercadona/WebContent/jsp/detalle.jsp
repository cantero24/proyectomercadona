<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
    crossorigin="anonymous">
<link rel="stylesheet" href="../css/estilos.css">

<script src="https://code.jquery.com/jquery-3.1.1.js"
    integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
    crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/miscript.js"></script>
</head>
<body>

<h5><%= session.getAttribute("usuario") %> ha iniciado sesión</h5>

<h1>DETALLE</h1>

<div class="container-fluid">
        <div class="row">
			<%
			ResultSet rs=(ResultSet) request.getAttribute("resultados");
			while(rs.next())
			{
			%>
			
		            <div class="col-md-4 text-center">
		                <p><%=rs.getString("nombre") %></p>
		                <p><img  width="250" height="250" src='<%= rs.getString("image")%>'></p>
		                <p><%=rs.getString("descripcion") %></p>
		                <p><%=rs.getString("peso") %></p>
		                <p><%=rs.getString("precio") %></p>
		                
		            </div>

			<%} %>
        </div>
    </div>



</body>
</html>