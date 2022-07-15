package com.codingdojo.project.Repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.project.Models.Recipe;

@Repository
public interface RecipeRepository extends CrudRepository<Recipe, Long>{
	
	List<Recipe> findAll();
	
	Recipe findByName(String name);
	
	Recipe findByCategory(String category);
	
	Optional<Recipe> findById(Long id);

}
