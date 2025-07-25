package com.bugrashopping.shoppingapp.service;

import com.bugrashopping.shoppingapp.model.Sale;

import java.util.List;

public interface SaleService {
    Sale saveSale(Sale sale);
    List<Sale> getAllSales();
    List<Sale> getSalesByUserId(Long userId);
}
