package com.bit.board.service;

import java.util.List;
import com.bit.board.model.dto.BoardDto;

public interface BoardService {
    List<BoardDto> getAllBoards();
    
    void saveBoard(BoardDto board);
    
    BoardDto getBoard(int boardNumber);
    
    
    void updateBoard(BoardDto board);
    
    void deleteBoard(int boardNumber);
    
    void increaseClickCount(int boardNumber);
    
    void updateLikeCount(int boardNumber);
    void updateDislikeCount(int boardNumber);
    void increaseCommentCount(int boardNumber);
}
