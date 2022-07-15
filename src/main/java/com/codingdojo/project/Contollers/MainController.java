package com.codingdojo.project.Contollers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codingdojo.project.Models.LoginUser;
import com.codingdojo.project.Models.User;
import com.codingdojo.project.Services.RecipeService;
import com.codingdojo.project.Services.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RecipeService recipeService;
	
	//******* Register post route ********//
	// Register login page
	@GetMapping("/")
	public String index(
			@ModelAttribute("newUser") User newUser,
			@ModelAttribute("newLogin") LoginUser lgoinUser) {
		
		return "index.jsp";
	} 
	
	@PostMapping("/register")
	public String register(
			@Valid
			@ModelAttribute("newUser") User newUser,
			BindingResult result,
			HttpSession session,
			@ModelAttribute("newLogin") LoginUser loginUser) {
			
		//Validate a user
		userService.validate(newUser, result);
		if(result.hasErrors()) {
			
			return "index.jsp";
		}
		
		// Register a user
		userService.registerUser(newUser);
		// Put a user in Session
		session.setAttribute("", newUser);
		
		return "redirect:/dashboard";
	}
	
	@PostMapping("/login")
	public String login(
			@Valid
			@ModelAttribute("newLogin") LoginUser loginUser,
			BindingResult result,
			HttpSession session,
			@ModelAttribute("newUser") User newUser) {
		// Authenticate a user
		userService.authenticateUser(loginUser, result);
		if (result.hasErrors()) {
			
			return "index.jsp";
		}
		
		User loggedInUser = userService.findUserByEmail(loginUser.getEmail());
		
		// Put a user in session
		session.setAttribute("loggedInUser", loggedInUser);
		
		return "redirect:/dashboard";
	}
	
	//******* Logout get route ********//
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	//******* Dashboard get route ********//
	@GetMapping("/dashboard")
	public String dashboard(
			Model recipe,
			HttpSession session) {

		if(session.getAttribute("loggedInUser") != null) {
			recipe.addAttribute("recipe", recipeService.findAllRecipe()); 
			
			return "dashboard.jsp";
			
		} else {
			
			return "redirect:/";
		}
	}
	
}
