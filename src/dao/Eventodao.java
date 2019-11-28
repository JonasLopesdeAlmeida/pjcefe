package dao;

import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.Conecta;

import dados.Evento;

public class Eventodao extends Conecta  {

	PreparedStatement stm = null;
	PrintWriter out =  null;
	ResultSet rs= null;


	public void gravar( Evento ee )
	{

		try

		{

			stm =  con.prepareStatement("insert into evento( data_evento, nome_evento, turno, tipo_evento,carga_horaria, periodo, horario, ementa, setor, cargo, qtd_turmas)values(?,?,?,?,?,?,?,?,?,?,?)");

			stm.setString(1,ee.getData_evento());
			stm.setString(2,ee.getNome_evento()); 
			stm.setString(3,ee.getTurno());
			stm.setString(4,ee.getTipo_evento());
			stm.setString(5,ee.getCarga_horaria());
			stm.setString(6,ee.getPeriodo());
			stm.setString(7,ee.getHorario());
			stm.setString(8,ee.getEmenta());
			stm.setString(9,ee.getSetor());
			stm.setString(10,ee.getCargo());
			stm.setInt(11,ee.getQtd_turmas());
			
			stm.execute();
			stm.close();                             
			con.close();
		}
		catch(SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro"+erroSQL);
		} 


	}
	

	public void atualizar(Evento ee )
	{

		try

		{

			
			stm =  con.prepareStatement("update set evento data_evento=?, nome_evento=?, turno=?, tipo_evento=?,carga_horaria=?, periodo=?, horario=?, ementa=?, setor=?, cargo=?, qtd_turmas=?");

			stm.setString(1,ee.getData_evento());
			stm.setString(2,ee.getNome_evento()); 
			stm.setString(3,ee.getTurno());
			stm.setString(4,ee.getTipo_evento());
			stm.setString(5,ee.getCarga_horaria());
			stm.setString(6,ee.getPeriodo());
			stm.setString(7,ee.getHorario());
			stm.setString(8,ee.getEmenta());
			stm.setString(9,ee.getSetor());
			stm.setString(10,ee.getCargo());
			stm.setInt(11,ee.getQtd_turmas());
			stm.executeUpdate();
			stm.close();
		}
		catch(SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro"+erroSQL);
		} 


	}

}
