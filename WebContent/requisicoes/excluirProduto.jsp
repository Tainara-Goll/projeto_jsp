<%@page import="dao.ProdutoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    
    <% 
    
    //Obter o idProduto
    int idProduto = Integer.parseInt(request.getParameter("idProduto"));
    
	//Excluir Produto
	if(ProdutoDao.excluir(idProduto) == true){
		response.sendRedirect("../admin/produtos.jsp?mensagem=produtoExcluido");
	}else{
		response.sendRedirect("../admin/produtos.jsp?mensagem=produtoExcluidoFalha");
	}
    
    %>