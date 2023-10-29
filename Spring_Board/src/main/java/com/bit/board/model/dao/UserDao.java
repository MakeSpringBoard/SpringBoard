package com.bit.board.model.dao;

import java.util.List;

import com.bit.board.model.dto.UserDto;

public interface UserDao {
    void registerUser(UserDto userDto);
    UserDto getUserByIdAndPassword(String userId, String userPassword);
    UserDto getUserById(String userId);
    void updateUser(UserDto userDto);
    List<UserDto> getAllUsers();
}

