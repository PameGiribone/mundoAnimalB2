package com.backend.mundoAnimal.config;

import com.backend.mundoAnimal.entity.Usuario;
import com.backend.mundoAnimal.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class AppConfig {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Bean
    public ApplicationRunner initializer() {
        return args -> {
            if (usuarioRepository.findByEmail("admin@example.com") == null) {
                Usuario admin = new Usuario();
                admin.setEmail("admin@example.com");
                admin.setPassword(passwordEncoder.encode("adminpassword"));
                admin.setRole("ROLE_ADMIN");
                usuarioRepository.save(admin);
            }
        };
    }
}