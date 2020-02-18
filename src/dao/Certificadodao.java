package dao;

import java.sql.SQLException;

import conexao.Conecta;
import dados.Certificado;

public class Certificadodao extends Conecta {


	public void gravar(Certificado c) throws Exception {

		try {

			stm = con.prepareStatement("insert into certificado(id_evento, id_cursista, data_cert)values(?,?,?)");

			
			stm.setInt(1, c.getId_evento());
			stm.setInt(2, c.getId_cursista());
			stm.setString(3, c.getData_cert());
			stm.execute();
			stm.close();
			con.close();
		} catch (SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro" + erroSQL);
		}

	}

	public void atualizar(Certificado c) {

		try

		{

			stm = con.prepareStatement("update certificado set id_evento=?, id_cursista=? , data_cert where id_certificado=?");

			stm.setInt(2, c.getId_evento());
			stm.setInt(3, c.getId_cursista());
			stm.setString(4, c.getData_cert());
			stm.setInt(5, c.getId_certificado());
			stm.executeUpdate();
			stm.close();
			con.close();
		} catch (SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro" + erroSQL);
		}

	}

	public void delete(Certificado c) {

		try

		{

			stm = con.prepareStatement("delete from certificado where id_certificado=?");
			stm.setInt(1, c.getId_certificado());
			stm.executeUpdate();
			stm.close();
			con.close();
		} catch (SQLException erroSQL) /* erro no banco de dados */
		{
			System.out.println("Erro de conexão com o banco de dados , erro" + erroSQL);
		}

	}

}
