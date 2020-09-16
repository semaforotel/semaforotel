<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
  <title>Projeto Saphira 2.0</title>
  <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />

  <!-- **** Layout Stylesheet **** -->
  <link rel="stylesheet" type="text/css" href="style/style.css" />

  <!-- **** Colour Scheme Stylesheet **** -->
  <link rel="stylesheet" type="text/css" href="style/colour.css" />

  <script language="JavaScript" src="scripts/main.js"></script>

</head>

<!-- Imports -->
<%@ page import="java.util.*" %>
<%@ page import="launch.*" %>

<!-- Bean com acesso ah Base de Dados -->
<jsp:useBean id="sbean" class="launch.SBean">
  <jsp:setProperty name="sbean" property="*"/>
</jsp:useBean>

<body>
  <div id="main">
    <div id="links">

      <!-- import header -->

    </div>
 
    <div id="logo"><h1>Projeto Saphira</h1></div>

    <div id="content">
      <div id="column1">
        <div id="menu">
          <h1>Navegação</h1>
          <ul>
            <li><a id="selected" href="index.jsp">Início</a></li>
            <li><a href="page1.html">page 1</a></li>
            <li><a href="page2.html">page 2</a></li>
            <li><a href="page3.html">page 3</a></li>
            <li><a href="contact.html">contato</a></li>
          </ul>
        </div>
        <div class="sidebaritem">
          <h1>Status</h1>
          <!-- **** INSERT NEWS ITEMS HERE **** -->

          <h2>24 de Fevereiro 2018</h2>
          <p>informacao aqui</p>
        </div>
      </div>
      <div id="column2">
        <h1>Portal Saphira</h1> 
        <!-- **** INSERT PAGE CONTENT HERE **** -->
	<br/>
        <h2>Manager</h2>
	<br/>
	<br/>
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
	
       </div> <!-- column2 -->
    </div> <!-- content -->

      <!-- import footer -->

  </div> <!-- main -->
</body>
</html> 
