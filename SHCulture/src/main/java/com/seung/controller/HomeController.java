package com.seung.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seung.model.MemberDTO;
import com.seung.model.RestaurantDTO;
import com.seung.service.RestService;

@Controller
public class HomeController {

	@Autowired private RestService service;
	
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView("/home");
		List<RestaurantDTO> dto = service.rankRest();
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		if(dto != null) {
			session.invalidate();
		}
		return "redirect:/";
	}
}
