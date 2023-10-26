package com.bit.board.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.bit.board.model.dto.BoardDto;
import com.bit.board.service.BoardService;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    @RequestMapping("/boardList")
    public String boardList(Model model) {
        List<BoardDto> boardList = boardService.getAllBoards();
        model.addAttribute("boardList", boardList);
        return "board/boardList";
    }
}
