<%@page import="dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    try{
    	
    	//Obter os dados
    	String nome = request.getParameter("nome");
    	String email = request.getParameter("email");
    	String senha1 = request.getParameter("senha1");
    	String senha2 = request.getParameter("senha2");
    
    	//Validar
    	if(nome.length() < 3){
    		response.sendRedirect("../index.jsp?mensagem=falhaCriarConta");
    	}else if(email.length() <5 || email.indexOf("@") ==-1 || email.indexOf(".")== -1){
    		response.sendRedirect("../index.jsp?mensagem=falhaCriarConta");
    		
    	}else if(senha1.length() == 0 || senha2.length() == 0){
    		response.sendRedirect("../index.jsp?mensagem=falhaCriarConta");
    	}else if(!senha1.equals(senha2)){
    		response.sendRedirect("../index.jsp?mensagem=falhaCriarConta");
    	}else{
    	
    	//Realizar o cadastramento
    	boolean valida = UsuarioDao.cadastrar(nome, email, senha1);
    	
    	if(valida == true){
    		response.sendRedirect("../index.jsp?mensagem=usuarioCriado");
    	}else{
    		response.sendRedirect("../index.jsp?mensagem=falhaCriarConta");
    	}
    	}
    	
    }catch(Exception erro){}
    	
    
    %>
    
    
    