package dao;

import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.Conecta;
import dados.Escola;


public class Escoladao extends Conecta  {

	PreparedStatement stm = null;
	PrintWriter out =  null;
	ResultSet rs= null;


	public void gravar( Escola es )
	{

		try

		{

			stm =  con.prepareStatement("insert into escola( instituicao, modalidade, gestor, endereco, telefone, email)values(?,?,?,?,?,?)");

			stm.setString(1,es.getInstituicao());
			stm.setString(2,es.getModalidade()); 
			stm.setString(3,es.getGestor());
			stm.setString(4,es.getEndereco());
			stm.setString(5,es.getTelefone());
			stm.setString(6,es.getEmail());
			
			stm.execute();
			stm.close();                             
			con.close();
		}
		catch(SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conex�o com o banco de dados , erro"+erroSQL);
		} 


	}
	

	public void atualizar(Escola es )
	{

		try

		{

			stm =  con.prepareStatement("update set escola instituicao=?, modalidade=?, gestor=?, endereco=?, telefone=?, email=?");

			stm.setString(1,es.getInstituicao());
			stm.setString(2,es.getModalidade()); 
			stm.setString(3,es.getGestor());
			stm.setString(4,es.getEndereco());
			stm.setString(5,es.getTelefone());
			stm.setString(6,es.getEmail());
			stm.executeUpdate();
			stm.close();
		}
		catch(SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conex�o com o banco de dados , erro"+erroSQL);
		} 


	}
}
