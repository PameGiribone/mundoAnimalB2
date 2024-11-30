package com.backend.mundoAnimal.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

import com.backend.mundoAnimal.entity.Producto;

public interface  ProductoRepository  extends  JpaRepository<Producto, Long> {
    List <Producto> findByNombre(String nombre);
    List<Producto> findByCategoriaId(Long categoriaId);
    List<Producto> findByNombreContainingIgnoreCase(String nombre);
   
    
}