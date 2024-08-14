package com.bugrashopping.shoppingapp.service;

import com.bugrashopping.shoppingapp.model.Product;
import com.bugrashopping.shoppingapp.model.Sale;
import com.bugrashopping.shoppingapp.repository.ProductRepository;
import com.bugrashopping.shoppingapp.repository.SaleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SaleServiceImpl implements SaleService {

    @Autowired
    private SaleRepository saleRepository;

    @Override
    public Sale saveSale(Sale sale) {
        return saleRepository.save(sale);
    }

    @Override
    public List<Sale> getAllSales() {
        return saleRepository.findAll();
    }

}
