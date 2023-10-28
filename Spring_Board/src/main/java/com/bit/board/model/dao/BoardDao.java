package com.bit.board.model.dao;

import java.util.List;
import com.bit.board.model.dto.BoardDto;

public interface BoardDao {
    List<BoardDto> getAllBoards();
    void saveBoard(BoardDto board);
    BoardDto selectBoard(int boardNumber);
    
    void updateBoard(BoardDto board);
    void deleteBoard(int boardNumber);
}
