package com.bit.board.model.dao;

import java.util.List;
import com.bit.board.model.dto.BoardDto;

public interface BoardDao {
    List<BoardDto> getAllBoards();
}
