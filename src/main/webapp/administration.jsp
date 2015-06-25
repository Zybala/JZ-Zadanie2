<%@page import="java.util.Map"%>
<%@ page import="model.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    ServletContext context = request.getServletContext();
    HashMap<String, userModel> userRepository = (HashMap<String, userModel>) context.getAttribute("userRepository");
%>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Wybór</title>
<table  align="right" size="5" style="margin-top:15px">
    <p>
                <a href='index.jsp'>Wyloguj</a>
    </p>  
    </table>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Roboto Condensed:light">
    <style>
	      body {
    	    font-family: 'Roboto Condensed', serif;
        	font-size: 20px;
      		}
    </style>
</head>
<body>
	<table width="900px" align="center" style="margin-top:15px">
		<tr>
		<td>

                <div><h1>Dodaj konto premium</h1></div>

                <div><h3>Wybierz użytkownika:</h3>
                <table cellpadding="10px">
                            <%
                                for (Map.Entry<String, userModel> entry : userRepository.entrySet()) {
                                    userModel user = entry.getValue();

                                    if (!user.getPremium()) {
                                        out.println("<tr><td>");
                                        out.println("<b>• Login: </b>" + user.getUsername());
                                        out.println("</td><td><b>Email: </b>" + user.getEmail());
                                        out.println("</td><td><a href='Premium?username=" + user.getUsername() + "&premium=yes'>Dodaj premium</a>");
                                        out.println("</td></tr>");
                                    }
                                }    
                                %>
                    </table>
                </div>
                <div><h3>Lista użytkowników premium:</h3>
                <table cellpadding="10px">
                            <%
                                for (Map.Entry<String, userModel> entry : userRepository.entrySet()) {
                                    userModel user = entry.getValue();

                                    if (user.getPremium()) {
                                        out.println("<tr><td>");
                                        out.println("<b>• Login: </b>" + user.getUsername());
                                        out.println("</td><td><b>Email: </b>" + user.getEmail());
                                        out.println("</td><td><a href='Premium?username=" + user.getUsername() + "&premium=no'>Usuń premium</a>");
                                        out.println("</td></tr>");
                                    }
                                }    
                            %>
                </table>
                </div>
                    
            <p>
                <a href='main_menu.jsp'>Wróć</a>
            </p>        
                    
		</td>
		</tr>
	</table>
</body>
</html>
                
                
                
                