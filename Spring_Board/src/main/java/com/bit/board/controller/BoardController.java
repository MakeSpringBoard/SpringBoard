package com.bit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit.board.model.dto.BoardDto;
import com.bit.board.model.dto.UserDto;
import com.bit.board.service.BoardService;
import com.bit.board.util.FileUploadUtil;

@Controller
public class BoardController {
	
	private final FileUploadUtil fileUploadUtil;

    @Autowired
    public BoardController(FileUploadUtil fileUploadUtil) {
        this.fileUploadUtil = fileUploadUtil;
    }

    @Autowired
    private BoardService boardService;

    @RequestMapping("/boardList")
    public String boardList(Model model) {
        List<BoardDto> boardList = boardService.getAllBoards();
        model.addAttribute("boardList", boardList);
        return "board/boardList";
    }
    
    @RequestMapping("/writeBoard")
    public String writeBoard(Model model) {
        return "board/boardWrite";
    }
    
    @RequestMapping("/writeAction")
    public String writeBoardAction(String boardTitle, String boardContent, @RequestParam("boardImage") MultipartFile boardImage, HttpSession session) {
        UserDto user = (UserDto) session.getAttribute("user");
        if (user == null) {
            // 사용자가 로그인하지 않았다면, 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }

        BoardDto board = new BoardDto();
        board.setBoardTitle(boardTitle);
        board.setBoardContent(boardContent);
        board.setBoardWriterProfile(user.getUserName());
        board.setBoardWriteDateToNow();
        try {
            String filePath = fileUploadUtil.saveFile(boardImage);
            if (filePath == null) {
                filePath = ""; 
            }
            board.setBoardImage(filePath);
        } catch (IOException e) {
            // 파일 저장 실패 시 로깅 및 에러 처리
            e.printStackTrace();
        }

        boardService.saveBoard(board);

        return "redirect:/boardList";
    }

    
}
