package com.bugrashopping.shoppingapp.model;

public class JwtResponse {
    private String token;
    private int role;
    private Long id;
    private double balance;
    private String username;

    public JwtResponse(String token, int role, Long id, double balance, String username) {
        this.username = username;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }
}
