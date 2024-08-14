package com.bugrashopping.shoppingapp.controller;

import com.bugrashopping.shoppingapp.model.ProductCategory;
import com.bugrashopping.shoppingapp.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/categories")
public class ProductCategoryController {

    @Autowired
    private ProductCategoryService productCategoryService;

    @GetMapping("/getAll")
    public List<ProductCategory> getAllCategories() {
        return productCategoryService.getAllCategories();
    }
}
