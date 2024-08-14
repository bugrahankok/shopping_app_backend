package com.bugrashopping.shoppingapp.controller;

import com.bugrashopping.shoppingapp.aop.RateLimited;
import com.bugrashopping.shoppingapp.model.Product;
import com.bugrashopping.shoppingapp.model.Sale;
import com.bugrashopping.shoppingapp.service.ProductService;
import com.bugrashopping.shoppingapp.service.SaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/sale")
public class SaleController {

    @Autowired
    private SaleService saleService;

    @GetMapping("/getAll")
    public List<Sale> getAllSales() {
        return saleService.getAllSales();
    }

    @PostMapping("/add")
    public Sale addSale(@RequestBody Sale sale) {
        return saleService.saveSale(sale);
    }
}

