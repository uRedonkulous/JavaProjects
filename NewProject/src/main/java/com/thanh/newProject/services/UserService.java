package com.thanh.newProject.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.thanh.newProject.models.User;
import com.thanh.newProject.models.Login;
import com.thanh.newProject.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;
	
	public User register(User newUser, BindingResult result) {
				Optional<User> validUser = userRepo.findByEmail(newUser.getEmail());
	
	if(validUser.isPresent()) {
		result.rejectValue("email", "Matches", "There is already an account with that email.");
	}
	
	if(!newUser.getPassword().equals(newUser.getConfirm())) {
		result.rejectValue("confirm", "Matches", "Passwords must Match.");
	}
	
	if(result.hasErrors()) {
		return null;
	}
	
	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
	newUser.setPassword(hashed);
	return userRepo.save(newUser);
	}
	
	public User findById(Long id) {
		Optional<User> validUser= userRepo.findById(id);
		if(validUser.isPresent()) {
			return validUser.get();
		}
		return null;
	}
	
	public User login(Login newLogin, BindingResult result) {
		Optional<User> validUser = userRepo.findByEmail(newLogin.getEmail());
		if(!validUser.isPresent()) {
			result.rejectValue("email", "Matches", "User not found.");
			return null;
		}
		User user = validUser.get();
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid Password.");
		}
		if(result.hasErrors()) {
			return null;
		}
		return user;
	}
	
	public User findByEmail(String email) {
		Optional<User> result = userRepo.findByEmail(email);
		if(result.isPresent()) {
			return result.get();
		}
		return null;
	}
	
}