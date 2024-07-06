package com.seung.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.seung.model.MemberDTO;
import com.seung.model.ReservationDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.ReviewDTO;

@Repository
public interface MemberDAO {

	MemberDTO login(MemberDTO dto);

	MemberDTO loginCheck(MemberDTO dto);

	int checkID(String id);

	int checkNick(String nickname);
	
	int checkEmail(String email);

	int join(MemberDTO dto);

	MemberDTO selectUser();

	int checkPassword(MemberDTO dto);

	int deleteMember(String userId);
	
	int modifyPA(MemberDTO dto);
	
	int modifyPB(MemberDTO dto);

	int checkPick(Map<String, Object> data);

	int insertPick(Map<String, Object> data);

	int deletePick(Map<String, Object> data);

	List<RestaurantDTO> selectPick(String userId);

	int checkReserve(ReservationDTO dto);

	int submitReserve(ReservationDTO dto);

	List<ReservationDTO> selectReser(String userId);

	int insertReview(ReviewDTO dto);

	ReviewDTO selectReview(HashMap<String, Object> map);

	int deleteReview(HashMap<String, Object> map);

	int updateReview(ReviewDTO dto);

	List<ReviewDTO> reviewList(String userId);

	List<ReservationDTO> reserList(String userId);

	List<ReservationDTO> selectReseAndRest(String userId);

	String findId(Map<String, String> data);

	String findPassword(Map<String, String> data);

	int reSetPw(Map<String, String> data);


}
