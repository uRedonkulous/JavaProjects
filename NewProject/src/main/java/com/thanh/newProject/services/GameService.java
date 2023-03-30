package com.thanh.newProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thanh.newProject.models.Game;
import com.thanh.newProject.repositories.GameRepository;

@Service
public class GameService {
	
	@Autowired
	private GameRepository repo;
	
	public Game findById(Long id) {
		Optional<Game> result = repo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	
	public List<Game> all() {
		return repo.findAll();
	}
	
	public Game update(Game team) {
		return repo.save(team);
	}
	
	public Game create(Game team) {
		return repo.save(team);
	}
	
	public void delete(Long id) {
		repo.deleteById(id);
	}
}
