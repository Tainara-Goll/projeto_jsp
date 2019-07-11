package conexao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	
	//Atributo de conexão
	public static Connection conexao;
	
	//Iniciar a conexão
	public static void obterConexao() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexao = DriverManager.getConnection("jdbc:mysql://localhost/projeto01", "root", "");
		}catch(Exception erro) {
			System.out.println("Falha ao conectar "+erro.getMessage());
		}
		
	}
	
	//Finalizar a conexão
	public static void finalizarConexao() {
		
		try {
			conexao.close();
		}catch(Exception erro) {}
			
		
	}




}
