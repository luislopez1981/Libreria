<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="miusuario" class="model.Usuario" scope="request"/>
<jsp:setProperty property="*" name="miusuario"/>
<%
	if (request.getParameter("idUsuario") != null){
%>
	<jsp:forward page="Login?opcion=registrarBean"/>
			
<%}%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REGISTRO USUARIOS</title>
<style>
body {
	background-color: #31372B;
}
</style>
</head>
<body>
<font color="White" face="Franklin Gothic ,arial">
<form action="RegistroUsuario.jsp" method="post">
		<br />
		
		<div align="center">
		<h1>REGISTRO DE USUARIO</h1>
			<input type="text" maxlength="20" size="20" name="idUsuario" placeholder="Usuario">
			<br><br>
			<input type="password" maxlength="20" size="20" name="password" placeholder="Password">
			<br><br>
			<input type="text" maxlength="45" size="45" name="nombre" placeholder="Nombre">
			<br><br>
			<input type="text" maxlength="45" size="45" name="apellido" placeholder="Apellido">
			<br><br>
			<input type="text" maxlength="45" size="45" name="direccion" placeholder="Dirección">
			<br/> <br/> Tipo de Usuario<br/>
  			<input type="Radio" name="tipoUsuario" value="NORMAL" checked> General<br/>
  			<input type="Radio" name="tipoUsuario" value="ADMON"> Administrador<br/>	
  			<br><br>
  			<input type="submit" value="ENVIAR">
			<a href='index.jsp'><button type="button">VOLVER A INICIO</button></a>
		</div>		
	</form>
	
<jsp:include page="Pie.jsp" />
</body>
</html>