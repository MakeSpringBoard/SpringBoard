package com.bit.board.model.dao;

import com.bit.board.model.dto.UserDto;

public interface UserDao {
    void registerUser(UserDto userDto);
    UserDto getUserByIdAndPassword(String userId, String userPassword);
}

