package controller;

import javax.servlet.ServletRequest;
import model.credentialsRepository;

public class AuthenticationController {
    
    public AuthenticationController() {
        
    }
    
    public void storeCredentials(String username, String password, ServletRequest request) {
        credentialsRepository credentialsRepository = new credentialsRepository(request);
        
        credentialsRepository.addCredentials(username, password);     
    }
    
    public boolean authenticateUser(ServletRequest request, String username, String password) {
        credentialsRepository credentialsRepository = new credentialsRepository(request);
       
        return credentialsRepository.validateUser(username, password);
    }
    
    public boolean usernameFree(ServletRequest request, String username) {
        credentialsRepository credentialsRepository = new credentialsRepository(request);
        
        return credentialsRepository.checkIfUserExists(username);
    }
    
}
