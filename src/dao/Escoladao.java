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
			System.out.println("Erro de conexão com o banco de dados , erro"+erroSQL);
		} 


	}
	

	public void atualizar(Escola es )
	{

		try

		{

			stm =  con.prepareStatement("update escola set instituicao=?, modalidade=?, gestor=?, endereco=?, telefone=?, email=? where id_escola=?");

			stm.setString(1,es.getInstituicao());
			stm.setString(2,es.getModalidade()); 
			stm.setString(3,es.getGestor());
			stm.setString(4,es.getEndereco());
			stm.setString(5,es.getTelefone());
			stm.setString(6,es.getEmail());
			stm.setInt(7, es.getId_escola());
			stm.executeUpdate();
			stm.close();
			con.close();
		}
		catch(SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro"+erroSQL);
		} 


	}
	
	
	public void delete(Escola es) {

		try

		{

			stm = con.prepareStatement("delete from escola where id_escola=?");
			stm.setInt(1, es.getId_escola());
			stm.executeUpdate();
			stm.close();
			con.close();
		} catch (SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro" + erroSQL);
		}

	}
}
