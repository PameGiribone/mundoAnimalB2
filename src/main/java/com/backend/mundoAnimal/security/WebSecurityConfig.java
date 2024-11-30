package com.backend.mundoAnimal.security;

import org.springframework.context.annotation.Bean;
import static org.springframework.security.config.Customizer.withDefaults;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

public class WebSecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeRequests(authorizeRequests -> authorizeRequests
                .anyRequest().permitAll()
            )
            .formLogin(withDefaults())
            .logout(withDefaults())
            .requiresChannel(requiresChannel -> requiresChannel
                .anyRequest().requiresSecure()
            )
            .csrf(csrf -> csrf.disable()); // Deshabilitar CSRF para simplificar
        return http.build();
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring().requestMatchers("/ignore1", "/ignore2");
    }
}