package com.bit.board.service;

import com.bit.board.model.dto.UserDto;

public interface UserService {
	
    void registerUser(UserDto userDto);
    UserDto login(String userId, String userPassword);
    UserDto getUserById(String userId);
    void updateUser(UserDto userDto);
}

