<%@page import="dao.UsuarioDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
   <%
   try{
   
	   //obter dados
	   String email = request.getParameter("email");
	   String senha = request.getParameter("senha");
	   
	   //validação
	   if(email.length() <5 || email.indexOf("@") ==-1 || email.indexOf(".")== -1){
			response.sendRedirect("../index.jsp?mensagem=falhaLogin");
	   }else if(senha.length()== 0){
		   response.sendRedirect("../index.jsp?mensagem=falhaLogin");
	   }else{
		   int contador = UsuarioDao.verificarUsuario(email, senha);
		   
		   if(contador == 0){
			   response.sendRedirect("..//index.jsp?mensagem=dadosIncorretos");
		   }else{
			   session.setAttribute("sessao_usuario", UsuarioDao.objUsuario(email, senha));
			   response.sendRedirect("../admin/index.jsp");
		   }
	   }
   		
	  
   
   
   }catch(Exception erro){}
   %>