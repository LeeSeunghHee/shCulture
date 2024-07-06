package com.seung.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seung.model.MemberDTO;
import com.seung.model.QnaDTO;
import com.seung.model.ReplyDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.WarningDTO;
import com.seung.service.BoardService;
import com.seung.service.ManageService;


@Controller
@RequestMapping("/manager")
public class ManagerController {

	@Autowired private ManageService service;
	
	@GetMapping("/manageHome")
	public ModelAndView manageHome(@RequestParam("selectCate")String category, @RequestParam("search")String search, @RequestParam("idx")String idx) {
		ModelAndView mav = new ModelAndView();
		if(category.equals("매장관리")) {
			if(search != "") {
				List<RestaurantDTO> rest = service.searchRest(search);
				mav.addObject("rest", rest);
			} else {
				List<RestaurantDTO> rest = service.restList();
				mav.addObject("rest", rest);
			}
		}if(category.equals("댓글관리")) {
			List<WarningDTO> warning = service.warningList(search);
			mav.addObject("warning", warning);
			if(idx != "") {
				String[] idxL = idx.split("_");
				Map<String, String> data = new HashMap<>();
				data.put("idx", idxL[0]);
				data.put("approval", idxL[1]);
				WarningDTO sw = service.selectWarning(data);
				mav.addObject("sw", sw);
			}
		}
		return mav;
	}
	
	@GetMapping("/qnaPage")
	public ModelAndView qnaPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = ((MemberDTO)session.getAttribute("login"));
		if(dto != null) {
			String userId = dto.getUserId();
			List<QnaDTO> qna = service.selectQnaUser(userId);
			QnaDTO d = service.countQna(userId);
			int count = d.getCountQna();
			mav.addObject("qna", qna);
			mav.addObject("count", count);
		}
		return mav;
	}
	
	@GetMapping("/qnaSubmit")
	public void qnaSubmit() {}
	
	@ResponseBody
	@PostMapping("/addQna")
	public int addQna(@ModelAttribute QnaDTO dto) {
		int result = service.addQna(dto);
		return result;
	}
	
	 @GetMapping("/selectQna")
	 public ModelAndView selectQna(@RequestParam("idx") int idx) {
		 ModelAndView mav = new ModelAndView("/manager/selectQna");
		 QnaDTO dto = service.selectQna(idx);
		 ReplyDTO reply = new ReplyDTO();
		 int rep = dto.getRep();
		 if(rep == 1) {
			 reply = service.selectReply(idx);
		 }
		 mav.addObject("dto", dto);
		 mav.addObject("reply", reply);
		 return mav;
	 }
	 
	 @GetMapping("/manageQna")
	 public ModelAndView manageQna(@RequestParam("checkOp")String checkOp, @RequestParam("search")String search, @RequestParam("idx")Integer idx) {
		 ModelAndView mav = new ModelAndView("/manager/manageQna");
		 Map <String, String> data = new HashMap<>();
		 data.put("checkOp", checkOp);
		 data.put("search", search);
		 List<QnaDTO> list = service.selectOptionQna(data);
		 if(idx != null) {
			 QnaDTO dto = service.selectMQ(idx);
			 ReplyDTO reply = service.selectReply(idx);
			 System.out.println(idx);
			 mav.addObject("dto", dto);
			 mav.addObject("reply", reply);
		 }
		 mav.addObject("list", list);
		 return mav;
	 }
	 
	 @ResponseBody
	 @PostMapping("/deleteQna")
	 public int deleteQna(@RequestBody HashMap<String, Integer> request) {
		 int idx = request.get("idx");
		 int result = service.deleteQna(idx);
		 return result;
	 }
	 
	 @GetMapping("/modifyQna")
	 public ModelAndView modifyQna(@RequestParam("idx") int idx) {
		 ModelAndView mav = new ModelAndView("/manager/modifyQna");
		 QnaDTO dto = service.selectQna(idx);
		 mav.addObject("dto", dto);
		 return mav;
	 }
	 
	 @ResponseBody
	 @PostMapping("/modifyQna")
	 public int modifyQna(@ModelAttribute QnaDTO dto){
		 int result = service.modifyQna(dto);
		 return result;
	 }
	 
	 @ResponseBody
	 @PostMapping("/submitReply")
	 public int submitReply(@ModelAttribute ReplyDTO dto) {
		 int result = service.insertReply(dto);
		 return result;
	 }
	 
	 @ResponseBody
	 @PostMapping("/updateReply")
	 public int updateReply(@ModelAttribute ReplyDTO dto) {
		 int result = service.updateReply(dto);
		 return result;
	 }
	 
	 @ResponseBody
	 @PostMapping("/deleteRest")
	 public int deleteRest(@RequestBody Map<String, Integer> data) {
		 int idx = data.get("idx");
		 int result = service.deleteRest(idx);
		 return result;
	 }
	 
	 @ResponseBody
	 @PostMapping("/updateWarning")
	 public int updateWarning(@ModelAttribute WarningDTO dto) {
		 int result = service.updateWarning(dto);
		 return result;
	 }
}


