package dao;

import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.Conecta;

import dados.Evento;

public class Eventodao extends Conecta {

	PreparedStatement stm = null;
	PrintWriter out = null;
	ResultSet rs = null;

	public void gravar(Evento ee) {

		try

		{

			stm = con.prepareStatement("insert into evento( data_evento, nome_evento, turno, cat_evento, tipo_evento,carga_horaria, periodo, horario, ementa, setor, cargo, responsavel1, qtd_turmas, file, responsavel2, file2, responsavel3, file3)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

			stm.setString(1, ee.getData_evento());
			stm.setString(2, ee.getNome_evento());
			stm.setString(3, ee.getTurno());
			stm.setString(4, ee.getCat_evento());
			stm.setString(5, ee.getTipo_evento());
			stm.setString(6, ee.getCarga_horaria());
			stm.setString(7, ee.getPeriodo());
			stm.setString(8, ee.getHorario());
			stm.setString(9, ee.getEmenta());
			stm.setString(10, ee.getSetor());
			stm.setString(11, ee.getCargo());
			stm.setString(12, ee.getResponsavel1());
			stm.setString(13, ee.getQtd_turmas());
			stm.setString(14, ee.getFile());
			stm.setString(15, ee.getResponsavel2());
			stm.setString(16, ee.getFile2());
			stm.setString(17, ee.getResponsavel3());
			stm.setString(18, ee.getFile3());
			
			stm.execute();
			stm.close();
			con.close();

		} catch (SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conex�o com o banco de dados , erro" + erroSQL);
		}

	}

	public void atualizar(Evento ee) {

		try

		{

			stm = con.prepareStatement(
					"update evento set data_evento=?, nome_evento=?, turno=?, cat_evento=?, tipo_evento=?,carga_horaria=?, periodo=?, horario=?, ementa=?, setor=?, cargo=?,responsavel1=?, file=? , qtd_turmas=?, reponsavel2=?, file2=?, reponsavel3=?, file3=? where id_evento=?");

			stm.setString(1, ee.getData_evento());
			stm.setString(2, ee.getNome_evento());
			stm.setString(3, ee.getTurno());
			stm.setString(4, ee.getCat_evento());
			stm.setString(5, ee.getTipo_evento());
			stm.setString(6, ee.getCarga_horaria());
			stm.setString(7, ee.getPeriodo());
			stm.setString(8, ee.getHorario());
			stm.setString(9, ee.getEmenta());
			stm.setString(10, ee.getSetor());
			stm.setString(11, ee.getCargo());
			stm.setString(12, ee.getResponsavel1());
			stm.setString(13, ee.getFile());
			stm.setString(14, ee.getQtd_turmas());
			stm.setString(15, ee.getResponsavel2());
			stm.setString(16, ee.getFile2());
			stm.setString(17, ee.getResponsavel3());
			stm.setString(18, ee.getFile3());
			stm.setInt(19, ee.getId_evento());
			stm.executeUpdate();
			stm.close();

		} catch (SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conex�o com o banco de dados , erro" + erroSQL);
		}

	}

	public void delete(Evento ee) {

		try

		{

			stm = con.prepareStatement("delete from evento where id_evento=?");
			stm.setInt(1, ee.getId_evento());
			stm.executeUpdate();
			stm.close();
			con.close();
		} catch (SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conex�o com o banco de dados , erro" + erroSQL);
		}

	}

}
