package com.bit.board.service;

import java.util.List;

import com.bit.board.model.dto.CommentDto;

public interface CommentService {
	int saveComment(CommentDto comment);
	List<CommentDto> getCommentsByBoardNumber(int boardNumber);
}
