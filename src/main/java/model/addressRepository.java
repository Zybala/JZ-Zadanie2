package model;

import model.addressModel;
import java.util.HashMap;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class addressRepository {
    
    HashMap<String, addressModel> addressRepository;
    ServletContext context;
    
    public addressRepository(HttpServletRequest request){
        this.context = request.getServletContext();
        
        if (context.getAttribute("addressRepository") != null) {
            this.addressRepository = (HashMap<String, addressModel>) context.getAttribute("addressRepository");
        }
        else {
            this.addressRepository = new HashMap<String, addressModel>();
        }
    }
    
    public void addAddress(String username, String addressType, addressModel address){ 
        String addressId = username + "_" + addressType;
        this.addressRepository.put(addressId, address);
        
        this.context.setAttribute("addressRepository", this.addressRepository);
    }
    
    public void setAddress (String username, String addressType, HttpServletRequest request) {
        String addressId = username + "_" + addressType;
        
        addressModel address = this.addressRepository.get(addressId);      
        
        address.setVoivodeship(request.getParameter("voivodeship"));
        address.setCity(request.getParameter("city"));
        address.setPostalCode(request.getParameter("postalCode"));
        address.setStreet(request.getParameter("street"));
        address.setHouseNumber(request.getParameter("houseNumber"));
        
        this.addressRepository.put(addressId, address);
        
        this.context.setAttribute("addressRepository", this.addressRepository);
    }
    
    public void removeAddress(HttpServletRequest request) {
        this.addressRepository.remove(request.getParameter("addressId"));
        
        this.context.setAttribute("addressRepository", this.addressRepository);
    } 
    
    public Boolean containsAddress (String addressId) throws NullPointerException {
        return this.addressRepository.containsKey(addressId);
    }
    
}
