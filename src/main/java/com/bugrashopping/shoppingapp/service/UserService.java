package com.bugrashopping.shoppingapp.service;

import com.bugrashopping.shoppingapp.model.Product;
import com.bugrashopping.shoppingapp.model.User;
import com.bugrashopping.shoppingapp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class UserService implements UserDetailsService {

    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void save(User user) {
        userRepository.save(user);
    }

    public boolean existsByUsername(String username) {
        return userRepository.findByUsername(username).isPresent();
    }

    public boolean existsByEmail(String email) {
        return userRepository.findByEmail(email).isPresent();
    }

    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username).orElseThrow(() ->
                new UsernameNotFoundException("User not found")
        );
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), Collections.emptyList());
    }

    public Optional<Integer> getUserRole(String username) {
        return userRepository.findByUsername(username).map(User::getRole);
    }

    public Optional<Long> getUserId(String username) {
        return userRepository.findByUsername(username).map(User::getId);
    }

    public Optional<Double> getBalanceById(Long id) {
        Optional<User> user = userRepository.findById(id);
        return user.map(User::getBalance);
    }

    public Optional<User> findById(Long userId) {
        return userRepository.findById(userId);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public Optional<User> getUserInfoById(Long userId) {
        return userRepository.findById(userId);
    }

    public void updateBalance(Long userId, double newBalance) {
        System.out.println("Kullanıcı ID: " + userId + ", Yeni Bakiye: " + newBalance);
        User user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("Kullanıcı bulunamadı."));
        user.setBalance(newBalance);
        userRepository.save(user);
    }

    public boolean existsById(Long userId) {
        return userRepository.existsById(userId);
    }

    public void deleteById(Long userId) {
        userRepository.deleteById(userId);
    }

}

