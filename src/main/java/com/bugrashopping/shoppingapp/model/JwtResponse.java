package com.bugrashopping.shoppingapp.model;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class JwtResponse {
    private String token;
    private int role;
    private Long id;
    private double balance;
    private String username;
}
