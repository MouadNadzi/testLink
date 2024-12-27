package com.example.demo.service;

import com.example.demo.dto.UserDTO;
import com.example.demo.entity.User;
import com.example.demo.mapper.UserMapper;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class UserService {

    @Autowired
    private final UserRepository userRepository;
    @Autowired
    private final UserMapper userMapper;

    public UserService(UserRepository userRepository, UserMapper userMapper) {
        this.userRepository = userRepository;
        this.userMapper = userMapper;
    }

    // Create or update a user and return as DTO
    public UserDTO createUser(String username, String email, String password) {
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);

        // Save the user to the database
        user = userRepository.save(user);

        // Convert User entity to UserDTO and return
        return userMapper.toDTO(user);
    }

    // Find a user by ID and return as DTO
    public Optional<UserDTO> findUserById(Long id) {
        Optional<User> user = userRepository.findById(id);
        return user.map(userMapper::toDTO);
    }

    // Retrieve all users and return as a list of DTOs
    public List<UserDTO> findAllUsers() {
        return userRepository.findAll()
                             .stream()
                             .map(userMapper::toDTO)
                             .collect(Collectors.toList());
    }

    // Delete a user
    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    // Additional user-related methods can be added here
}
