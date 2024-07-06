package com.seung.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.seung.model.MemberDTO;
import com.seung.model.ReservationDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.ReviewDTO;
import com.seung.program.InsertFile;
import com.seung.repository.MemberDAO;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	@Autowired private InsertFile file;
	
	public MemberDTO login(MemberDTO dto) {
		return dao.login(dto);
	}

	public int checkID(String id) {
		return dao.checkID(id);
	}

	public int checkNick(String nickname) {
		return dao.checkNick(nickname);
	}

	public int join(MemberDTO dto) {
		int result = 0;
		
		if(dto.getUploadProfile() != null) {
			MultipartFile multiF = dto.getUploadProfile();
			
			if(!multiF.getOriginalFilename().equals("") && multiF != null) {
				File direct = new File("C:\\shCultureMember");
				
				if(direct.exists() == false) {
					direct.mkdir();
				}
				File f = new File(direct, multiF.getOriginalFilename());
				try {
					multiF.transferTo(f);
					
					dto.setProfileImg(f.getName());
					result = dao.join(dto);
				} catch(IllegalStateException | IOException e) {
					e.printStackTrace();
				} 
			} else{
				result =  dao.join(dto);
				System.out.println("dto.getUploadfile == null");
			}
		}
		return result;
	}

	public int checkEmail(String email) {
		return dao.checkEmail(email);
	}


	public int checkPassword(MemberDTO dto) {
		return dao.checkPassword(dto);
	}

	public int deleteMember(String userId) {
		return dao.deleteMember(userId);
	}
	
	public int modifyP(MemberDTO dto) {
		return file.modifyProfile(dto);
	}


	public int insertPick(Map<String, Object> data) {
		return dao.insertPick(data);
	}

	public int checkPick(Map<String, Object> data) {
		return dao.checkPick(data);
	}

	public int deletePick(Map<String, Object> data) {
		return dao.deletePick(data);
	}

	public List<RestaurantDTO> selectPick(String userId) {
		return dao.selectPick(userId);
	}

	public int checkReserve(ReservationDTO dto) {
		return dao.checkReserve(dto);
	}

	public int submitReserve(ReservationDTO dto) {
		return dao.submitReserve(dto);
	}

	public List<ReservationDTO> selectReser(String userId) {
		return dao.selectReser(userId);
	}

	public int insertReview(ReviewDTO dto) {
		return file.insertReviewImg(dto);
	}

	public ReviewDTO selectReview(HashMap<String, Object> map) {
		return dao.selectReview(map);
	}

	public int deleteReview(HashMap<String, Object> map) {
		return dao.deleteReview(map);
	}

	public int updateReview(ReviewDTO dto) {
		return dao.updateReview(dto);
	}

	public List<ReviewDTO> reviewList(String userId) {
		return dao.reviewList(userId);
	}

	public List<ReservationDTO> reserList(String userId) {
		return dao.reserList(userId);
	}

	public List<ReservationDTO> selectReseAndRest(String userId) {
		return dao.selectReseAndRest(userId);
	}

	public String findId(Map<String, String> data) {
		return dao.findId(data);
	}

	public String findPassword(Map<String, String> data) {
		return dao.findPassword(data);
	}

	public int reSetPw(Map<String, String> data) {
		return dao.reSetPw(data);
	}


}
