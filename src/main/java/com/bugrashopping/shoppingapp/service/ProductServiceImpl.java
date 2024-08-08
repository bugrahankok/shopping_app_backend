package com.bugrashopping.shoppingapp.service;

import com.bugrashopping.shoppingapp.model.Product;
import com.bugrashopping.shoppingapp.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public Product updateProduct(Long id, Product updatedProduct) {
        return productRepository.findById(id).map(product -> {
            product.setName(updatedProduct.getName());
            product.setCategory(updatedProduct.getCategory());
            product.setQuantity(updatedProduct.getQuantity());
            product.setPrice(updatedProduct.getPrice());
            product.setCompleted(updatedProduct.isCompleted());
            return productRepository.save(product);
        }).orElseThrow(() -> new RuntimeException("Product not found"));
    }

    @Override
    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    @Override
    public Product decreaseStock(Long id) throws Exception {
        return productRepository.findById(id)
                .map(product -> {
                    if (product.getQuantity() > 0) {
                        product.setQuantity(product.getQuantity() - 1);
                        return productRepository.save(product);
                    } else {
                        throw new RuntimeException("Insufficient stock");
                    }
                })
                .orElseThrow(() -> new Exception("Product not found"));
    }
}
