package com.bit.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	        return "redirect:/boardList"; // �α��� ���� �� �����̷�Ʈ�� ������
	    } else {
	        return "redirect:/login?error"; // �α��� ���� �� �ٽ� �α��� �������� �����̷�Ʈ
	    }
	}
	
	@RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();  // ������ ��ȿȭ�Ͽ� �α׾ƿ� ó��
        return "redirect:/login";  // �α��� �������� �����̷�Ʈ
    }

	
}
