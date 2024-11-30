package com.backend.mundoAnimal.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.backend.mundoAnimal.entity.Usuario;
import com.backend.mundoAnimal.repository.UsuarioRepository;

@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public List<Usuario> listarUsuarios() {
        return usuarioRepository.findAll();
    }

    // public Usuario cambiarContraseña(Long id, String nuevaContraseña) {
    //     Usuario usuario = usuarioRepository.findById(id).orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
    //     usuario.setPassword(passwordEncoder.encode(nuevaContraseña));
    //     return usuarioRepository.save(usuario);
    // }

    public boolean cambiarContraseña(Long id, String contraseñaAnterior, String nuevaContraseña) { 
        Usuario usuario = usuarioRepository.findById(id) 
            .orElseThrow(() -> new RuntimeException("Usuario no encontrado")); 
            // Comparar la contraseña anterior encriptada con la ingresada 
            if (passwordEncoder.matches(contraseñaAnterior, usuario.getPassword())) { 
                // Encriptar y guardar la nueva contraseña 
                usuario.setPassword(passwordEncoder.encode(nuevaContraseña));
                 usuarioRepository.save(usuario); return true; 
                } else { 
                    return false; 
                }
             }
   
   
   
   
   
    public Usuario listarUsuarioPorId(Long id) {
        return usuarioRepository.findById(id).orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
    }

    public Usuario findByEmail(String email) {
        return usuarioRepository.findByEmail(email);
    }

    public void eliminarUsuario(Long id) {
        usuarioRepository.deleteById(id);
    }

    public boolean validarAdmin(String email, String password) {
        Usuario usuario = usuarioRepository.findByEmail(email);
        if (usuario == null) {
            System.out.println("Usuario no encontrado");
            return false;
        }
        if (!passwordEncoder.matches(password, usuario.getPassword())) {
            System.out.println("Contraseña incorrecta");
            return false;
        }
        if (!"ROLE_ADMIN".equals(usuario.getRole())) {
            System.out.println("Rol incorrecto");
            return false;
        }
        return true;
    }
}
