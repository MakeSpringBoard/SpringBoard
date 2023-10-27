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
}
