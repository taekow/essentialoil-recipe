package com.codingdojo.project.Services;

import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import com.codingdojo.project.Models.LoginUser;
import com.codingdojo.project.Models.Recipe;
import com.codingdojo.project.Models.User;
import com.codingdojo.project.Repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
//	Validate User for - duplicate email and password mismatch
	public void validate(User newUser, Errors errors) {
		
		// check password match
				if (!newUser.getPassword().equals(newUser.getConfirm())) {
					errors.rejectValue("password", "mismatch", "Password does not match!");
				}
				// check duplicate email
				if (userRepository.findByEmail(newUser.getEmail()) != null) {
					errors.rejectValue("email", "unique", "Email already has registered");
				}
	}
	
	// Hash users password and add to database
	public User registerUser(User newUser) {
		String hasedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hasedPassword);
        userRepository.save(newUser);
        
        return null;
	}
	
	// Find a user by email
	public User findUserByEmail(String email) {
		return userRepository.findByEmail(email);
	}
	
	// Find a user by id
	public User findUserById(Long id) {
		return userRepository.findById(id).orElse(null);
	}
	
	public void favoriteRecipe(User user, Recipe recipe) {
		for (Recipe favoritedRecipe: user.getFavoritedRecipes()) {
			if (favoritedRecipe.getId() == recipe.getId()) {
				// Already favorite
				return;
			}
		}
		
		user.getFavoritedRecipes().add(recipe);
		userRepository.save(user);
	}
	
	public void unfavoriteRecipe(User user, Recipe recipe) {
		List<Recipe> favoritedRecipes = user.getFavoritedRecipes();
		for (int i = 0; i < favoritedRecipes.size(); i++) {
			if (favoritedRecipes.get(i).getId() == recipe.getId()) {
				user.getFavoritedRecipes().remove(i);
				userRepository.save(user);
			}
		}
	}
	
	public List<Long> getFavoritedRecipeIds(User user) {
		List<Long> favoritedRecipeIds = new ArrayList<Long>();
		for (Recipe favoritedRecipe: user.getFavoritedRecipes()) {
			favoritedRecipeIds.add(favoritedRecipe.getId());
		}
		
		return favoritedRecipeIds;
	}
	
	public Boolean isFavoriteRecipe(User user, Recipe recipe) {
		for (Recipe favoritedRecipe: user.getFavoritedRecipes()) {
			if (favoritedRecipe.getId() == recipe.getId()) {
				return true;
			}
		}
		
		return false;
	}
	
	// Authenticate a user
	public boolean authenticateUser(LoginUser newLogin, Errors errors) {
		// Find the user by email
    	User user = userRepository.findByEmail(newLogin.getEmail());
    	if (user == null) {
    		errors.rejectValue("email", "incorrectEmail", "Email not found");
    		
    		return false;
    	} else {
    		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
    		    errors.rejectValue("password", "incorrectPassword	", "Password does not match!");
    		    
    		    return false;
    		}
    		
    		// if user found, check if password match, return true
    		return true;
    	}
	}
}
