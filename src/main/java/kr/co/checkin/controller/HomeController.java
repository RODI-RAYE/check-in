package kr.co.checkin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.checkin.model.Home;
import kr.co.checkin.model.Photo;
import kr.co.checkin.model.User;
import kr.co.checkin.service.HomeService;
import kr.co.checkin.util.Pager;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	final String path = "home/";
	final String uploadPath = "D:/upload/";
	
	@Autowired
	HomeService service;
	
	@RequestMapping({"/", "/list"})
	public String list(HttpSession session, Model model, Pager pager) {
		User user = (User) session.getAttribute("user");
		
		pager.setId(user.getId());
		
		List<Home> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(HttpSession session, Home item, @RequestParam("photo") List<MultipartFile> photo) {
		User user = (User) session.getAttribute("user");
		
		item.setId(user.getId());
		
		try {
			List<Photo> images = new ArrayList<>();
			
			System.out.println(photo.size());
			
			for(MultipartFile file : photo) {
				if(!file.isEmpty()) {
					String filename = file.getOriginalFilename();
					String uuid = UUID.randomUUID().toString();
										
					file.transferTo(new File(uploadPath + uuid + "_" + filename));
					
					System.out.println(filename);
					
					Photo image = new Photo();
					image.setFilename(filename);
					image.setUuid(uuid);
					
					images.add(image);
				}	
			} 
			
			item.setImages(images);
			
			service.add(item);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		

		return "redirect:list";
	}
		
	
	@GetMapping("/update/{code}")
	public String update(@PathVariable int code, Model model) {
		Home item = service.item(code);
		
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/update/{code}")
	public String update(@PathVariable int code, Home item, @RequestParam("photo") List<MultipartFile> photo) {
		item.setCode(code);
		
		try {
			List<Photo> images = new ArrayList<>();
			
			System.out.println(images.size());
			
			for(MultipartFile file : photo) {
				if(file.getSize() > 0) {
					String filename = file.getOriginalFilename();
					String uuid = UUID.randomUUID().toString();
										
					file.transferTo(new File(uploadPath + uuid + "_" + filename));
					
					System.out.println(filename);
					
					Photo image = new Photo();
					image.setFilename(filename);
					image.setUuid(uuid);
					
					images.add(image);					
				}	
			} 
			
			item.setImages(images);

			service.update(item);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return "redirect:../list";
	}
	
	@RequestMapping("/delete/{code}")
	public String delete(@PathVariable int code) {
		service.delete(code);
		
		return "redirect:../list";
	}
	
	@ResponseBody
	@GetMapping("/image/delete/{code}")
	public boolean deleteImage(@PathVariable int code) {
		return service.deleteImage(code);
	}
	
	@RequestMapping("/compare")
	public String compare(HttpSession session, Model model, Pager pager) {
		User user = (User) session.getAttribute("user");

		pager.setId(user.getId());
		
		List<Home> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "compare";
	}
	
	@ResponseBody
	@GetMapping("/compare/{code}")
	public Home item(@PathVariable int code) {
		return service.item(code);
	}
}
