package dao;

import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conexao.Conecta;
import dados.Login;

public class Logindao extends Conecta {

	PreparedStatement stm = null;
	PrintWriter out = null;
	ResultSet rs = null;

	public void gravar(Login l) {

		try

		{

			stm = con.prepareStatement(
					"insert into login( usuario, senha)values(?,?)");

			stm.setString(1, l.getUsuario());
			stm.setString(2, l.getSenha());

			stm.execute();
			stm.close();
			con.close();
		} catch (SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro" + erroSQL);
		}

	}

	public void atualizar(Login l) {

		try

		{

			stm = con.prepareStatement(
					"update login set usuario=?, senha=? where id_login=?");

			stm.setString(1, l.getUsuario());
			stm.setString(2, l.getSenha());
			stm.setInt(3, l.getId_login());
			stm.executeUpdate();
			stm.close();
			con.close();
		} catch (SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro" + erroSQL);
		}

	}

	public void delete(Login l) {

		try

		{

			stm = con.prepareStatement("delete from login where id_login=?");
			stm.setInt(1, l.getId_login());
			stm.executeUpdate();
			stm.close();
			con.close();
		} catch (SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro" + erroSQL);
		}

	}

}

