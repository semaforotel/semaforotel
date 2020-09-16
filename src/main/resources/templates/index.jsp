
<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/favicon.ico">

    <title>Projeto Saphira</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/assets/js/ie-emulation-modes-warning.js"></script>
   
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
  </head>


<!-- Imports -->
<%@ page import="java.util.*" %>
<%@ page import="launch.*" %>

<!-- Bean com acesso ah Base de Dados -->
<jsp:useBean id="sbean" class="launch.SBean">
  <jsp:setProperty name="sbean" property="*"/>
</jsp:useBean>
  
  <body>

  <div class="container">

      	<table id="hor-zebra">
	  <thead>
    	    <tr>
    	    <%
    	        int i = 0;
	        while ( i < Constantes.colunasRecursos.length ){
    	    %>
    	           <th scope="col"><%= Constantes.colunasRecursos[i++] %></th>
            <%
	        }//fim while
            %>
            </tr>
	  </thead>
	  
	  <tbody>
	  <%
	     //Recupera a lista de recursos	  	
	  	 ArrayList itens = sbean.getRecursos();
	    %>      	  
	  </tbody>	  
	</table>
    
    <form class="form-signin" action="login" method="post" onsubmit="return validate()">
      <!-- -->      
      <header class="header">
	<div id="cabecalho" class="container">
	  <p class="text-muted">v2.0.1</p>
	</div>
      </header>
      <!-- -->            
      <img width="100%" src="biodelta_logo.png"/>
      <h2 class="form-signin-heading">Acesso ao Sistema</h2>
      <label for="email" class="sr-only">E-mail</label>
      <input type="email" id="email" name="email" class="form-control" placeholder="E-mail" required autofocus>
      <label for="senha" class="sr-only">Senha</label>
      <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha" required>
      <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me">Lembrar-me
          </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
      <!--
      <form method="post" class="navbar-form navbar-right">
	<button formaction="importar" class="btn btn-lg btn-primary btn-block" type="submit">Importar Avaliacao</button>
      </form>
     <form method="post" class="navbar-form navbar-right">
	<button formaction="importar2" class="btn btn-lg btn-primary btn-block" type="submit">Importar Goniometria</button>
     </form>
     <form method="post" class="navbar-form navbar-right">
       <button formaction="importar3" class="btn btn-lg btn-primary btn-block" type="submit">Importar Preensao</button>
     </form>
      <form method="post" class="navbar-form navbar-right">
	-->
      <!--
       <button formaction="importar4" class="btn btn-lg btn-primary btn-block" type="submit">Importar Composição</button>
      </form>
      <form method="post" class="navbar-form navbar-right">
       <button formaction="excluirbase4" class="btn btn-lg btn-primary btn-block" type="submit">Remover Composição</button>
     </form>
   -->
      <!-- -->
      <br/>
      <br/>

      <br/>
      <br/>
      <!-- -->      
      <footer class="footer">
	<div id="rodape" class="container">
	  <p class="text-muted">&copy; Instituto Biodelta - 2018</p>
	</div>
      </footer>
      <!-- -->      
    </form>
    
  </div> <!-- /container -->    

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="/assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/assets/js/ie10-viewport-bug-workaround.js"></script>
  
  </body>
</html>
