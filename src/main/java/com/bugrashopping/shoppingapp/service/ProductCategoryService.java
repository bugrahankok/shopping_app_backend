package com.bugrashopping.shoppingapp.service;

import com.bugrashopping.shoppingapp.model.ProductCategory;
import com.bugrashopping.shoppingapp.repository.ProductCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductCategoryService {

    @Autowired
    private ProductCategoryRepository productCategoryRepository;

    public List<ProductCategory> getAllCategories() {
        return productCategoryRepository.findAll();
    }
}
