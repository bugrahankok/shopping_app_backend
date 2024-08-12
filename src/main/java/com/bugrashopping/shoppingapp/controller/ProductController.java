package com.bugrashopping.shoppingapp.controller;

import com.bugrashopping.shoppingapp.aop.RateLimited;
import com.bugrashopping.shoppingapp.model.Product;
import com.bugrashopping.shoppingapp.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RateLimited(timeWindow = 60, maxRequests = 15)
    @GetMapping("/getAll")
    public List<Product> getAllProducts() {
        return productService.getAllProducts();
    }

    @RateLimited(timeWindow = 60, maxRequests = 5)
    @PostMapping("/add")
    public Product addProduct(@RequestBody Product product) {
        return productService.saveProduct(product);
    }

    @RateLimited(timeWindow = 60, maxRequests = 5)
    @PutMapping("/update/{id}")
    public Product updateProduct(@PathVariable Long id, @RequestBody Product product) {
        return productService.updateProduct(id, product);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
    }

    @PutMapping("/decreaseStock/{id}")
    public ResponseEntity<Product> decreaseStock(@PathVariable Long id) {
        try {
            Product updatedProduct = productService.decreaseStock(id);
            return ResponseEntity.ok(updatedProduct);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
    }
}

