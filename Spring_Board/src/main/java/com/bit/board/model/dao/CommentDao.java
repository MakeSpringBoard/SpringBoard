package com.bit.board.model.dao;

import java.util.List;

import com.bit.board.model.dto.CommentDto;

public interface CommentDao {
	int saveComment(CommentDto comment);
	List<CommentDto> getCommentsByBoardNumber(int boardNumber);
}
