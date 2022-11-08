package com.securityapp.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.securityapp.models.LoginUser;
import com.securityapp.models.User;
import com.securityapp.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository userRepository;
	
    public List<User> allUsers() {
        return userRepository.findAll();
    }
    
    public User findUser(Long id) {
		return userRepository.findById(id).orElse(null);
    }
    
    public User createUser(User item) {
        return userRepository.save(item);
    }
    
    public User updateUser(User item) {
        return userRepository.save(item);
    }
    
    public void deleteUser(Long id) {
    	userRepository.deleteById(id);
    }
    
    public User register(User newUser, BindingResult result) {
    	Optional<User> potentialUser = userRepository.findByEmail(newUser.getEmail());
    	
    	if(potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "An account with that email already exists!");
    	}
    	
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    		result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
    	}
    	
    	if(result.hasErrors()) {
    		return null;
    	}	
    
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
    	return userRepository.save(newUser);
    }
    
    public User login(LoginUser newLoginObject, BindingResult result) {
    	Optional<User> potentialUser = userRepository.findByEmail(newLoginObject.getEmail());
        
    	if(!potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "User not found!");
    		return null;
    	}
    	
    	User user = potentialUser.get();
        
    	if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	
    	if(result.hasErrors()) {
    		return null;
    	}
    	
        return user;
    }
}
