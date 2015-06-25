package servlets;

import controller.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Premium extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    PremiumController premium = new PremiumController();    
    
    public Premium() {
        super();        
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        premium.changePremium(request);
        response.sendRedirect("administration.jsp");
    }
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {        
       
    }
    
}
