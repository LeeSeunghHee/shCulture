package com.seung.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seung.model.BookingDTO;
import com.seung.model.BusanDTO;
import com.seung.model.MemberDTO;
import com.seung.model.MenuDTO;
import com.seung.model.QnaDTO;
import com.seung.model.ReservationDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.ReviewDTO;
import com.seung.model.WarningDTO;
import com.seung.service.BoardService;
import com.seung.service.RestService;
import com.seung.program.*;

@Controller
@RequestMapping("/restaurant")
public class RestController {
	
	@Autowired private RestService service;
	@Autowired private BoardService board;
	
	@GetMapping("/insertRest")
	public void insertRest() {}
	
	@ResponseBody
	@PostMapping("/insertRest")
	public int insertRest(@ModelAttribute RestaurantDTO dto, HttpSession restSession) {
		int result = 0;
		result = service.addRest(dto);
		if(result == 1) {
			RestaurantDTO restIdx = service.getIdx(dto);
			restSession.setAttribute("rst", restIdx);
		}
		return result;
	}
	
	@GetMapping("/insertMenu")
	public void insertMenu() {}
	
	
	@ResponseBody
	@PostMapping("/insertMenu")
	public int insertMenu(@ModelAttribute MenuDTO dto) {
		int result = 0;
		result = service.insertMenu(dto);
		System.out.println("insert Controller: " + result);
		return result;
	}
	
	@GetMapping("/insertReserve")
	public void insertReserve() {}
	
	
	@ResponseBody
	@PostMapping("/insertReserve")
	public int insertReserve(@ModelAttribute BookingDTO dto) {
		int result = service.insertReserve(dto);
		return result;
	}
	
	@GetMapping("/userRest")
	public ModelAndView userRest(HttpSession session) {
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		List<RestaurantDTO> restList = service.userRest(dto.getUserId());
		ModelAndView mav = new ModelAndView();
		mav.addObject("userRest", restList);
		return mav;
	}
	
	@GetMapping("/modifyRest/{idx}")
	public ModelAndView modifyRest(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/restaurant/modifyRest");
		RestaurantDTO dto = service.selectUserRest(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/modifyRest")
	public int modifyRest(@ModelAttribute RestaurantDTO dto) {
		int result = service.modifyRest(dto);
		return result;
	}
	
	@GetMapping("/modifyMenu/{idx}")
	public ModelAndView modifyMenu(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/restaurant/modifyMenu");
		List<RestaurantDTO> dto = service.restMenu(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/modifyMenu")
	public int modifyMenu(@ModelAttribute MenuDTO dto) {
		int result = 0;
		result = service.modifyMenu(dto);
		System.out.println("modify controller: " + result);
		return result;
	}
	
	@GetMapping("/modifyReserve/{idx}")
	public ModelAndView modifyReserve(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/restaurant/modifyReserve");
		List<BookingDTO> dto = service.selectBooking(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/modifyReserve")
	public int modifyReserve(@ModelAttribute BookingDTO dto) {
		int result = service.modifyReserve(dto);
		return result;
	}
	
	@GetMapping("/deleteMenu/{idx}")
	public String deleteMenu(@PathVariable("idx") int idx) {
		int result = 0;
		result = service.deleteMenu(idx);
		System.out.println(result);
		return "redirect:/restaurant/modifyMenu/{idx}";
	}
	
	 @GetMapping("/manageReser")
	 public ModelAndView manageReser(HttpSession session) {
		 ModelAndView mav = new ModelAndView();
		 MemberDTO dto = (MemberDTO)session.getAttribute("login");
		 List<RestaurantDTO> rest = service.manageRest(dto.getUserId());
		mav.addObject("rest", rest);
		return mav;
	 }
	 
	 
	 @GetMapping("/manageReserList")
	 public ModelAndView selectReserIdx(@RequestParam("rest") int rest , @RequestParam("selectDate") String selectDate,HttpSession session) {
		 Map<String, Object> data = new HashMap<String, Object>();
		 data.put("rest", rest);
		 data.put("selectDate", selectDate);
		 System.out.println("rest: " + rest);
		 System.out.println("selectDate: " + selectDate);
		 ModelAndView mav = new ModelAndView("/restaurant/manageReserList"); 
		 MemberDTO dto = (MemberDTO)session.getAttribute("login");
		 List<RestaurantDTO> restaurant = service.manageRest(dto.getUserId());
		 List<ReservationDTO> listW = service.selectReserListW(rest);
		 List<ReservationDTO> listD = service.selectReserListD(rest);
		 List<ReservationDTO> selectD = service.reserDateList(data);
		 mav.addObject("listW", listW);
		 mav.addObject("listD", listD);
		 mav.addObject("restaurant", restaurant);
		 mav.addObject("selectD", selectD);
		 return mav;
	 }
	 
	 @ResponseBody
	 @PostMapping("/updateReser")
	 public int updateReser(@RequestBody Map<String, Integer> data) {
		 int idx = data.get("idx");
		 int approval = data.get("approval");
		 int result = service.updateReser(data);
		 return result;
	 }
	 
	 @ResponseBody
	 @PostMapping("/deleteRest")
	 public int deleteRest(@RequestBody Map<String, Integer> data) {
		 int idx = data.get("idx");
		 int result = service.deleteRest(idx);
		 return result;
	 }
	 
	 @GetMapping("/manageReview")
	 public ModelAndView manageReview(HttpSession session) {
		 ModelAndView mav = new ModelAndView();
		 MemberDTO dto = (MemberDTO)session.getAttribute("login");
		 List<RestaurantDTO> rest = service.manageRest(dto.getUserId());
		 mav.addObject("rest", rest);
		 return mav;
	 }
	 
	 @GetMapping("/manageReviewList")
	 public ModelAndView manageReviewList(@RequestParam("rest") int idx, HttpSession session) {
		 ModelAndView mav = new ModelAndView("/restaurant/manageReviewList");
		 MemberDTO dto = (MemberDTO)session.getAttribute("login");
		 List<RestaurantDTO> rest = service.manageRest(dto.getUserId());
		 List<ReviewDTO> rankOne = board.selectReviewOne(idx);
		 List<ReviewDTO> rankTwo = board.selectReviewTwo(idx);
		 List<WarningDTO> warning = service.selectWarning(idx);
		 mav.addObject("rest", rest);
		 mav.addObject("rankOne", rankOne);
		 mav.addObject("rankTwo", rankTwo);
		 mav.addObject("warning", warning);
		 return mav;
	 }
	 
	 @ResponseBody
	 @PostMapping("/countWarning")
	 public int selectWarning(@RequestBody Map<String, Integer> data) {
		 int idx = data.get("idx");
		 int result = service.countWarning(idx);
		 System.out.println(result);
		 return result;
	 }
	 
	 @ResponseBody
	 @PostMapping("/submitWarning")
	 public int submitWarning(@ModelAttribute WarningDTO dto ) {
		 int result = service.insertWarning(dto);
		 return result;
	 }
}

