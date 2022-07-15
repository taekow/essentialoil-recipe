package com.codingdojo.project.Models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="favorites")
public class Favorite {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User favoritedBy;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "name_id")
	private Recipe addedFavorite;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public User getFavoritedBy() {
		return favoritedBy;
	}

	public void setFavoritedBy(User favoritedBy) {
		this.favoritedBy = favoritedBy;
	}

	public Recipe getAddedFavorite() {
		return addedFavorite;
	}

	public void setAddedFavorite(Recipe addedFavorite) {
		this.addedFavorite = addedFavorite;
	}
}
