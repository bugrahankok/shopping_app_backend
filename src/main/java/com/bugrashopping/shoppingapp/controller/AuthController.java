package com.bugrashopping.shoppingapp.controller;

import com.bugrashopping.shoppingapp.aop.RateLimited;
import com.bugrashopping.shoppingapp.model.JwtResponse;
import com.bugrashopping.shoppingapp.model.User;
import com.bugrashopping.shoppingapp.service.UserService;
import com.bugrashopping.shoppingapp.security.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/auth")
public class AuthController {

    private final UserService userService;
    private final AuthenticationManager authenticationManager;
    private final JwtUtils jwtUtils;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public AuthController(UserService userService, AuthenticationManager authenticationManager, JwtUtils jwtUtils, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.authenticationManager = authenticationManager;
        this.jwtUtils = jwtUtils;
        this.passwordEncoder = passwordEncoder;
    }

    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody User user) {
        if (userService.existsByUsername(user.getUsername())) {
            return ResponseEntity.badRequest().body("Kullanıcı adı zaten kayıtlı.");
        }
        if (userService.existsByEmail(user.getEmail())) {
            return ResponseEntity.badRequest().body("Email zaten kayıtlı.");
        }
        user.setBalance(0.0);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userService.save(user);
        return ResponseEntity.ok("Kullanıcı başarıyla kaydedildi.");
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody User user) {
        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword())
            );

            UserDetails userDetails = userService.loadUserByUsername(user.getUsername());
            String jwt = jwtUtils.generateToken(userDetails);

            int role = userService.getUserRole(user.getUsername()).orElse(0);
            Long id = userService.getUserId(user.getUsername()).orElse(null);
            double balance = userService.getBalanceById(id).orElse(0.0);

            return ResponseEntity.ok(new JwtResponse(jwt, role, id, balance));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Giriş başarısız: " + e.getMessage());
        }
    }

    @RateLimited(timeWindow = 60, maxRequests = 15)
    @GetMapping("/users")
    public ResponseEntity<List<Map<String, Object>>> getUsers() {
        List<User> users = userService.getAllUsers();
        List<Map<String, Object>> userDtos = new ArrayList<>();

        for (User user : users) {
            Map<String, Object> userDto = new HashMap<>();
            userDto.put("id", user.getId());
            userDto.put("username", user.getUsername());
            userDto.put("email", user.getEmail());
            userDto.put("role", user.getRole());
            userDto.put("balance", user.getBalance());
            userDtos.add(userDto);
        }

        return ResponseEntity.ok(userDtos);
    }

    @PutMapping("/updateBalance/{userId}")
    public ResponseEntity<String> updateBalance(@PathVariable Long userId, @RequestBody Map<String, Double> balanceUpdate) {
        Double newBalance = balanceUpdate.get("balance");
        if (newBalance == null) {
            return ResponseEntity.badRequest().body("Yeni bakiye belirtilmelidir.");
        }

        User user = userService.findById(userId)
                .orElseThrow(() -> new RuntimeException("Kullanıcı bulunamadı."));
        user.setBalance(newBalance);
        userService.save(user);

        return ResponseEntity.ok("Bakiye güncellendi.");
    }

    @GetMapping("/balance/{userId}")
    public ResponseEntity<Double> getBalanceById(@PathVariable Long userId) {
        Optional<User> userOptional = userService.findById(userId);
        if (userOptional.isPresent()) {
            double balance = userOptional.get().getBalance();
            return ResponseEntity.ok(balance);
        } else {
            return ResponseEntity.status(404).body(null);
        }
    }
}
