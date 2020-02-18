package servidor;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dados.Certificado;
import dao.Certificadodao;

/**
 * Servlet implementation class ServerCertificado
 */
public class ServerCertificado extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerCertificado() {
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

   	         
   		int	id_evento  = Integer.parseInt(request.getParameter("id_evento"));   
   		int	id_cursista   = Integer.parseInt(request.getParameter("id_cursista"));
   		String data_cert = request.getParameter("data_cert");
   		PrintWriter out = response.getWriter();

   		Certificado c = new Certificado();
   		Certificadodao cc = new Certificadodao();
   		

   		c.setId_evento(id_evento);
   		c.setId_cursista(id_cursista);
   		c.setData_cert(data_cert);
   	

   		cc.open();
   		
   		if(cc != null){
   			cc.gravar(c);
   		}
   		
   		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	   		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	   		out.println("<script>");
	   		out.println("$(document).ready(function(){");
	   		out.println("swal ('Cursista adicionado com sucesso!','','success' );");
	   		out.println("});");
	   		out.println("</script>");
   		
	   		RequestDispatcher rd = request.getRequestDispatcher("acessoEvento.jsp");
			rd.include(request, response);

   		//response.sendRedirect("sucessomatricula.jsp?id_cursista="+ id_cursista);
   	}

}
