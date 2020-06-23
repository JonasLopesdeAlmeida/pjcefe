<%@page import="dados.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html; charset=ISO-8859-1" language="java" pageEncoding="UTF-8" import="java.sql.*" errorPage="" %>
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

<script>
//validador CPF
function verificarCPF(c){
    var i;
    s = c;
    var c = s.substr(0,9);
    var dv = s.substr(9,2);
    var d1 = 0;
    var v = false;
 
    for (i = 0; i < 9; i++){
        d1 += c.charAt(i)*(10-i);
    }
    if (d1 == 0){
        alert("CPF Inválido")
        v = true;
        return false;
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) d1 = 0;
    if (dv.charAt(0) != d1){
        alert("CPF Inválido")
        v = true;
        return false;
    }
 
    d1 *= 2;
    for (i = 0; i < 9; i++){
        d1 += c.charAt(i)*(11-i);
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) d1 = 0;
    if (dv.charAt(1) != d1){
        alert("CPF Inválido")
        v = true;
        return false;
    }
    if (!v) {
        alert("CPF Válido")
    }
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
  </header><!-- #header -->

	<!--==========================
    Hero Section
  ============================-->
	<section id="hero_1"> </section>
	<!-- #hero -->

	<main id="main"> <br>
	<br>
	<div class="container">


		<div class="card">
			<div class="card-body">

				
					
				<h1 style="text-align: center;">CURSISTA</h1>


				<form method="post" action="ServerCursista" name="frmAdd"
					enctype="multipart/formdata">

					<div class="row">
						<div class="col-sm-4">
							<label for="exampleInputEmail1">CPF</label><br> <input
								type="text" minlength="11" maxlength="11" name="cpf"
								class="form-control" placeholder="somente números."
								 required="required"onblur="return verificarCPF(this.value)"/>
							<br>
						</div>
						<div class="col-sm-8">
							<label >NOME</label><br> <input
								type="text" name="nome" class="form-control" required="required" />
							<br>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<label>DATA DE NASCIMENTO:</label> <input type="Date"
								name="datanasc" value="" id="datanasc" class="form-control"
								required="required" /> <br>
						</div>


						<div class="col-sm-8">
							<label for="exampleInputEmail1">INSTITUIÇÃO</label><br> <input
								type="text" name="instituicao" class="form-control" /> <br>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12">
							<label for="exampleInputEmail1">SETOR DE LOTAÇÃO</label><br>
							<input type="text" name="setor" class="form-control" /> <br>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12">
							<label for="exampleInputEmail1"> NOME DO CARGO</label><br> <input
								type="text" name="cargo" class="form-control" id="text1" /> <br>
						</div>
					</div>


					<div class="row">
						<div class="col-sm-12">
							<label for="exampleInputEmail1"> NOME DA FUNÇÃO</label><br>
							<input type="text" name="funcao" class="form-control" id="text1" />
							<br>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<label for="exampleInputEmail1">MATRÍCULA</label><br> <input
								type="text"  name="matricula"
								placeholder="somente números."
								class="form-control" required="required" />

						</div>
						<div class="col-sm-2">
							<label for="exampleInputEmail1">FONE/CELULAR</label><br> <input
								type="text" minlength="14" maxlength="14" name="fone"
								class="form-control"
								onkeypress="$(this).mask('(00) 00000-0000')" 
								required="required" /> <br>

						</div>
						<div class="col-sm-7">
							<label for="exampleInputEmail1">E-MAIL</label><br> <input
								type="Email" name="email" class="form-control" />
						</div>

					</div>
                        
					<button type="submit" class="btn btn-success btn-block"
						style="width: 83px;" onblur="return verificarCPF(this.value)">Salvar</button>

						</div>
					</div>
                       <br>


				
				</form>

			</div>
		</div>
	</div>

	</main>
	<br>

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
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>
	
	<script type="text/javascript" src="funcoes_cpf.js"></script>

</body>
</html>
