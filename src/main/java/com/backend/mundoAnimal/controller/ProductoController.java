package com.backend.mundoAnimal.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.backend.mundoAnimal.entity.Categoria;
import com.backend.mundoAnimal.entity.Producto;
import com.backend.mundoAnimal.exceptions.UnauthorizedException;
import com.backend.mundoAnimal.services.CategoriaService;
import com.backend.mundoAnimal.services.ProductoService;

@CrossOrigin(origins = "https://petshopvalu.store")
@RestController
@RequestMapping("/productos")
public class ProductoController {

    @Autowired
    private ProductoService productoService;

    @Autowired
    private CategoriaService categoriaService;

    @GetMapping("/listar")
    public List<Producto> listarProductos() {
        return productoService.listarProductos();
    }

    @PostMapping(value = "/guardar", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Producto> guardarProducto(@RequestBody Producto producto) {
        return ResponseEntity.ok(productoService.guardarProducto(producto));
    }

    // metodo para obtener un producto por id.

    @GetMapping("/{id}")
    public ResponseEntity<Producto> obtenerProductoPorId(@PathVariable Long id) {
        Producto producto = productoService.obtenerProductoPorId(id);
        return ResponseEntity.ok(producto);
    }

    // metodo para eliminar un producto por id.
    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<Void> eliminarProducto(@PathVariable Long id, @RequestParam String email, @RequestParam String password) {
        try {
            productoService.eliminarProducto(id, email, password);
            return ResponseEntity.noContent().build();
        } catch (UnauthorizedException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    // metodo para obtener un producto por id y asignarle una categoria.
    @PutMapping("/{productoId}/asignarCategoria/{categoriaId}")
    public ResponseEntity<Producto> asignarCategoria(@PathVariable Long productoId, @PathVariable Long categoriaId) {
        Producto producto = productoService.obtenerProductoPorId(productoId);
        Categoria categoria = categoriaService.obtenerCategoriaPorId(categoriaId);
        producto.setCategoria(categoria);
        return ResponseEntity.ok(productoService.guardarProducto(producto));
    }

    // metodo para obtener productos por categoria.
    @GetMapping("/categoria/{categoriaId}")
    public List<Producto> obtenerProductosPorCategoria(@PathVariable Long categoriaId) {
        return productoService.obtenerProductosPorCategoria(categoriaId);
    }

   

    // metodo para buscar productos por nombre.
    @GetMapping("/buscar")
    public List<Producto> buscarProductos(@RequestParam String nombre) {
        return productoService.buscarProductos(nombre);
    }
   
    // metodo para editar un producto con autenticacion.
    @PutMapping("/editarProducto")
    public ResponseEntity<Producto> editarProducto(@RequestBody Map<String, Object> payload) {
        String email = (String) payload.get("email");
        String password = (String) payload.get("password");
        Producto producto = new Producto();
        producto.setId(Long.parseLong(payload.get("id").toString()));
        producto.setNombre((String) payload.get("nombre"));
        producto.setDescripcion((String) payload.get("descripcion"));
        producto.setPrecio(new BigDecimal(payload.get("precio").toString()));
        producto.setImagen((String) payload.get("imagen"));

        Long categoriaId = payload.get("categoriaId") != null ? Long.parseLong(payload.get("categoriaId").toString()) : null;
        if (categoriaId != null) {
            Categoria categoria = new Categoria();
            categoria.setId(categoriaId);
            producto.setCategoria(categoria);
        }
        try {
            Producto productoEditado = productoService.editarProducto(producto, email, password);
            return ResponseEntity.ok(productoEditado);
        } catch (UnauthorizedException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(null);
        }
    }


}