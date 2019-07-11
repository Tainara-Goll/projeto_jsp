package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.sun.net.httpserver.Authenticator.Result;

import beans.Produto;
import conexao.Conexao;

public class ProdutoDao {

	
	//Cadastro
	public static boolean cadastrar(String produto, double valor) {
		
		
		//SQL
		String sql = "INSERT INTO produtos(nomeProduto, valorProduto) VALUES (?,?)";
		
		//Validar
		boolean valida = false;
		
		//Conexão
		Conexao.obterConexao();
		
		//Tentativa
		try {
			PreparedStatement pstmt = Conexao.conexao.prepareStatement(sql);
			pstmt.setString(1, produto);
			pstmt.setDouble(2, valor);
			pstmt.execute();
			pstmt.close();
			
			valida = true;
		}catch(Exception erro){
			System.out.println("Falha ao cadastrar o produto "+erro.getMessage());
		}finally {
			Conexao.finalizarConexao();
		}
		
		//Retorno
		return valida;
	}

	//Seleção
	public static String selecionar() {
		
	//Estrutura
		String estrutura= "";
		
	//SQL
		String sql = "SELECT * FROM produtos";
		
		//Conexao
		Conexao.obterConexao();
		
		//Tentativa
		try {
			
			Statement stmt = Conexao.conexao.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				estrutura += "<tr>";
					estrutura += "<td> "+rs.getInt(1)+" </td>";
					estrutura += "<td> "+rs.getString(2)+" </td>";
					estrutura += "<td> "+rs.getDouble(3)+" </td>";
					estrutura += "<td><a href= 'produtos.jsp?idProduto="+rs.getInt(1)+"' class='btn btn-warning'>Alterar</button></td>";
					estrutura += "<td><a href='../requisicoes/excluirProduto.jsp?idProduto="+rs.getInt(1)+"' class='btn btn-danger'>Excluir</a></td>";
				estrutura += "</tr>";
			}
		
		}catch(Exception erro) {
			System.out.println("Falha ao listar produtos "+erro.getMessage());
		}finally {
			
		}
	
	
	//Retorno
	return estrutura;
	
	
	
	}
	
	
	//Exclusão
	public static boolean excluir(int idProduto) {
		
		
	//SQL
		String sql = "DELETE FROM produtos WHERE idProduto = ?";
		
	//Conexao
		Conexao.obterConexao();
		
	//Valida
		boolean valida = false;
		
	//Tentativa
		try {
			PreparedStatement pstmt= Conexao.conexao.prepareStatement(sql);
			pstmt.setInt(1, idProduto);
			pstmt.execute();
			pstmt.close();
			
			valida = false;
		}catch(Exception erro) {
			System.out.println("Falha ao excluir o produto "+ erro.getMessage());
		}finally {
			Conexao.finalizarConexao();
		}
		
	//Retorno
		return valida;

	}

	//Obter dado de um produto específico
	public static Produto selecionarProduto (int idProduto) {
		
		//objeto da classe produto (Bean)
		Produto prod = new Produto();
		
		
		//SQL
		String sql = "SELECT * FROM produtos WHERE idProduto = ?";
		
		//Conexão
		Conexao.obterConexao();
		
		//Tentativa
		try {
			PreparedStatement pstmt = Conexao.conexao.prepareStatement(sql);
			pstmt.setInt(1, idProduto);
			
			ResultSet rs = pstmt.executeQuery();
			rs.last();
			
			prod.setIdProduto(rs.getInt(1));
			prod.setNomeProduto(rs.getString(2));
			prod.setValorproduto(rs.getDouble(3));
			
			pstmt.close();
			rs.close();
		}catch(Exception erro) {
			System.out.println("Falha ao obtter o produto "+erro.getMessage());
		}finally{
			Conexao.finalizarConexao();
		}
	
		//Retorno
		return prod;
	
	
	}

	
	//Alterar
	public static boolean alterar(int idProduto, String nomeProduto, double valorProduto) {
		
		
		//Valida
		boolean valida = false;
		
		//SQL
		String sql = "UPDATE produtos SET nomeProduto=?, valorProduto=? WHERE idProduto=?";
		
		//Conexão
		Conexao.obterConexao();
		
		//Tentativa
		try {
			PreparedStatement pstmt =Conexao.conexao.prepareStatement(sql);
			pstmt.setString(1, nomeProduto);
			pstmt.setDouble(2, valorProduto);
			pstmt.setInt(3, idProduto);
			pstmt.execute();
			pstmt.close();
			
			valida = true;
		}catch(Exception erro) {
			System.out.println("Falha ao alterar o produto "+erro.getMessage());
		}finally{
			Conexao.finalizarConexao();
		}
		
		//Retorno
		return valida;
	}



}
