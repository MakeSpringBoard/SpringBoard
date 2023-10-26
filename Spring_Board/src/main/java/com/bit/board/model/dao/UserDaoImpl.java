package com.bit.board.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.board.model.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
    
    @Autowired
    private SqlSession sqlSession;
    
    @Override
    public void registerUser(UserDto userDto) {
        System.out.println("Registering user: " + userDto); // 로그 출력
        sqlSession.insert("userMapper.registerUser", userDto);
    }

    
    @Override
    public UserDto getUserByIdAndPassword(String userId, String userPassword) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("userId", userId);
        paramMap.put("userPassword", userPassword);
        return sqlSession.selectOne("userMapper.getUserByIdAndPassword", paramMap);
    }

}

