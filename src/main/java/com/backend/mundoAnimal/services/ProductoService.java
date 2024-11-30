package com.backend.mundoAnimal.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.backend.mundoAnimal.entity.Producto;
import com.backend.mundoAnimal.exceptions.UnauthorizedException;
import com.backend.mundoAnimal.repository.ProductoRepository;

@Service
public class ProductoService {

    @Autowired
    private ProductoRepository productoRepository;

    @Autowired
    private UsuarioService usuarioService;

    public List<Producto> listarProductos() {
        return productoRepository.findAll();
    }

    public Producto guardarProducto(Producto producto) {
        return productoRepository.save(producto);
    }

    public void eliminarProducto(Long id, String email, String password) throws UnauthorizedException {
        if (usuarioService.validarAdmin(email, password)) {
            productoRepository.deleteById(id);
        } else {
            throw new UnauthorizedException("Invalid admin credentials");
        }
    }
    

    public Producto obtenerProductoPorId(Long id) {
        return productoRepository.findById(id).orElse(null);
    }

    public List<Producto> obtenerProductosPorCategoria(Long categoriaId) {
        return productoRepository.findByCategoriaId(categoriaId);
    }

    public Producto editarProducto(Producto producto) {
        return productoRepository.save(producto);
    }

    public List<Producto> buscarProductos(String nombre) {
        return productoRepository.findByNombreContainingIgnoreCase(nombre);
    }

    public Producto editarProducto(Producto producto, String email, String password) throws UnauthorizedException {
        if (usuarioService.validarAdmin(email, password)) {
            return productoRepository.save(producto);
        } else {
            throw new UnauthorizedException("Invalid admin credentials");
        }
    }

}
