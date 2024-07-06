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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seung.model.MemberDTO;
import com.seung.model.ReservationDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.ReviewDTO;
import com.seung.program.Mail;
import com.seung.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired private MemberService service;
	@Autowired private Mail mail;

	@GetMapping("/login")
	public void login() {
	}

	@ResponseBody
	@PostMapping("/login")
	public int login(@ModelAttribute MemberDTO dto, HttpSession session) {
		MemberDTO login = service.login(dto);
		int result = 0;
		if (login != null) {
			result = 1;
			session.setAttribute("login", login);
		}
		return result;
	}
	
	@GetMapping("/findPassword")
	public void findPassword() {}
	
	@ResponseBody
	@PostMapping("/findPassword")
	public int findPassword(@RequestBody Map<String, String> data) {
		String passWord = service.findPassword(data);
		int result = 0;
		if(passWord != null) {
			result = 1;
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/reSetPw")
	public int reSetPw(@RequestBody Map<String, String> data) {
		int result = service.reSetPw(data);
		return result;
	}
	

	@GetMapping("/findId")
	public void findId() {}
	
	@ResponseBody
	@PostMapping("/findId")
	public String findId(@RequestBody Map<String, String> data) {
		String userId = service.findId(data);
		return userId;
	}
	
	@GetMapping("/joinM")
	public void joinM() {
	}

	@ResponseBody
	@PostMapping("/joinM")
	public int joinM(@ModelAttribute MemberDTO dto) {
		int result = service.join(dto);
		System.out.println(result);
		return result;
	}

	@GetMapping("/joinO")
	public void joinO() {
	}

	@ResponseBody
	@PostMapping("/joinO")
	public int joinO(@ModelAttribute MemberDTO dto, HttpSession session) {
		int result = service.join(dto);
		if(result == 1) {
			MemberDTO login = service.login(dto);
			session.setAttribute("login", login);
		}
		System.out.println(result);
		return result;
	}

	@ResponseBody
	@PostMapping("/checkId")
	public int idCheck(@RequestBody Map<String, String> requestData) {
		String id = requestData.get("id");
		int cnt = service.checkID(id);
		return cnt;
	}

	@ResponseBody
	@PostMapping("/checkNickName")
	public int nickCheck(@RequestBody Map<String, String> requestData) {
		String nickname = requestData.get("nickname");
		int cnt = service.checkNick(nickname);
		return cnt;
	}

	@ResponseBody
	@PostMapping("/checkEmail")
	public int emailCheck(@RequestBody Map<String, String> requsetData) {
		String email = requsetData.get("email");
		int cnt = service.checkEmail(email);
		return cnt;
	}
	
	@ResponseBody
	@PostMapping("/accessEmailNum")
	public String accessEmailNum(@RequestBody String email) {
	    return mail.sendContent(email);
	}


	@GetMapping("/checkMember")
	public void checkMember() {}
	   
	
	@ResponseBody
	@PostMapping("/deleteMember")
	public int deleteMember(@RequestBody Map<String, String> requestData, HttpSession session) {
		String userId = requestData.get("userId");
		int result = service.deleteMember(userId);
		session.invalidate();
		return result;
	}
	
	
	@GetMapping("/mypageM")
	public ModelAndView mypageM(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userId = dto.getUserId();
		List<RestaurantDTO> rest = service.selectPick(userId);
		List<ReviewDTO> review = service.reviewList(userId);
		List<ReservationDTO> reser = service.reserList(userId);
		mav.addObject("rest", rest);
		mav.addObject("review", review);
		mav.addObject("reser", reser);
		return mav;
	}
	
	@GetMapping("/mypageO")
	public void mypageO() {}
	
	
	@GetMapping("/writeReview")
	public ModelAndView writeReview(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userId = dto.getUserId();
		List<ReservationDTO> reser = service.selectReser(userId);
		mav.addObject("reser", reser);
		return mav;
	}
	
	
	@ResponseBody
	@PostMapping("/writeReview")
	public int writeReview(@ModelAttribute ReviewDTO dto) {
		int result = service.insertReview(dto);
		return result;
	}
	
	@GetMapping("/myPick")
	public ModelAndView myPick(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userId = dto.getUserId();
		List<RestaurantDTO> rest = service.selectPick(userId);
		mav.addObject("rest", rest);
		return mav;
	}
	
	
	@GetMapping("/selectReview/{idx}")
	public ModelAndView selectReview(@PathVariable("idx") int idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("/member/selectReview");
		HashMap<String, Object> map = new HashMap<>();
		MemberDTO id = (MemberDTO)session.getAttribute("login");
		String userId = id.getUserId();
		map.put("idx", idx);
		map.put("userId", userId);
		ReviewDTO dto = service.selectReview(map);
		List<ReservationDTO> reser = service.selectReser(userId);
		mav.addObject("dto", dto);
		mav.addObject("reser", reser);
		return mav;
	}
	
	@ResponseBody
	@PostMapping("deleteReview")
	public int deleteReview(@RequestBody HashMap<String, Integer> request, HttpSession session) {
		HashMap<String , Object> map = new HashMap<>();
		MemberDTO id = (MemberDTO)session.getAttribute("login");
		String userId = id.getUserId();
		int rest = request.get("rest");
		map.put("rest", rest);
		map.put("userId", userId);
		int result = service.deleteReview(map);
		return result;
	}
	
	@GetMapping("/modifyP")
	public void modifyP() {}

	
	@ResponseBody
	@PostMapping("/modifyP")
	public int modifyP(@ModelAttribute MemberDTO dto, HttpSession session) {
		if(dto.getUserPw() == null) {
			MemberDTO member = (MemberDTO)session.getAttribute("login");
			String pw = member.getUserPw();
			dto.setUserPw(pw);
		}
		int result = service.modifyP(dto);
		if(result == 1) {
			MemberDTO login = service.login(dto);
			session.setAttribute("login", login);
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/checkPassword")
	public int checkPassword(@RequestBody Map<String, String> rd) {
		MemberDTO dto = new MemberDTO();
		dto.setUserId(rd.get("userId").toString());
		dto.setUserPw(rd.get("userPw"));
		System.out.println(dto);
		int result = service.checkPassword(dto);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/insertPick")
	public int insertPick(@RequestBody Map<String, Object> data) {
		int result = 0;
		data.get("userId");
		data.get("rest");
		int check = service.checkPick(data);
		System.out.println("check: " + check);
		if(check == 0) {
			System.out.println("insertPick");
			result = service.insertPick(data); 
		} else if(check == 1) {
			System.out.println("deletePick");
			result = service.deletePick(data);
			result += check;
		}
		System.out.println("insertPick: " + result);
		return result;
	}
	
	
	
	 @ResponseBody
	 @PostMapping("/submitReserve") 
	 public int submitReserve(@ModelAttribute ReservationDTO dto){ 
		 int result = 0; 
		 int check = service.checkReserve(dto);
		 if(check == 0) { 
			 result = service.submitReserve(dto); 
		 }else if(check == 1) {
			 result = 2; 
		 } 
		 System.out.println(result);
		return result; 
	 }
	 
	 @ResponseBody
	 @PostMapping("/updateReview")
	 public int updateReview(@ModelAttribute ReviewDTO dto) {
		 int result = service.updateReview(dto);
		 return result;
	 }
	 
	 @GetMapping("/restBooking")
	 public ModelAndView restBooking(HttpSession session) {
		 ModelAndView mav = new ModelAndView();
		 MemberDTO member = (MemberDTO)session.getAttribute("login");
		 String userId = member.getUserId();
		 List<ReservationDTO> reser = service.selectReseAndRest(userId);
		 mav.addObject("reser",reser);
		 return mav;
	 }
	 
}
