package servidor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lowagie.text.pdf.codec.Base64.InputStream;

import conexao.ConectaRel;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;

/**
 * Servlet implementation class ServerRelLista
 */
public class ServerRelLista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServerRelLista() {
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
   			gerarRelatorio(response,request);
   		
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
   			gerarRelatorio(response,request);
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

private void gerarRelatorio(HttpServletResponse response, HttpServletRequest request)throws Exception
	{
		// TODO Auto-generated method stub
		
		String erro = "";
		//int id_evento = Integer.parseInt(request.getParameter("id_evento"));
		String nome = request.getParameter("nome_evento");
		String turno = request.getParameter("turno");
		String data = request.getParameter("data_evento");
		String jasper = "relatorio/lista.jasper";
		HashMap<String, Object> param = new HashMap<String, Object>();
	    
		
	
     	param.put("EVENTO",nome);
		param.put("TURNO",turno);
		param.put("DATA",data);
		byte[] bytes= null;
		ServletContext contexto = getServletContext();
		
		
		  
		Connection conn = null;
    	conn = new  ConectaRel().getConnection();

	
		try
		{

			JasperReport lista = (JasperReport)JRLoader.loadObjectFromFile(contexto.getRealPath(jasper));
		    bytes = JasperRunManager.runReportToPdf(lista, param, conn); 
		    System.out.println("Param:" + param); 
		    System.out.println("Relatorio: " + lista);
		    System.out.println("Bytes: " + bytes); 
		    System.out.println("Jasper: " + jasper); 

	    
		}catch (JRException e) 
		{
			erro = e.getMessage();
			System.out.println("erro "+e);
		
			
		}
		finally
		{

			if(bytes != null) {
				response.setContentType("Application/pdf");
				response.setContentLength(bytes.length);
      			ServletOutputStream sos = response.getOutputStream();
				sos.write(bytes);
				sos.flush();
				sos.close();
			}else
			{
				RequestDispatcher rd = request.getRequestDispatcher("index.html");
				request.setAttribute("erro",erro);
				rd.forward(request, response);
			}
		}

}

}