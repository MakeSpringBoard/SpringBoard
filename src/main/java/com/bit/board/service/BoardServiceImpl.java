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
    
    @Override
    public BoardDto getBoard(int boardNumber) {
        return boardDao.selectBoard(boardNumber);
    }
    
    @Override
    public void updateBoard(BoardDto board) {
        boardDao.updateBoard(board);
    }

    @Override
    public void deleteBoard(int boardNumber) {
        boardDao.deleteBoard(boardNumber);
    }
    
    @Override
    public void increaseClickCount(int boardNumber) {
        boardDao.increaseClickCount(boardNumber);
    }
    
    @Override
    public void updateLikeCount(int boardNumber) {
        boardDao.updateLikeCount(boardNumber);
    }

    @Override
    public void updateDislikeCount(int boardNumber) {
        boardDao.updateDislikeCount(boardNumber);
    }

}
