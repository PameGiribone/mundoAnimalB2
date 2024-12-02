package com.backend.mundoAnimal.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.backend.mundoAnimal.entity.Usuario;
import com.backend.mundoAnimal.repository.UsuarioRepository;

@Configuration
public class AppConfig {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Bean
    public ApplicationRunner initializer() {
        return args -> {
            if (usuarioRepository.findByEmail("petshopvalu@store.com") == null) {
                Usuario admin = new Usuario();
                admin.setEmail("petshopvalu@store.com");
                admin.setPassword(passwordEncoder.encode("petshopValu24"));
                admin.setRole("ROLE_ADMIN");
                usuarioRepository.save(admin);
            }
        };
    }
}