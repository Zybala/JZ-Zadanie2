<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
    HttpSession userSession = request.getSession();    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Menu</title>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Roboto Condensed:light">
    <table  align="right" size="5" style="margin-top:15px">
    <p>
                <a href='index.jsp'>Wyloguj</a>
    </p>  
    </table>
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

<div>
    <h1>Witam w menu użytkownika</h1>
 </div>                   

<p>
	<table>
		<tr>
		<td><a href='user_profile.jsp'>Profil użytkownika</a></td>
		</tr>
		<td>
                    <% if (userSession.getAttribute("role").equals("admin")) {
                        out.println("<a href='administration.jsp'>Administratorzy</a></td>");
                        }
                    %>
	</table>
</p>
        <%@ include file="premium.jsp"%>
		</td>
		</tr>
	</table>

</body>
</html>