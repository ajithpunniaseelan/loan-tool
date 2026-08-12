package com.api.user.service;

import com.api.user.dto.CreateUserRequest;
import com.api.user.dto.UserResponse;

import java.util.List;

public interface UserService {

    UserResponse createUser(CreateUserRequest request);

    UserResponse getUserById(Long id);

    List<UserResponse> getAllUsers();

    UserResponse updateUser(Long id, CreateUserRequest request);

    void deleteUser(Long id);
}