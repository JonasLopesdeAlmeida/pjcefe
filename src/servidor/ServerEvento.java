package servidor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dados.Evento;
import dao.Eventodao;

/**
 * Servlet implementation class ServerEvento
 */
public class ServerEvento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerEvento() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
   	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   	 */
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		// TODO Auto-generated method stub
   		response.getWriter().append("Served at: ").append(request.getContextPath());
   		try {
   			doService(response,request);
   		
   	} catch (ClassNotFoundException e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		} catch (java.text.ParseException e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		} catch (SQLException e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		} catch (Exception e) {
   		// TODO Auto-generated catch block
   		e.printStackTrace();
   	}
   	}

   	
   	/**
   	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   	 */
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		// TODO Auto-generated method stub
   	
   		try {
   			doService(response,request);
   		} catch (ClassNotFoundException e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		} catch (java.text.ParseException e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		} catch (SQLException e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		} catch (Exception e) {
   			// TODO Auto-generated catch block
   			e.printStackTrace();
   		}
   	}
   	
   	private void doService(HttpServletResponse response, HttpServletRequest request)throws Exception {
   		// TODO Auto-generated method stub
   		response.setContentType("text/html");
   		
   	//	int id_curso = Integer.parseInt(request.getParameter("id_evento"));
   		String data_evento = request.getParameter("data_evento");
   		String nome_evento= request.getParameter("nome_evento");
   		String turno = request.getParameter("turno");
   		String cat_evento = request.getParameter("cat_evento");
   		String tipo_evento = request.getParameter("tipo_evento");
   		String carga_horaria = request.getParameter("carga_horaria");
   		String periodo = request.getParameter("periodo");		
   		String horario= request.getParameter("horario");
   		String ementa= request.getParameter("ementa");
   		String setor = request.getParameter("setor");
   		String cargo = request.getParameter("cargo");
   		String responsavel1 = request.getParameter("responsavel1");
   		String responsavel2 = request.getParameter("responsavel2");
   		String responsavel3 = request.getParameter("responsavel3");
   		byte[] img1 = request.getParameter("img1").getBytes();
   		byte[] img2 = request.getParameter("img2").getBytes();
   		byte[] img3 = request.getParameter("img3").getBytes();
   		int qtd_turmas = Integer.parseInt(request.getParameter("qtd_turmas"));
   		PrintWriter out = response.getWriter();
   
//   		String email = request.getParameter("email");
//   		String naturalidade = request.getParameter("naturalidade");
//   		String uf = request.getParameter("uf");
//   		String[] documentos = request.getParameterValues("documentos");
//   		String[] situacao = request.getParameterValues("situacao");
   		
   		Evento ee  = new Evento();
   		Eventodao ev = new Eventodao();
//   		a.setId_curso(id_curso);
   		ee.setData_evento(data_evento);
   		ee.setNome_evento(nome_evento);
   		ee.setTurno(turno);
   		ee.setCat_evento(cat_evento);
   		ee.setTipo_evento (tipo_evento );
   		ee.setCarga_horaria(carga_horaria);
   		ee.setPeriodo(periodo);	
   		ee.setHorario(horario);
   		ee.setEmenta(ementa);
   		ee.setSetor (setor);
   		ee.setCargo(cargo);
   		ee.setResponsavel1(responsavel1);
   		ee.setResponsavel2(responsavel2);
   		ee.setResponsavel3(responsavel3);
   		ee.setImg1(img1);
   		ee.setImg2(img2);
   		ee.setImg3(img3);
   		ee.setQtd_turmas(qtd_turmas);
   
//   		a.setEmail(email);
//   		a.setNaturalidade(naturalidade);
//   		a.setUf(uf);
   		
//   		if(documentos != null){
//   			String doc = Arrays.toString(documentos).replaceAll("\\[","").replaceAll("\\]","");
//   			a.setDocumentos(doc);
//   			}
//   		
//   		
//   		if(situacao != null){
//   			String sit = Arrays.toString(situacao).replaceAll("\\[","").replaceAll("\\]","");
//   			a.setSituacao(sit);
//   			}
   		
   		
   		
   		
   		
   		ev.open();
   		if(ev != null)
   		{
   			ev.gravar(ee);
   			
   		
   		}
   		
   		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
   		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
   		out.println("<script>");
   		out.println("$(document).ready(function(){");
   		out.println("swal ('Evento cadastrado com sucesso!','','success' );");
   		out.println("});");
   		out.println("</script>");
   		
   		RequestDispatcher rd = request.getRequestDispatcher("evento.jsp");
        rd.include(request, response);
   		
        
   	// response.sendRedirect("sucessoevento.jsp?nome_evento=" + nome_evento);
   	}

    
}
