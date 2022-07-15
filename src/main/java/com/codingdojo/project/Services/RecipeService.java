package com.codingdojo.project.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

import com.codingdojo.project.Models.Recipe;
import com.codingdojo.project.Repositories.FavoriteRepository;
import com.codingdojo.project.Repositories.RecipeRepository;

@Service
public class RecipeService {

	@Autowired
	private RecipeRepository recipeRepository;
	
	@Autowired
	private FavoriteRepository favoriteRepository;
	
	// Retrieve all recipe
	public List<Recipe> findAllRecipe() {
		return recipeRepository.findAll();
	}
	
	// Retrieve recipe by id
	public Recipe findById(Long id) {
		Optional<Recipe> optionalRecipe = recipeRepository.findById(id);
		
		if (optionalRecipe.isPresent()) {
			return optionalRecipe.get();
			
		} else {
			return null;
		}
	}
	
	// Retrieve recipe title
	public Recipe findByName(String name) {
		return recipeRepository.findByName(name);
	}
	
	// Retrieve recipe category
	public Recipe findByCategory(String category) {
		return recipeRepository.findByCategory(category);
	}
	
	// Add a new recipe
	public Recipe newRecipe(Recipe newRecipe) {
		return recipeRepository.save(newRecipe);
	}
	
	// Update existing recipe
	public Recipe updateRecipe(Recipe updateRecipe) {
		return recipeRepository.save(updateRecipe);
	}
	
	// Delete existing recipe
	public void deleteRecipe(Long id) {
		Optional<Recipe> optionalRecipe = recipeRepository.findById(id);
		
		if (optionalRecipe.isPresent())
		recipeRepository.deleteById(id);
	}
	
	// Validation name -- need to unique
	public void validate(Recipe newRecipe, Errors errors) {
		if (recipeRepository.findByName(newRecipe.getName()) != null) {
			errors.rejectValue("title", "unique", "The title already has existed");
		}
	}
}
