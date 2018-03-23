<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LIBRERIA-LOGIN</title>
<style>
body {
	background-color: 
#31372B;
}
</style>
</head>
<body>
<font color="White" face="Franklin Gothic ,arial">
	<form action="Login?opcion=validar" method="post">
		<br />
		
		<div align="center">
		<h1>BIENVENIDO A LA LIBRERÍA</h1>
		<h2>LOGIN</h2>
			<input type="text" maxlength="20" size="20" name="usuario"
				placeholder="Usuario" required>
				<br><br>
			<input type="password" maxlength="20" size="20" name="password"
				placeholder="Password" required>	
				<br><br>
			<input  type="submit" value="ACCEDER">	
			
			<a href="RegistroUsuario.jsp"><button type="button">ALTA USUARIO</button></a>
		</div>			
	</form>

<jsp:include page="Pie.jsp" />
</body>
</html>