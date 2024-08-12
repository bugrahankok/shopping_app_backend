package com.bugrashopping.shoppingapp.model;

public class JwtResponse {
    private String token;
    private int role;
    private Long id;
    private double balance;

    public JwtResponse(String token, int role, Long id, double balance) {
        this.token = token;
        this.role = role;
        this.id = id;
        this.balance = balance;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }
}
