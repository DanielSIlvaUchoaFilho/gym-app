package com.Daniel.sPortfolio.GymApp.repository;

import com.Daniel.sPortfolio.GymApp.entity.Exercise;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExerciseRepository extends JpaRepository<Exercise, Long> {

}