package servidor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dados.Escola;
import dao.Escoladao;

/**
 * Servlet implementation class ServerEscolaAtualizar
 */
public class ServerEscolaAtualizar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerEscolaAtualizar() {
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
   		
   		int id_escola = Integer.parseInt(request.getParameter("id_escola"));
   		String instituicao = request.getParameter("instituicao");
   		String modalidade = request.getParameter("modalidade");
   		String gestor = request.getParameter("gestor");
   		String endereco= request.getParameter("endereco");
   		String telefone = request.getParameter("telefone");
   		String email = request.getParameter("email");
   		//PrintWriter out = response.getWriter();
   
   		
   		Escola es  = new Escola();
   		Escoladao ed = new Escoladao();
   		
        es.setId_escola(id_escola);
   		es.setInstituicao(instituicao);
   		es.setModalidade(modalidade);
   		es.setGestor(gestor);
   		es.setEndereco(endereco);
   		es.setTelefone(telefone);
   		es.setEmail(email);
 
   		ed.open();
   		if(ed != null)
   		{
   			ed.atualizar(es);
   			
//   			out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
//	   		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
//	   		out.println("<script>");
//	   		out.println("$(document).ready(function(){");
//	   		out.println("swal ('Escola cadastrada com sucesso!','','success' );");
//	   		out.println("});");
//	   		out.println("</script>");
//	   		
//	   		RequestDispatcher rd = request.getRequestDispatcher("acessoEscola.jsp");
//	        rd.include(request, response);
   			
   		response.sendRedirect("sucessoescolaalterar.jsp?id_escola=" + id_escola);
   		
   		}
   		

   	
   	}
}
