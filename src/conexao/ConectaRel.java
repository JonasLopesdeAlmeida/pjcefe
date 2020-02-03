package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectaRel {
	   protected Connection con ;
	
	/* Realzaconexaocomo bancodedados*/
	public Connection getConnection()  
	{
		
		try
 		{
        Class.forName("org.postgresql.Driver");
 		con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe","postgres","252107");
       // con = DriverManager.getConnection("jdbc:postgresql://localhost/bdcefe","postgres","*abomax9637");
	}
		catch(ClassNotFoundException erroClass) /*erro caso ele não localize a classe o driver*/
	 	{
	 	System.out.println("Classe Driver JDBC não foi localizado, erro "+erroClass);
	 	}

	 	 catch(SQLException erroSQL) /* erro no banco de dados */
	 	 {
	 		System.out.println("Erro de conexão com o banco de dados , erro"+erroSQL);
	 	 } 
		return con;
		
		
}
	
	public void fecharConexao()
	{
	try{

	if (con != null)
	con.close();
	con = null;
	}
	catch(Exception e)
	{
	e.printStackTrace();
	}
	}
}
