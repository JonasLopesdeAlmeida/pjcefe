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
			<li class="menu-has-children"><a href="#">ADM </a>
				<ul class="dropdown-menu dropdown-menu-right mt-2">
					<li class="px-1 py-1">
						<form class="form" role="form">
							<div class="form-group">
								<input id="nome" placeholder="Usuário" class="form-control"
									type="text" required="">
							</div>

							<div class="form-group">
								<input id="senha" placeholder="Senha" class="form-control"
									type="text" required="">
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
	<section id="hero_1"> </section>
	<!-- #hero -->

	<main id="main"> <br>
	<br>


	</main>
	<br>
	<br>
	<br>
	<div class="container">

		
<%
String cpf = request.getParameter("cpf");
//int id_curso = Integer.parseInt(request.getParameter("id_curso"));

	
if(cpf != null)
{


		     PreparedStatement ps= null;
		 	  Connection con = null;
		 	  ResultSet rs = null;
		 	 
		 	  {

		 	 try
		 	 	{
		 	      Class.forName("org.postgresql.Driver").newInstance();
		 	     con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres","252107");
		 	     //con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres",
											//"*abomax9637");
		 	      ps = con.prepareStatement("select * from cursista where cpf=?"); 
		 	      ps.setString(1,cpf);
		 	      rs = ps.executeQuery();

		 	     
		 	      if(rs.next())
		      		{
		 	    	  %>
				<form id="frm" name="frm" action="matricula.jsp" method="post">
					<div class="row">
						<div class="col-sm-3">
							<label for="comment"
								style="text-transform: uppercase; color: gray;">CPF:</label> 
								<input type="hidden" name="id_cursista"	value="<%=rs.getInt("id_cursista")%>" style="text-transform: uppercase;" class="form-control" /> 
								<input type="text" name="cpf" readonly="true" value="<%=rs.getString("cpf")%>"
								style="text-transform: uppercase;" class="form-control" /> <br>
						</div>
						<div class="col-sm-9">
							<label for="comment"
								style="text-transform: uppercase; color: gray;">CURSISTA:</label> <input
								type="text" name="nome" readonly="true"
								value="<%=rs.getString("nome")%>"
								style="text-transform: uppercase;" class="form-control" /> <br>
						</div>
					</div>


					<%
						} else

									{
							
				
										response.sendRedirect("erroPage.jsp");
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

					<%


int id_evento = Integer.parseInt(request.getParameter("id_evento"));

	
if(id_evento != 0)
{


		     PreparedStatement ps1= null;
		 	  Connection con1 = null;
		 	  ResultSet rs1 = null;
		 	 
		 	  {

		 	 try
		 	 	{
		 	      Class.forName("org.postgresql.Driver").newInstance();
		 	      con1 = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe", "postgres",
							"252107");
		 	      ps1 = con1.prepareStatement("select * from evento where id_evento = ?"); 
		 	      ps1.setInt(1,id_evento);
		 	      rs1 = ps1.executeQuery();

		 	     
		 	      if(rs1.next())
		      		{
		 	    	

		 	    %>
		 	    
					<input type="hidden" name="id_evento"
						style="text-transform: uppercase;"
						value="<%=rs1.getInt("id_evento") %>" class="form-control" /> <input
						type="text" name="nome_evento" readonly="true"
						style="text-transform: uppercase;"
						value="<%=rs1.getString("nome_evento") %>" class="form-control" /> <br>
						<div class="col-sm-12">
					<div class="row">
						<table class="table table-bordered">
							<thead class="thead-light">
								<th>TURNO</th>
								<th>HORARIO</th>
								<th>DIA</th>

							</thead>
							<tbody>
								<tr>
									<td><%= rs1.getString("turno")%></td>
									<td><%= rs1.getString("horario")%></td>
									<td><%= rs1.getString("data_evento")%></td>
								</tr>

							</tbody>

						</table>

					</div>
					</div>


					<%
		 	    	
                 }

				}
			catch(ClassNotFoundException erroClass) /*erro caso ele não localize a classe o driver*/
		 	{
		 	out.println("Classe Driver JDBC não foi localizado, erro "+erroClass);
		 	}

		 	 catch(SQLException erroSQL) /* erro no banco de dados */
		 	 {
		 	 out.println("Erro de conexão com o banco de dados , erro"+erroSQL);
		 	 }
		 	 finally
		          {
		        	  if(rs1!= null)rs1.close();
		        	  if(ps1!= null)ps1.close();
		        	  if(con1!= null)con1.close();
		          }
		 	  }
}

		%> 
					<button type="submit" class="btn btn-success btn-block"
						style="width: 83px;">Próximo</button>
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

	<!-- Contact Form JavaScript File -->
	<script src="contactform/contactform.js"></script>

	<!-- Template Main Javascript File -->
	<script src="js/main.js"></script>

</body>
</html>
