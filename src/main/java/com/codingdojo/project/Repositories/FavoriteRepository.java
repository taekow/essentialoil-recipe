package com.codingdojo.project.Repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.project.Models.Favorite;

@Repository
public interface FavoriteRepository extends CrudRepository<Favorite, Long>{
	List<Favorite> findAll();

}
