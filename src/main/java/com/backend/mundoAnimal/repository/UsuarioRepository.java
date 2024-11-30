package com.backend.mundoAnimal.repository;

import com.backend.mundoAnimal.entity.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    Usuario findByEmail(String email);   

    
}
