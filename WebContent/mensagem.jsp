<%  
	
	try{
	//obter a mensagem
	String mensagem = request.getParameter("mensagem");

//Escolha
switch(mensagem){
	case "falhaCriarConta":
		out.print("<div class='alert alert-danger'>Falha ao criar conta, tente novamente.</div>");
	break;
	

	case "falhaLogin":
		out.print("<div class='alert alert-danger'>Falha ao criar conta.</div>");
	break;
	
	case "sessaoExpirada":
		out.print("<div class='alert alert-danger'>Sessão expirada, faça o login novamente.</div>");
		break;
		
	case "usuarioIncorreto":
		out.print("<div class='alert alert-danger'>Usuário ou senha incorretos.</div>");
		break;
		
	case "sair":
		out.print("<div class='alert alert-success'>Você saiu do sistema</div>");
		break;
		
	case "usuarioCriado":
		out.print("<div class='alert alert-success'>Parabéns sua conta foi criada com sucesso!</div>");
		break;
		
		
		case "dadosIncorretos":
			out.print("<div class='alert alert-success'>Ops! Falha ao realizar o login tente novamente!</div>");
			break;
		
		case "produtoCadastrado":
			out.print("<div class='alert alert-success'>Produto cadastrado com sucesso!</div>");
			break;
			
		case "produtoFalha":
			out.print("<div class='alert alert-success'>Falha ao cadastrar produto</div>");
			break;
			
			
		case "produtoExcluido":
			out.print("<div class='alert alert-success'>Produto excluido com sucesso </div>");
			break;
			
			
		case "produtoExcluidoFalha":
			out.print("<div class='alert alert-success'>Falha ao excluir produto</div>");
			break;
		
		case "produtoAlterado":
			out.print("<div class='alert alert-success'>Produto alterado com sucesso</div>");
			break;
		
		case "produtoAlteradoFalha":
			out.print("<div class='alert alert-success'>Falha ao alterar produto</div>");
			break;

}			

	}catch (Exception erro){}

%>