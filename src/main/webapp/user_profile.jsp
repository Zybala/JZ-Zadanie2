<%@ page import="java.util.Map"%>
<%@ page import="model.*"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="javax.servlet.ServletContext" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
  HttpSession userSession = request.getSession();
  ServletContext context = request.getServletContext();
  HashMap<String, addressModel> addressMap = (HashMap<String, addressModel>) context.getAttribute("addressRepository");
  addressRepository addressRepository = new addressRepository(request);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Witam</title>
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Roboto Condensed:light">
    <style>
	      body {
    	    font-family: 'Roboto Condensed', serif;
        	font-size: 20px;
      		}
    </style>
</head>
<body>
    <table  align="right" size="5" style="margin-top:15px">
    <p>
                <a href='index.jsp'>Wyloguj</a>
    </p>  
    </table>
	<table width="900px" align="center" style="margin-top:15px">
		<tr>
		<td>

                    <div><h1> Witam użytkowniku <%out.println(userSession.getAttribute("name"));%></h1></div>

                    <p>                        
                        <table cellpadding="5px">
                            <tr>
                            <td><b>Twój login to: </b><%out.println(userSession.getAttribute("username"));%></td>
                            </tr>
                            <td><b>Twój email to: </b><%out.println(userSession.getAttribute("email"));%></td>
                            </tr>
                            <td><b>
                                <% if ((Boolean) userSession.getAttribute("premium")) {
                                    out.println("Jesteś zalogowany jako Użytkownik Premium");
                                }
                                else {
                                    out.println("Jesteś zalogowany jako Standardowy Użytkownik");
                                }%></b>
                            </td>
                        </table>
                            <div><h4><a href='address_form.jsp'>Dodaj adres</a></h4></div>    
                    </p>
                    
                    <p>        
                        
                        <% if (addressRepository.containsAddress(userSession.getAttribute("username") + "_mailing")) {
                            addressModel address = addressMap.get(userSession.getAttribute("username") + "_mailing");
                            out.println("<table cellpadding='5px'>");
                            out.println("<tr><td><h3>Twój adres zamieszkania</h3></td>");
                            out.println("<td><h6><a href='address_edit.jsp?addressType=work'>Zmień adres</a></h6></td>");
                            out.println("<td><h6><a href='RegisterAddress?addressId=" + userSession.getAttribute("username") + "_work&action=delete'>Usuń adres</a></h6></td></tr></table>");
                            out.println("<table cellpadding='5px'>");     
                            out.println("<tr><td><h3>Twój adres zamieszkania</h3><h5><a href='RegisterAddress?addressId=" + userSession.getAttribute("username") + "_work&action=delete'>Usuń adres</a></h5></td></tr>");
                            out.println("<tr><td><b>Województwo: </b>" + address.getVoivodeship() + "</td></tr>");
                            out.println("<tr><td><b>Misto: </b>" + address.getCity() + "</td></tr>");
                            out.println("<tr><td><b>Kod pocztowy: </b>" + address.getPostalCode() + "</td></tr>");
                            out.println("<tr><td><b>Ulica: </b>" + address.getStreet() + "</td></tr>");
                            out.println("<tr><td><b>Numer mieszkania: </b>" + address.getHouseNumber() + "</td></tr>");
                            out.println("</table>");  
                        }%>                   
                    </p>
                    
                    <p>                                          
                        <% if (addressRepository.containsAddress(userSession.getAttribute("username") + "_work")) {
                            addressModel address = addressMap.get(userSession.getAttribute("username") + "_work");
                            out.println("<table cellpadding='5px'>");
                            out.println("<tr><td><h3>Twój adres zatrudnienia</h3></td>");
                            out.println("<td><h6><a href='address_edit.jsp?addressType=work'>Zmień adres</a></h6></td>");
                            out.println("<td><h6><a href='RegisterAddress?addressId=" + userSession.getAttribute("username") + "_work&action=delete'>Usuń adres</a></h6></td></tr></table>");
                            out.println("<table cellpadding='5px'>");     
                            out.println("<tr><td><h3>Twój adres zatrudnienia</h3><h5><a href='RegisterAddress?addressId=" + userSession.getAttribute("username") + "_work&action=delete'>Usuń adres</a></h5></td></tr>");
                            out.println("<tr><td><b>Województwo: </b>" + address.getVoivodeship() + "</td></tr>");
                            out.println("<tr><td><b>Misto: </b>" + address.getCity() + "</td></tr>");
                            out.println("<tr><td><b>Kod pocztowy: </b>" + address.getPostalCode() + "</td></tr>");
                            out.println("<tr><td><b>Ulica: </b>" + address.getStreet() + "</td></tr>");
                            out.println("<tr><td><b>Numer mieszkania: </b>" + address.getHouseNumber() + "</td></tr>");
                            out.println("</table>"); 
                        }%>                   
                    </p>
                            
                    <p>
                        <a href='main_menu.jsp'>Wróć</a>
                    </p>

		</td>
		</tr>
	</table>
</body>
</html>