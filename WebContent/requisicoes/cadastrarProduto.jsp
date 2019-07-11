<%@page import="dao.ProdutoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	
	//Obter o produto e o  valor
	String produto = request.getParameter("produto");
	double valor = Double.parseDouble(request.getParameter("valor"));
	
	out.print(produto+"<br>"+valor);
	
	//Executar a ação de cadastro
	if(ProdutoDao.cadastrar(produto, valor) == true){
		response.sendRedirect("../admin/produtos.jsp?mensagem=produtoCadastrado");
	}else{
		response.sendRedirect("../admin/produtos.jsp?mensagem=produtoFalha");
		
	}


%>