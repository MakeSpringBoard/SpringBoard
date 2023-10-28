package com.bit.board.model.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.bit.board.model.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {

    @Autowired
    private SqlSession sqlSession;
    
    @Override
    public List<BoardDto> getAllBoards() {
        return sqlSession.selectList("boardMapper.getAllBoards");
    }
    
    @Override
    public void saveBoard(BoardDto board) {
        sqlSession.insert("boardMapper.saveBoard", board);
    }
    
    @Override
    public BoardDto selectBoard(int boardNumber) {
        return sqlSession.selectOne("boardMapper.selectBoard", boardNumber);
    }
    
    @Override
    public void updateBoard(BoardDto board) {
        sqlSession.update("boardMapper.updateBoard", board);
    }

    @Override
    public void deleteBoard(int boardNumber) {
        sqlSession.delete("boardMapper.deleteBoard", boardNumber);
    }
    
    @Override
    public void increaseClickCount(int boardNumber) {
        sqlSession.update("boardMapper.increaseClickCount", boardNumber);
    }
    
    @Override
    public void updateLikeCount(int boardNumber) {
        sqlSession.update("boardMapper.updateLikeCount", boardNumber);
    }

    @Override
    public void updateDislikeCount(int boardNumber) {
        sqlSession.update("boardMapper.updateDislikeCount", boardNumber);
    }

}
