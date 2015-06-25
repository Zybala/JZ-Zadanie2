<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%    
    if ((Boolean) userSession.getAttribute("premium")) {
        out.println("<div style='margin-top: 50px'>");
        out.println("<p><h2>Witamy w gronie użytkowników premium</h2></p>");
        out.println("<img src='http://s3.amazonaws.com/rapgenius/pic12164.jpg'>");
        out.println("</div>");
    }

%>
