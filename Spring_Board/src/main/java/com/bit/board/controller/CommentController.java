package com.bit.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.board.model.dto.CommentDto;
import com.bit.board.model.dto.UserDto;
import com.bit.board.service.BoardService;
import com.bit.board.service.CommentService;

@Controller
public class CommentController {
	@Autowired
    private CommentService commentService;
	
	@Autowired
    private BoardService boardService;
	
	@RequestMapping(value = "/saveComment", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveComment(@RequestParam("boardNumber") int boardNumber,
                                           @RequestParam("commentContent") String commentContent,
                                           HttpSession session) {
        Map<String, Object> result = new HashMap<String, Object>();
        UserDto user = (UserDto) session.getAttribute("user");
        if (user == null) {
            result.put("success", false);
            result.put("message", "로그인이 필요한 기능입니다.");
            return result;
        }

        CommentDto comment = new CommentDto();
        comment.setBoardNumber(boardNumber);
        comment.setUserId(user.getUserId());
        comment.setCommentContent(commentContent);
        comment.setCommentUserProfile(user.getUserName());
        comment.setCommentWriteDateToNow();
        boardService.increaseCommentCount(boardNumber);

        int saveResult = commentService.saveComment(comment);
        if (saveResult > 0) {
            result.put("success", true);
            result.put("comment", comment);
        } else {
            result.put("success", false);
            result.put("message", "댓글 작성 실패");
        }

        return result;
    }

    @RequestMapping(value = "/getComments", method = RequestMethod.GET)
    @ResponseBody
    public List<CommentDto> getComments(@RequestParam("boardNumber") int boardNumber) {
        return commentService.getCommentsByBoardNumber(boardNumber);
    }
}
