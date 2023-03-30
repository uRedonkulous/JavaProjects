package com.thanh.newProject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.thanh.newProject.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
		List<User> findAll();
		Optional<User> findByEmail(String email);
	}
