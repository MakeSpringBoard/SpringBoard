package com.bit.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.board.model.dao.UserDao;
import com.bit.board.model.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {
    
    @Autowired
    private UserDao userDAO;
    
    @Override
    public void registerUser(UserDto userDto) {
        userDAO.registerUser(userDto);
    }
    
    @Override
    public UserDto login(String userId, String userPassword) {
        return userDAO.getUserByIdAndPassword(userId, userPassword);
    }
    
    @Override
    public UserDto getUserById(String userId) {
        return userDAO.getUserById(userId);
    }
    
    @Override
    public void updateUser(UserDto userDto) {
        userDAO.updateUser(userDto);
    }
    
    @Override
    public List<UserDto> getAllUsers() {
        return userDAO.getAllUsers();
    }

}

