package kr.co.checkin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.checkin.model.History;
import kr.co.checkin.model.Home;
import kr.co.checkin.model.User;
import kr.co.checkin.service.HistoryService;
import kr.co.checkin.service.HomeService;
import kr.co.checkin.util.Pager;

@Controller
@RequestMapping("/history")
public class HistoryController {
	final String path = "history/";
	
	@Autowired
	HistoryService service;
	
	@Autowired
	HomeService homeService;
	
	@RequestMapping({"/", "/list"})
	public String list(HttpSession session, Model model, Pager pager) {
		User user = (User) session.getAttribute("user");
		
		pager.setId(user.getId());
		
		List<History> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add(HttpSession session, Model model, Pager pager) {
		User user = (User) session.getAttribute("user");
		
		pager.setId(user.getId());
		
		List<Home> homeList = homeService.list(pager);
		
		model.addAttribute("homeList", homeList);
		
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(HttpSession session, History item) {
		User user = (User) session.getAttribute("user");
		
		item.setId(user.getId());
		
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{code}")
	public String update(HttpSession session, @PathVariable int code, Model model, Pager pager) {
		User user = (User) session.getAttribute("user");
		
		pager.setId(user.getId());
		
		List<Home> homeList = homeService.list(pager);
		
		model.addAttribute("homeList", homeList);
		
		History item = service.item(code);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/update/{code}")
	public String update(@PathVariable int code, History item) {
		service.update(item);
		
		return "redirect:../list";
	}
	
	@RequestMapping("/delete/{code}")
	public String delete(@PathVariable int code) {
		service.delete(code);
		
		return "redirect:../list";
	}
	
	@ResponseBody
	@PostMapping("/image/{code}")
	public Home item(@RequestBody int code) {
		return homeService.item(code);
	}
}
