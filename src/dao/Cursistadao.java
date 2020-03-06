package dao;

import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.Conecta;
import dados.Cursista;


public class Cursistadao extends Conecta  {

	PreparedStatement stm = null;
	PrintWriter out =  null;
	ResultSet rs= null;


	public void gravar(Cursista a )
	{

		try

		{

			stm =  con.prepareStatement("insert into cursista(nome,cpf,matricula,instituicao,email,fone,funcao,cargo,setor, datanasc)values(?,?,?,?,?,?,?,?,?,?)");

			stm.setString(1,a.getNome());
			stm.setString(2,a.getCpf()); 
			stm.setString(3,a.getMatricula());
			stm.setString(4,a.getInstituicao());
			stm.setString(5,a.getEmail());
			stm.setString(6,a.getFone());
			stm.setString(7,a.getFuncao());
			stm.setString(8,a.getCargo());
			stm.setString(9,a.getSetor());
			stm.setString(10,a.getDatanasc());	 
			stm.execute();
			stm.close();                             
			con.close();
		}
		catch(SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro"+erroSQL);
		} 

	}
	
	public void atualizar(Cursista a )
	{

		try

		{		
			stm =  con.prepareStatement("update cursista set nome=?, cpf=?, matricula=?, instituicao=?, email=?, fone=?,  funcao=?, cargo=?, setor=?, datanasc=? where id_cursista=?");

			stm.setString(1,a.getNome());
			stm.setString(2,a.getCpf()); 
			stm.setString(3,a.getMatricula());
			stm.setString(4,a.getInstituicao());
			stm.setString(5,a.getEmail());
			stm.setString(6,a.getFone());
			stm.setString(7,a.getFuncao());
			stm.setString(8,a.getCargo());
			stm.setString(9,a.getSetor());
			stm.setString(10,a.getDatanasc());
		    stm.setInt(11,a.getId_cursista());
			stm.executeUpdate();
			stm.close();
			con.close();
		}
		catch(SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro"+erroSQL);
		} 


	}






}
