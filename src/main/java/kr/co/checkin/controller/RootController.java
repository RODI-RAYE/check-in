package kr.co.checkin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.checkin.model.History;
import kr.co.checkin.model.User;
import kr.co.checkin.service.UserService;

@Controller
public class RootController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
	@PostMapping("/signup")
	public String signup(User user, RedirectAttributes ra) {
		userService.add(user);
		
		ra.addFlashAttribute("msg", "회원가입이 완료되었습니다 ㅤㅤㅤ");
		
		return "redirect:login";
	}
	
	@ResponseBody
	@PostMapping("/checkId")
	public String checkId(String id) {
		if(userService.checkId(id))
			return "OK";
		else
			return "FAIL";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(User user, HttpSession session, RedirectAttributes ra) {
		if(userService.login(user)) {
			session.setAttribute("user", user);
			
			return "redirect:home/list";
		}
		
		ra.addFlashAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다.");
		
		return "redirect:/login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/tip")
	public String list() {
		return "tip/list";
	}
}
