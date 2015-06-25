package servlets;


import controller.*;
import model.*;

import java.util.HashMap;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class TestShowcase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestShowcase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {                
        response.getWriter().println("Hello!");
            
        HttpSession session = request.getSession();
        ServletContext context = request.getServletContext();
        
        credentialsRepository credentials = new credentialsRepository(request);
        System.out.println("Object 'credentials' reference in TestShowcase class is " + Integer.toHexString(System.identityHashCode(credentials)));
            
            //System.out.println("Servlet is called " + getServletName());
            //System.out.println("Username: " + session.getAttribute("username"));
            //System.out.println("Email: " + session.getAttribute("email"));
            //System.out.println("User role: " + session.getAttribute("role"));  
            
        HashMap<String, userModel> userRepository = (HashMap<String, userModel>) context.getAttribute("userRepository");
        userModel user = userRepository.get(session.getAttribute("username"));
            
        response.getWriter().println("User from list is called " + user.getUsername());
        response.getWriter().println("User from POST is called " + request.getParameter("username"));
        response.getWriter().println("User from session is called " + session.getAttribute("username"));
        response.getWriter().println("User role is " + session.getAttribute("role"));
        response.getWriter().println("User is Premium? " + session.getAttribute("premium"));
        response.getWriter().println("Number of users is " + userRepository.size());
                       
        HashMap<String, String> credentialsRepository = (HashMap<String, String>) context.getAttribute("credentialsRepository");
        
        response.getWriter().println("Size of credentialsRepository is " + credentialsRepository.size());
                
        response.getWriter().println(credentials.checkIfUserExists((String) session.getAttribute("username")));
        response.getWriter().println(credentialsRepository.containsKey(session.getAttribute("username")));
        
               
        if (credentialsRepository.containsKey(session.getAttribute("username"))) {
            response.getWriter().println("if equals true");
        }
        else {
            response.getWriter().println("if equals false");
        }
               
        HashMap<String, addressModel> addressRepository = (HashMap<String, addressModel>) context.getAttribute("addressRepository");
        addressModel registered_address = addressRepository.get(session.getAttribute("username") + "_registered");
        
        response.getWriter().println(registered_address.getCity());        
        response.getWriter().println(addressRepository.keySet());
        
        
        
        
        
        
        
        
        
        }
        
   
        
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	               
		
	}

}
