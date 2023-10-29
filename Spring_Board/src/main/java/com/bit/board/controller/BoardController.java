package com.bit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
            // ����ڰ� �α������� �ʾҴٸ�, �α��� �������� �����̷�Ʈ
            return "redirect:/login";
        }

        BoardDto board = new BoardDto();
        board.setBoardTitle(boardTitle);
        board.setBoardContent(boardContent);
        board.setBoardWriterId(user.getUserId());
        board.setBoardWriterProfile(user.getUserName());
        board.setBoardWriteDateToNow();
        try {
            String filePath = fileUploadUtil.saveFile(boardImage);
            if (filePath == null) {
                filePath = ""; 
            }
            board.setBoardImage(filePath);
        } catch (IOException e) {
            // ���� ���� ���� �� �α� �� ���� ó��
            e.printStackTrace();
        }

        boardService.saveBoard(board);

        return "redirect:/boardList";
    }
    
    @RequestMapping("/board/{boardNumber}")
    public String viewBoard(@PathVariable int boardNumber, Model model, HttpSession session) {
    	UserDto user = (UserDto) session.getAttribute("user");
    	BoardDto board = boardService.getBoard(boardNumber);
    	if (user != null) {
    	    System.out.println("���� ����� ID: " + user.getUserId());
    	    model.addAttribute("user", user); 
    	    if (!user.getUserId().equals(board.getBoardWriterId())) {
                // ���� �α����� ����ڰ� �� �ۼ��ڰ� �ƴϸ� ��ȸ���� 1 �ø���.
                boardService.increaseClickCount(boardNumber);
            }
    	} else {
    	    System.out.println("���� ����");
    	}
    	
        model.addAttribute("board", board);
        return "board/boardInfo"; // �� ������ JSP�� �̸�
    }
    
    @RequestMapping("/editBoard/{boardNumber}")
    public String editBoard(@PathVariable int boardNumber, Model model) {
        BoardDto board = boardService.getBoard(boardNumber);
        model.addAttribute("board", board);
        return "board/boardModify";
    }

    @RequestMapping("/editAction")
    public String editBoardAction(@RequestParam("boardNumber") int boardNumber,
            @RequestParam("boardTitle") String boardTitle,
            @RequestParam("boardContent") String boardContent,
            @RequestParam("boardImage") MultipartFile boardImageFile,
            HttpSession session) throws IOException {
    	
    	BoardDto board = new BoardDto();
        board.setBoardNumber(boardNumber);
        board.setBoardTitle(boardTitle);
        board.setBoardContent(boardContent);
    	
        if (board.getBoardImage() != null && boardImageFile.isEmpty()) {
            // ���� �̹��� ��θ� �״�� ���
        } else {
            // ���ο� �̹����� ���ε��ϰ� ��θ� ����
            String filePath = fileUploadUtil.saveFile(boardImageFile);
            board.setBoardImage(filePath);
        }
        boardService.updateBoard(board);
        return "redirect:/board/" + board.getBoardNumber();
    }

    @RequestMapping("/deleteBoard/{boardNumber}")
    public String deleteBoard(@PathVariable int boardNumber) {
        boardService.deleteBoard(boardNumber);
        return "redirect:/boardList";
    }

    @RequestMapping("/updateLikeDislike")
    @ResponseBody
    public Map<String, Object> updateLikeDislike(@RequestParam int boardNumber, @RequestParam String type) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            if ("like".equals(type)) {
                boardService.updateLikeCount(boardNumber);
            } else if ("dislike".equals(type)) {
                boardService.updateDislikeCount(boardNumber);
            }
            resultMap.put("success", true);
            resultMap.put("newCount", boardService.getBoard(boardNumber).getBoardLikeCount()); 
        } catch (Exception e) {
            resultMap.put("success", false);
            e.printStackTrace();
        }
        return resultMap;
    }


    
}
