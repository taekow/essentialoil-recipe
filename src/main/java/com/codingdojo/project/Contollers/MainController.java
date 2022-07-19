package com.codingdojo.project.Contollers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.project.Models.LoginUser;
import com.codingdojo.project.Models.Recipe;
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
		session.setAttribute("loggedInUser", newUser);
		
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
		
		User user = (User) session.getAttribute("loggedInUser");

		if(user != null) {
			recipe.addAttribute("recipes", recipeService.findAllRecipe()); 
			recipe.addAttribute("favoritedRecipeIds", userService.getFavoritedRecipeIds(user));
			
			return "dashboard.jsp";
			
		} else {
			
			return "redirect:/";
		}
	}
	
	//******* New Recipe get route ********//
	@GetMapping("/recipes/new")
	public String newRecipe(
			@ModelAttribute("newRecipe") Recipe newRecipe,
			HttpSession session) {
		if(session.getAttribute("loggedInUser") != null) {
				
			return "new.jsp";
		}
		
		return "redirect:/";
	}
	
	
	//******* New Recipe post route ********//
	@PostMapping("/recipes/create")
	public String createRecipe(
			@Valid @ModelAttribute("newRecipe") Recipe newRecipe,
			BindingResult result,
			HttpSession session) {
		if(result.hasErrors()) {
			
			return "new.jsp";
		}
		
		recipeService.newRecipe(newRecipe);
		
		return "redirect:/dashboard";
		
	}
	
	//******* Recipe post route ********//
	@GetMapping("/recipes/details/{id}")
	public String showRecipe(
			@PathVariable("id") Long id,
			Model recipeModel,
			HttpSession session) {
		
		User user = (User) session.getAttribute("loggedInUser");
		
		if(user != null) {
			
			Recipe recipe = recipeService.findById(id);
			recipeModel.addAttribute("recipe", recipe);
			recipeModel.addAttribute("user", userService.findUserByEmail("loggedInUser"));
			recipeModel.addAttribute("isFavoriteRecipe", userService.isFavoriteRecipe(user, recipe));
			
			return "details.jsp";
		}
		
		return "redirect:/";
	}
	
	//******* Edit Recipe get route ********//
	@GetMapping("/recipes/{id}/edit")
	public String editRecipe(
			@PathVariable("id") Long id,
			Model editModel,
			HttpSession session) {
		if(session.getAttribute("loggedInUser") != null) {
			
			Recipe recipe = recipeService.findById(id);
			editModel.addAttribute("recipe", recipe);
			
			return "edit.jsp";
		}
		
		return "redirect:/";
	}
	
	//******* Edit Recipe post route ********//
	@PostMapping("/recipes/{id}")
	public String updateRecipe(
			@Valid
			@ModelAttribute("recipe") Recipe recipe,
			BindingResult result) {
		
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		
		recipeService.updateRecipe(recipe);
		
		return "redirect:/dashboard";
	}
	
	//******* Delete Recipe post route ********//
	@DeleteMapping("/recipes/{id}/delete")
	public String deleteRecipe(
			@PathVariable("id") Long id,
			HttpSession session) {
		recipeService.findById(id);
		
		if(session.getAttribute("loggedInUser") != null) {
			recipeService.deleteRecipe(id);
			
			return "redirect:/dashboard";
		}
		
		return "redirect:/"; 
		
	}
	
	//******* Favorites get route ********//
	@GetMapping("/favorites")
	public String favorites(
			Model favorites,
			HttpSession session) {

		if(session.getAttribute("loggedInUser") != null) {
			
			return "favorites.jsp";
			
		} else {
			
			return "redirect:/";
		}
	}
	
	//******* Favorite Recipe post route ********//
	@PostMapping("/recipes/{id}/favorite")
	public String favoriteRecipe(
			@PathVariable("id") Long id,
			@RequestParam("redirectRoute") String redirectRoute,
			HttpSession session) {
		Recipe recipe = recipeService.findById(id);
		User user = (User) session.getAttribute("loggedInUser");
		
		if(user != null) {
			userService.favoriteRecipe(user, recipe);
			
			return "redirect:" + redirectRoute;
		}
		
		return "redirect:/";
	}
	
	@PostMapping("/recipes/{id}/unfavorite")
	public String unfavoriteRecipe(
			@PathVariable("id") Long id,
			@RequestParam("redirectRoute") String redirectRoute,
			HttpSession session) {
		Recipe recipe = recipeService.findById(id);
		User user = (User) session.getAttribute("loggedInUser");
		
		if(user != null) {
			userService.unfavoriteRecipe(user, recipe);
			
			return "redirect:" + redirectRoute;
		}
		
		return "redirect:/";
	}
}
