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

<!--===============================================================================================-->
<link rel="icon" type="img/png" href="img/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
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
          <li><a href="certificado.jsp">Certificado</a></li>
              <li><a href="acessoCursista.jsp">Espaço Cursista</a></li>
          <li><a href="#team">Espaço Fisico</a></li>
          <li><a href="contato.jsp">Contato</a></li>
       	   
      <!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->

	<!--==========================
    Hero Section
  ============================-->
  
  <%
String mensagemUsuario=null;

if (request.getMethod().equals("POST")) {
    EnviarEmail enviar = new EnviarEmail();
    enviar.setEmailDestinatario("jmdlopes.almeida@gmail.com");
    enviar.setAssunto("Contato - PORTAL CEFE");
    //uso StringBuffer para otimizar a concatenação 
    //de string
    StringBuffer texto = new StringBuffer(); 
    texto.append("<h2 align='center'>CEFE</h2>");
    texto.append("Informações Enviadas:<br/>");
    texto.append("Contato: ");
    texto.append(request.getParameter("first-name"));
    texto.append("<br/>");
    //texto.append(request.getParameter("last-name"));
    //texto.append("<br/>");
    texto.append("Telefone Contato: ");
    texto.append(request.getParameter("phone"));
    texto.append("<br/>");
    texto.append("Email Contato: ");
    texto.append(request.getParameter("email"));
    texto.append("<br/>");
    texto.append("Mensagem: ");
    texto.append(request.getParameter("message"));
    
    enviar.setMsg(texto.toString());
    
    boolean enviou = enviar.enviarGmail();
    if (enviou) {
            
            mensagemUsuario = "Dados enviados com sucesso";
           
        } else {
            mensagemUsuario = "Não foi enviar as informações";
            
        }
  
}
  
%>
  
	<section id="hero_1"> </section>
	<!-- #hero -->
 <%if (mensagemUsuario != null) {%>
                <div>
                    <%=mensagemUsuario%>
                </div>
                <%}%>
	<main id="main2"> <br>
	<br>
	<div class="container">
		<div class="card">
			<div class="card-body">
				
				<div class="container-contact100">
					<div class="wrap-contact100">
						<form method="post" class="contact100-form validate-form" >
							<span class="contact100-form-title"> Entre Em Contato
								Conosco </span>
						

							<label class="label-input100" for="first-name">Informe
								seu nome *</label>
							<div class="wrap-input100 rs1-wrap-input100 validate-input"
								data-validate="Informe o Nome">
								<input id="first-name" class="input100" type="text"
									name="first-name" placeholder="Nome"> <span
									class="focus-input100"></span>
							</div>
							<div class="wrap-input100 rs2-wrap-input100 validate-input"
								data-validate="Informe o Sobrenome">
								<input class="input100" type="text" id="last-name"
									name="last-name" placeholder="Sobrenome"> <span
									class="focus-input100"></span>
							</div>

							<label class="label-input100" for="email">Informe seu
								email *</label>
							<div class="wrap-input100 validate-input"
								data-validate="Informe o Email">
								<input id="email" class="input100" type="text" name="email"
									placeholder="Ex. exemplo@email.com"> <span
									class="focus-input100"></span>
							</div>

							<label class="label-input100" for="phone">Informe o seu
								telefone</label>
							<div class="wrap-input100">
								<input id="phone" class="input100" type="text" name="phone"
									placeholder=""> <span class="focus-input100"></span>
							</div>

							<label class="label-input100" for="message">Mensagem *</label>
							<div class="wrap-input100 validate-input"
								data-validate="Digite sua Mensagem">
								<textarea id="message" class="input100" name="message"
									placeholder=""></textarea>
								<span class="focus-input100"></span>
							</div>

							<div class="container-contact100-form-btn">
								<button class="contact100-form-btn">Enviar</button>
							</div>
						</form>

						<div class="contact100-more flex-col-c-m"
							style="background-image: url('img/fundo.png');">
							<div class="flex-w size1 p-b-47">
								<div class="txt1 p-r-25">
									<span class="lnr lnr-map-marker"></span>
								</div>

								<div class="flex-col size2">
									<span class="txt1 p-b-20"> Endereço </span> <span class="txt2">
										\*****************************/ </span>
								</div>
							</div>

							<div class="dis-flex size1 p-b-47">
								<div class="txt1 p-r-25">
									<span class="lnr lnr-phone-handset"></span>
								</div>

								<div class="flex-col size2">
									<span class="txt1 p-b-20"> Telefone </span> <span class="txt3">
										\*****************************/ </span>
								</div>
							</div>

							<div class="dis-flex size1 p-b-47">
								<div class="txt1 p-r-25">
									<span class="lnr lnr-envelope"></span>
								</div>

								<div class="flex-col size2">
									<span class="txt1 p-b-20"> Email </span> <span class="txt3">
										\*****************************/ </span>
								</div>
							</div>
						</div>
					</div>
				</div>



				<div id="dropDownSelect1"></div>




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
		<p>Desenvolvimento Secretaria Municipal de Informação de Tecnologia - SEMIT</p>
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

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch : 20,
			dropdownParent : $('#dropDownSelect1')
		});
	</script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/main2.js"></script>
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>

</body>
</html>
