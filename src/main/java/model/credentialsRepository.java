package model;

import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;

public class credentialsRepository {
   
    HashMap<String, String> credentialsRepository;
    ServletContext context;
    
    public credentialsRepository(ServletRequest request) {
        this.context = request.getServletContext();
        
        if (context.getAttribute("credentialsRepository") != null) {
            this.credentialsRepository = (HashMap<String, String>) context.getAttribute("credentialsRepository");
        }
        else {
            this.credentialsRepository = new HashMap<String, String>();
        }
    }    
    
    public void addCredentials(String username, String password) {
        this.credentialsRepository.put(username, password);
        
        this.context.setAttribute("credentialsRepository", this.credentialsRepository);
    }    
    
    public Boolean validateUser(String username, String password) {     
        String validation = this.credentialsRepository.get(username);       
        
        if (validation.equals(password)) {
            return true;
        }
        else {
            return false;
        }
    }    
    
    public Boolean checkIfUserExists(String username) {
        if (this.credentialsRepository.containsKey(username)) {
            return false;
        }
        else {
            return true;
        }
    }   
    
}
