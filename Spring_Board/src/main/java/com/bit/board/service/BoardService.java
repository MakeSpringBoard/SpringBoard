package com.bit.board.service;

import java.util.List;
import com.bit.board.model.dto.BoardDto;

public interface BoardService {
    List<BoardDto> getAllBoards();
    
    void saveBoard(BoardDto board);
}
