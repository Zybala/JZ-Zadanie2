package model;

import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class userRepository {

    HashMap<String, userModel> userRepository;
    ServletContext context;
	
    public userRepository(HttpServletRequest request){
        this.context = request.getServletContext();
        
        if (context.getAttribute("userRepository") != null) {
            this.userRepository = (HashMap<String, userModel>) context.getAttribute("userRepository");
        }
        else {
            this.userRepository = new HashMap<String, userModel>();
        }
    }
	
    public void addUser(String username, userModel user, HttpServletRequest request){ 
        this.userRepository.put(username, user);
                
        this.context.setAttribute("userRepository", this.userRepository);
    }		

    public HashMap<String, userModel> getUserRepository() {
	return userRepository;
    }

    public void setUserRepository(HashMap<String, userModel> userRepository) {
	this.userRepository = userRepository;
    }	
	
}
