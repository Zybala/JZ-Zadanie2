package controller;

import model.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class RegistrationController {
        
    public RegistrationController(){
		
    }
	
    public void registerNewUser(HttpServletRequest request) {
        userModel user  = new userModel(request.getParameter("name"),request.getParameter("username"), request.getParameter("email"), request.getParameter("role"));
        userRepository repository = new userRepository(request);
        credentialsRepository credentials = new credentialsRepository(request);
        
        repository.addUser(user.getUsername(), user, request);
        
        user.addUserToSession(request);
        
        credentials.addCredentials(request.getParameter("username"), request.getParameter("password"));       
    }
    
    public void registerNewAddress (HttpServletRequest request) {
        addressModel address = new addressModel(request.getParameter("addressType"), request.getParameter("voivodeship"), request.getParameter("city"), request.getParameter("postalCode"), request.getParameter("street"), request.getParameter("houseNumber"));
        addressRepository repository = new addressRepository(request);
        
        HttpSession session = request.getSession();
        
        repository.addAddress((String) session.getAttribute("username"), request.getParameter("addressType"), address);    
    }    
    
    public void changeAddress (HttpServletRequest request) {
        HttpSession session = request.getSession();
        addressRepository repository = new addressRepository(request);
        
        String username = (String) session.getAttribute("username");
        String addressType = request.getParameter("addressType").trim();               
        
        repository.setAddress(username, addressType, request);
    }
    
    public void deleteAddress (HttpServletRequest request) {
        addressRepository repository = new addressRepository(request);
        
        repository.removeAddress(request);
    }
	
}
