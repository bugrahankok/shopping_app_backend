package com.bugrashopping.shoppingapp.repository;

import com.bugrashopping.shoppingapp.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long> {
}
