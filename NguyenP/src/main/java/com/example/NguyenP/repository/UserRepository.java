package com.example.NguyenP.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.NguyenP.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

}
