package com.seung.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seung.model.BookingDTO;
import com.seung.model.BusanDTO;
import com.seung.model.InternationalDTO;
import com.seung.model.MemberDTO;
import com.seung.model.MenuDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.ReviewDTO;
import com.seung.program.CurrentTimeAll;
import com.seung.program.ReserveTimer;
import com.seung.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired private BoardService service;
	@Autowired private CurrentTimeAll program;
	
	@GetMapping("/allListRest")
	public ModelAndView allListRest() {
		ModelAndView mav = new ModelAndView();
		List<RestaurantDTO> restList = service.selectAllRest(); 
		program.currentDayAll(restList);
		List<BusanDTO> busan = service.busan();
		List<InternationalDTO> international = service.international();
		
		mav.addObject("restList", restList);
		mav.addObject("busan", busan);
		mav.addObject("intern", international);
		
		return mav;
	}
	
	@GetMapping("/selectRest/{idx}")
	public ModelAndView selectRest(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("/board/selectRest");
		RestaurantDTO rdto = new RestaurantDTO();
		Map<String, Object> data = new HashMap<String, Object>();
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		if(mdto == null) {
			rdto = service.selectRest(idx);
		} else {
			String userId = mdto.getUserId();
			data.put("idx", idx);
			data.put("userId", userId);
			rdto = service.selectRestLogin(data);
		}
		program.CurrentDay(rdto);
		List<MenuDTO> menu = service.selectMenu(idx);
		List<BookingDTO> timer = service.selectBooking(idx);
		List<ReviewDTO> rankOne = service.selectReviewOne(idx);
		List<ReviewDTO> rankTwo = service.selectReviewTwo(idx);
		mav.addObject("dto", rdto);
		mav.addObject("m", menu);
		mav.addObject("timer", timer);
		mav.addObject("rankOne", rankOne);
		mav.addObject("rankTwo", rankTwo);
		return mav;
	}
	
	
	
	@ResponseBody
	@PostMapping("/checkUser")
	public int checkUser(@RequestBody Map<String, Object> data) {
		data.get("userId");
		data.get("rest");
		String userId = data.get("userId").toString();
		int result = service.checkPick(data);
		return result;
	}
	
	@GetMapping("/searchOption")
	public ModelAndView searchOption(@RequestParam("gun")String gun, @RequestParam("inter") String inter) {
		ModelAndView mav = new ModelAndView("/board/searchOption");
		RestaurantDTO dto = new RestaurantDTO(); 
		List<String> gunList = new ArrayList<String>();
		List<String> interList = new ArrayList<String>();
		String g = gun;
		String in = inter;
		if(gun != "") {
			String[] gunArr = gun.split(",");
			gunList.addAll(Arrays.asList(gunArr));
		}
		if(inter != "") {
			String[] interArr = inter.split(",");
			interList.addAll(Arrays.asList(interArr));
		}
		List<RestaurantDTO> restList = service.searchOption(gunList, interList);
		program.currentDayAll(restList);
		int count = restList.size();
		List<BusanDTO> busan = service.busan();
		List<InternationalDTO> international = service.international();
		mav.addObject("count", count);
		mav.addObject("gun", g);
		mav.addObject("inter", inter);
		mav.addObject("restList", restList);
		mav.addObject("busan", busan);
		mav.addObject("intern", international);
		return mav;
	}
	
	@GetMapping("/searchAll")
	public ModelAndView searchAll(@RequestParam("search") String data) {
		ModelAndView mav = new ModelAndView("/board/searchAll");
		List<RestaurantDTO> restList = service.searchAll(data);
		program.currentDayAll(restList);
		String serachData = data;
		int count = restList.size();
		List<BusanDTO> busan = service.busan();
		List<InternationalDTO> international = service.international();
		mav.addObject("restList", restList);
		mav.addObject("data", data);
		mav.addObject("count", count);
		mav.addObject("busan", busan);
		mav.addObject("intern", international);
		return mav;
	}
	
	@PostMapping("/addRecommend")
	@ResponseBody
	public int addReference(@RequestBody Map<String, Integer> data) {
		int idx = data.get("idx");
		int result = service.addRecommend(idx);
		return result;
	}
	
}
