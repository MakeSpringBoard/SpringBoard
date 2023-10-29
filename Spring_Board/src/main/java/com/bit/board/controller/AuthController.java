package com.bit.board.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.board.model.dto.UserDto;
import com.bit.board.service.UserService;

@Controller
public class AuthController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/register")
	public String registerPage() {
		return "board/signup";
	}
	
	@RequestMapping("/login")
	public String loginPage() {
		return "board/login";
	}
	
	@RequestMapping("/registerAction")
	public String registerAction(UserDto userDto) {
	    userService.registerUser(userDto);
	    return "redirect:/login";
	}
	
	@RequestMapping("/loginAction")
	public String loginAction(String userId, String userPassword, HttpSession session) {
	    
	    UserDto userDto = userService.login(userId, userPassword);
	    if (userDto != null) {
	        session.setAttribute("user", userDto);
	        return "redirect:/boardList"; // 로그인 성공 시 리다이렉트할 페이지
	    } else {
	        return "redirect:/login?error"; // 로그인 실패 시 다시 로그인 페이지로 리다이렉트
	    }
	}
	
	@RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();  // 세션을 무효화하여 로그아웃 처리
        return "redirect:/login";  // 로그인 페이지로 리다이렉트
    }	
	
	@RequestMapping("/infoChange")
    public String userInfo(HttpSession session, Model model) {
        UserDto user = (UserDto) session.getAttribute("user");
        if (user != null) {
            model.addAttribute("user", userService.getUserById(user.getUserId()));
            return "board/infoChange";
        } else {
            return "redirect:/login";
        }
    }
	
	@RequestMapping("/updateAction")
    public String updateUser(UserDto userDto, HttpSession session) {
        userService.updateUser(userDto);
        session.setAttribute("user", userService.getUserById(userDto.getUserId()));
        return "redirect:/boardList";
    }
	
	@RequestMapping("/memberManage")
	public String memberManage(Model model) {
	    List<UserDto> userList = userService.getAllUsers();
	    model.addAttribute("userList", userList);
	    return "board/memberManage";
	}

	
}
