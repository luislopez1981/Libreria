<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MENU DE CLIENTE</title>
<style>
body {
	background-color: #31372B;
}
</style>
</head>
<body>
<%
Object usuario = request.getSession().getAttribute("usuario");
System.out.println(usuario);
if(usuario== null){ %>
<jsp:forward page="index.jsp"></jsp:forward>
	<% 
}
	

%>
<font color="White" face="Franklin Gothic ,arial">

<div align="center">
<hr/><h1>MENU PRINCIPAL</h1><hr/>


<jsp:include page="Usuario.jsp" />


 
<BR><BR><BR><BR><BR><BR><BR><BR>


<a href='Temas.jsp'><button type="button"><br><DIV><font color=#31372B face="Franklin Gothic ,arial">
<h4>LISTADO DE TEMAS</h4></div><BR></button></a>
<a href='Carrito.jsp'><button type="button"><br><DIV><font color=#31372B face="Franklin Gothic ,arial"><h4>CARRITO DE COMPRA</h4></div><BR></button></a>
<a href="Login?opcion=desconn"><button type="button"><BR><DIV><font color=#31372B face="Franklin Gothic ,arial"><h4>CERRAR SESIÓN</h4></div><BR></button></a>
</div>

<jsp:include page="Pie.jsp" />
</body>
</html>