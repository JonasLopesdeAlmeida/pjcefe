<%@page import="dados.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html; charset=ISO-8859-1" language="java"
	pageEncoding="UTF-8" import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CEFE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Poppins:300,400,500,700"
	rel="stylesheet">

<!-- Bootstrap CSS File -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Libraries CSS Files -->
<link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">

<!-- Main Stylesheet File -->
<link href="css/style.css" rel="stylesheet">

<!-- =======================================================
    Theme Name: Regna
    Theme URL: https://bootstrapmade.com/regna-bootstrap-onepage-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->

<script language="javascript">
	function VerificaCPF() {
		if (vercpf(document.frmcpf.cpf.value)) {
			document.frmcpf.submit();
		} else {
			errors = "1";
			if (errors)
				alert('CPF NÃO VÁLIDO');
			document.retorno = (errors == '');
		}
	}
	function vercpf(cpf) {
		if (cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111"
				|| cpf == "22222222222" || cpf == "33333333333"
				|| cpf == "44444444444" || cpf == "55555555555"
				|| cpf == "66666666666" || cpf == "77777777777"
				|| cpf == "88888888888" || cpf == "99999999999")
			return false;
		add = 0;
		for (i = 0; i < 9; i++)
			add += parseInt(cpf.charAt(i)) * (10 - i);
		rev = 11 - (add % 11);
		if (rev == 10 || rev == 11)
			rev = 0;
		if (rev != parseInt(cpf.charAt(9)))
			return false;
		add = 0;
		for (i = 0; i < 10; i++)
			add += parseInt(cpf.charAt(i)) * (11 - i);
		rev = 11 - (add % 11);
		if (rev == 10 || rev == 11)
			rev = 0;
		if (rev != parseInt(cpf.charAt(10)))
			return false;
		alert('O CPF É VÁLIDO.');
		return true;
	}
</script>

</head>

<body>
	<!--==========================
  Header
  ============================-->
	<header id="header">
	<div class="container">

		<div id="logo" class="pull-left">
			<a href="#hero"><img src="img/logo.png" alt="" title="" /></img></a>
			<!-- Uncomment below if you prefer to use a text logo -->
			<!--<h1><a href="#hero">Regna</a></h1>-->
		</div>

		<nav id="nav-menu-container">
		<ul class="nav-menu">
			<li class="menu-active"><a href="index.jsp">Home</a></li>
			<li><a href="consultaonline.jsp">Inscrições On-line</a></li>
			<li><a href="#solicitacoescursos">Solicitação de Cursos</a></li>
			<li><a href="acessoCursista.jsp">Espaço Cursista</a></li>
			<li><a href="#team">Espaço Fisico</a></li>
			<li><a href="#">Contato</a></li>

			<!-- #nav-menu-container -->
	</div>
	</header>
	<!-- #header -->

	<!--==========================
    Hero Section
  ============================-->
	<section id="hero_1"> </section>
	<!-- #hero -->

	<main id="main"> <br>
	<br>


	</main>
	<br>
	<br>
	<br>
	<div class="container">

		<form method="post" action="entre.jsp" name="frmAdd enctype="
			application/x-www-form-urlencoded" onsubmit="VerificaCPF();">

			<div class="row">
				<div class="col-sm-8">
					<%
						int id_evento = Integer.parseInt(request.getParameter("id_evento"));

						if (id_evento != 0) {

							PreparedStatement ps = null;
							Connection con = null;
							ResultSet rs = null;

							{

								try {
									Class.forName("org.postgresql.Driver").newInstance();
									con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres", "252107");
									//con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres",
									//"*abomax9637");

									ps = con.prepareStatement("select * from evento where id_evento = ? ");
									ps.setInt(1, id_evento);
									rs = ps.executeQuery();

									while (rs.next()) {
					%>
					<input type="hidden" name="id_evento"
						style="text-transform: uppercase;"
						value="<%=rs.getInt("id_evento")%>" class="form-control" /> <label>EVENTO:</label>
					<input type="text" name="nome_evento" readonly="true"
						style="text-transform: uppercase;"
						value="<%=rs.getString("nome_evento")%>" class="form-control" />
					<br>
				</div>
				<%
					}

							} catch (ClassNotFoundException erroClass) /*erro caso ele não localize a classe o driver*/
							{
								out.println("Classe Driver JDBC não foi localizado, erro " + erroClass);
							}

							catch (SQLException erroSQL) /* erro no banco de dados */
							{
								out.println("Erro de conexão com o banco de dados , erro" + erroSQL);
							} finally {
								if (rs != null)
									rs.close();
								if (ps != null)
									ps.close();
								if (con != null)
									con.close();
							}
						}
					}
				%>

				<div class="col-sm-4">
					<label>CPF:</label> <input type="text" name="cpf" minlength="11"
						maxlength="11" value="" class="form-control" />
				</div>
			</div>

			<button type="submit" class="btn btn-success btn-block"
				style="width: 83px;" >Próximo</button>
		</form>
	</div>

	<br>



	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	<!-- JavaScript Libraries -->
	<script src="lib/jquery/jquery.min.js"></script>
	<script src="lib/jquery/jquery-migrate.min.js"></script>
	<script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/wow/wow.min.js"></script>
	<script src="lib/waypoints/waypoints.min.js"></script>
	<script src="lib/counterup/counterup.min.js"></script>
	<script src="lib/superfish/hoverIntent.js"></script>
	<script src="lib/superfish/superfish.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>

	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>

</body>
</html>
