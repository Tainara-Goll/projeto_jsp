<%

	//Remover sessão
	session.removeAttribute("sessao_usuario");	
	
	
	//Redirecionar
	response.sendRedirect("../index.jsp?mensagem=sair");

%>