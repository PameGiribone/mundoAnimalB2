package com.backend.mundoAnimal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.backend.mundoAnimal.entity.Categoria;

public interface  CategoriaRepository extends JpaRepository<Categoria, Long> {
    
}
