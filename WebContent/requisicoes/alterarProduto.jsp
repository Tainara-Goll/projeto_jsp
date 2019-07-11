<%@page import="dao.ProdutoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	//Obter os dados para alterar o produto
	int idProduto = Integer.parseInt(request.getParameter("id"));
	String nomeProduto = request.getParameter("produto");
	double valorProduto = Double.parseDouble(request.getParameter("valor"));

	//Executar o método de alteração de produto
	if(ProdutoDao.alterar(idProduto, nomeProduto, valorProduto)== true){
		response.sendRedirect("../admin/produtos.jsp?mensagem=produtoAlterado");
	}else{
		response.sendRedirect(". ./admin/produtos.jsp?mensagem=produtoAlterado");
	}
	//Exibir
	out.print(idProduto+"<br>");
	out.print(nomeProduto+"<br>");
	out.print(valorProduto);
%>