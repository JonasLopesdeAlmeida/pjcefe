package dao;


import java.sql.SQLException;


import conexao.Conecta;
import dados.Evento;
import dados.Matricula;

public class Matriculadao extends Conecta  {
	
	
	
	
	public void gravar(Matricula m ) throws Exception
	{

		
		
		try
		{
        stm =  con.prepareStatement("insert into matricula(data_mat,id_evento,id_cursista)values(?,?,?)");
       // stm.setInt(1,m.getId_mat());
        stm.setString(1,m.getData_mat());
        stm.setInt(2,m.getId_evento());
        stm.setInt(3,m.getId_cursista());
	 	stm.execute();
	  	stm.close();                             
     	con.close();
 		}
   	     catch(SQLException erroSQL) /* erro no banco de dados */
    	 {
   	    	 	System.out.println("Erro de conexão com o banco de dados , erro"+erroSQL);
    	 } 
	}
	
	
	public void atualizar(Matricula m )
	{

		try

		{

			stm =  con.prepareStatement("update  matricula set data_mat=?,id_evento=?,id_cursista=? where id_mat=?");
			
			stm.setString(1,m.getData_mat());
		    stm.setInt(2,m.getId_evento());
		    stm.setInt(3,m.getId_cursista());
			stm.setInt(4,m.getId_mat());
			stm.executeUpdate();
			stm.close();
			con.close();
		}
		catch(SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro"+erroSQL);
		} 


	}
	
	public void delete(Matricula m ) {

		try

		{

			stm = con.prepareStatement("delete from matricula where id_mat=?");
			stm.setInt(1, m.getId_mat());
			stm.executeUpdate();
			stm.close();
			con.close();
		} catch (SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro" + erroSQL);
		}

	}

}


	
	


