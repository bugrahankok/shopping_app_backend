package com.bugrashopping.shoppingapp.model;

public class JwtResponse {
    private String token;
    private int role;

    public JwtResponse(String token, int role) {
        this.token = token;
        this.role = role;
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
}
