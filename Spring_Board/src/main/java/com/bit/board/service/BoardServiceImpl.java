package com.bit.board.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bit.board.model.dao.BoardDao;
import com.bit.board.model.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDao boardDao;
    
    @Override
    public List<BoardDto> getAllBoards() {
        return boardDao.getAllBoards();
    }
    
    @Override
    public void saveBoard(BoardDto board) {
        boardDao.saveBoard(board);
    }
}
