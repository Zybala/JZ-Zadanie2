package controller;

import model.*;
import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class LoginController {    
    
    public LoginController () {
        
    }    
    
    public void loginUser(HttpServletRequest request) {
        ServletContext context = request.getServletContext();
        HashMap<String, userModel> userRepository = (HashMap<String, userModel>) context.getAttribute("userRepository");
        userModel user = userRepository.get(request.getParameter("username"));
        
        user.addUserToSession(request);
    }
    
}
