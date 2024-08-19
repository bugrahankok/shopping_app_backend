package com.bugrashopping.shoppingapp.controller;

import com.bugrashopping.shoppingapp.model.Sale;
import com.bugrashopping.shoppingapp.service.SaleService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @GetMapping("/user/{userId}")
    public ResponseEntity<List<Sale>> getSalesByUserId(@PathVariable Long userId) {
        List<Sale> userSales = saleService.getSalesByUserId(userId);
        return ResponseEntity.ok(userSales);
    }

    @PostMapping("/add")
    public Sale addSale(@RequestBody Sale sale) {
        return saleService.saveSale(sale);
    }
}
