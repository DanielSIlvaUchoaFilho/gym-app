package com.Daniel.sPortfolio.GymApp.repository;

import com.Daniel.sPortfolio.GymApp.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {

}