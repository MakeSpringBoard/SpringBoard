package com.bit.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.board.model.dao.CommentDao;
import com.bit.board.model.dto.CommentDto;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
    private CommentDao commentDAO;

	@Override
    public int saveComment(CommentDto comment) {
        return commentDAO.saveComment(comment);
    }

	@Override
    public List<CommentDto> getCommentsByBoardNumber(int boardNumber) {
        return commentDAO.getCommentsByBoardNumber(boardNumber);
    }
}
