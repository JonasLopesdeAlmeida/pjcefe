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
</head>

<body>

<script>
//funcao responsavel por mostrar a senha quando clicar no icone.
//a senha permance em texto plano enquanto o cursor do mouse permanecer sobre o icone.
function mouseoverPass(senha) {
	  var senha = document.getElementById('senhaConfig');
	  senha.type = "text";
	}
//funcao que oculta a senha quando o mouse nao estiver mais sobre o icone.
	function mouseoutPass(senha) {
	  var senha = document.getElementById('senhaConfig');
	  senha.type = "password";
	 
	}
</script>
<style>

.olho {
  cursor: pointer;
  left: 145px;
  position: absolute;
  width: 25px;
}

[data-tooltip] {
  position: relative;
  font-weight: bold;
}

[data-tooltip]:after {
  display: none;
  position: absolute;
  top: -5px;
  padding: 2px;
  border-radius: 3px;
  left: 115px;
  content: attr(data-tooltip);
  white-space: nowrap;
  background-color: #a6a59f;
  color: White;
}

[data-tooltip]:hover:after {
  display: block;
}
</style>

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
			<li class="menu-has-children"><a href="#">ADM </a>
				<ul class="dropdown-menu dropdown-menu-right mt-2">
					<li class="px-1 py-1">
						<form method="post" action="adm.jsp" name="frmAdd"
					enctype="multipart/formdata">
							<div class="form-group">
								<input name="usuario" id="usuario" placeholder="Usuário" class="form-control"
									type="text" required="">
							</div>

							<div class="form-group">
							
							 <img src="img/eye3.png" onclick="mouseoverPass();" onmouseout="mouseoutPass();" id="olho" class="olho"/>
								<input name="senha" id="senhaConfig" placeholder="Senha" class="form-control"
									type="password" required="">
									
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success btn-block">Login</button>
							</div>

						</form>
					</li></li>
		</ul>

		</nav>
		<!-- #nav-menu-container -->
	</div>
	</header>
	<!-- #header -->

	<!--==========================
    Hero Section
  ============================-->
	<section id="hero">
	<div class="hero-container">
		<h1>SECRETARIA MUNICIPAL DE EDUCAÇÃO</h1>
		<h2>CENTRO DE FORMAÇÃO DO EDUCADOR.</h2>

	</div>
	</section>
	<!-- #hero -->


	<!--==========================
    Footer
  ============================-->
	<footer id="footer" class="foter">
	<div class="footer-top">
		<div class="container">
			<p>Desenvolvimento Secretaria Municipal de Informação de
				Tecnologia - SEMIT</p>
		</div>
	</div>

	<div class="container">
		<div class="credits">
			<br> <br> <br>

			<!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Regna
        -->
			<!--
        Desenvolvimento <a href="https://bootstrapmade.com/">Walter Carvalho Barbosa</a><br>
        Contato<a href="https://bootstrapmade.com/">(98)98103-6150</a><br>
        Email <a href="https://bootstrapmade.com/">Waltercarvalhob@gmail.com</a>
        -->
		</div>
	</div>
	</footer>
	<!-- #footer -->

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

	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>

</body>
</html>
