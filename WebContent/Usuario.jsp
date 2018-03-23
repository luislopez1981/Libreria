<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style>
body {
	background-color: #31372B;
}
</style>
</head>
<body>
<%Usuario usuario2 = (Usuario)request.getSession().getAttribute("usuario"); 
String user = null;
if (usuario2.getTipoUsuario().equals("ADMON")){
	user = " ADMINISTRADOR";
}else{ 
	user = " CLIENTE";
} %>
<h3>USUARIO <%=user %>: <%=usuario2.getNombre().toUpperCase() %> <%=usuario2.getApellido().toUpperCase() %></h3><hr />
</body>
</html>