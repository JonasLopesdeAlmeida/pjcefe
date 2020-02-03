<%@page import="dados.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"    import ="java.sql.*"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>CEFE</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Poppins:300,400,500,700" rel="stylesheet">

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
          <li><a href="#inscricaoonline">Inscrições On-line</a></li>
          <li><a href="#solicitacoescursos">Solicitação de Cursos</a></li>
          <li><a href="#team">Espaço Fisico</a></li>
          <li><a href="#contact">Contato</a></li>
           <li class="menu-has-children"><a href="adm.jsp">ADM</a></li>
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->

  <!--==========================
    Hero Section
  ============================-->
  <section id="hero_1">

  </section><!-- #hero -->

  <main id="main">
<br>
<br>
   <div class="container">
 <div class="card">
  <div class="card-body">
 	
<h1 style="text-align: center;"></h1>
     			
  				<form  method="post" action="consultaCursista.jsp" name="frmAdd" enctype="multipart/formdata"> 
  				<div class="row">
				<div class="col-sm-3">
  				<label >NOME:</label>
				<input type="text" name="nome" value="" id="nome"  class="form-control"/>
  				</div>
  				
				<div class="col-sm-8">
  				<label >CPF:</label>
				<input type="text" name="cpf" value="" id="cpf"  class="form-control" onkeypress="$(this).mask('000.000.000-00');" required="required" />
				<br>
  				</div>
  				</div>
  				
 <input type="submit" value="Salvar" id="salvar" style="width:83px;"/>
 


</form>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>



</div>
</div>
</div>

  

  </main>

  <!--==========================
    Footer
  ============================-->
  <footer id="footer">
    <div class="footer-">
      <div class="container">

      </div>
    </div>

    <div class="container">
      <div class="credits">
          <br>
        <br>
         <br>

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
  </footer><!-- #footer -->

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
  
   <script type="text/javascript">
 	$('#telefone').mask('(99) 99999-9999');
 	$('#data').mask('99/99/9999');
 	$('#cpf').mask('999.999.999-99');
 	$('#cep').mask('99.999-999');
 </script>
 <script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>

  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>

</body>
</html>