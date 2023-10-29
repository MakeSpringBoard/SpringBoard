package com.bit.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.board.model.dto.CommentDto;

@Repository
public class CommentDaoImpl implements CommentDao{
	
	@Autowired
    private SqlSession sqlSession;

	@Override
    public int saveComment(CommentDto comment) {
        return sqlSession.insert("commentMapper.saveComment", comment);
    }

	@Override
    public List<CommentDto> getCommentsByBoardNumber(int boardNumber) {
        return sqlSession.selectList("commentMapper.getCommentsByBoardNumber", boardNumber);
    }
}
