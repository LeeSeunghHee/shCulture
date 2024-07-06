package com.seung.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seung.model.BookingDTO;
import com.seung.model.BusanDTO;
import com.seung.model.InternationalDTO;
import com.seung.model.MenuDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.ReviewDTO;
import com.seung.repository.BoardDAO;

@Service
public class BoardService {
	
	@Autowired private BoardDAO dao;
	
	public List<RestaurantDTO> selectAllRest() {
		return dao.allRest();
	}

	public List<BusanDTO> busan() {
		return dao.busan();
	}
	
	public RestaurantDTO selectRest(int idx) {
		return dao.selectRest(idx);
	}
	
	public RestaurantDTO selectRestLogin(Map<String, Object> data) {
		return dao.selectRestLogin(data);
	}
	
	public List<MenuDTO> selectMenu(int idx) {
		return dao.selectMenu(idx);
	}

	public int checkPick(Map<String, Object> data) {
		return dao.checkPick(data);
	}

	public List<InternationalDTO> international() {
		return dao.international();
	}

	public List<RestaurantDTO> searchOption(List<String> gunList, List<String> interList) {
		return dao.searchOption(gunList, interList);
	}

	public List<RestaurantDTO> searchAll(String data) {
		return dao.searchAll(data);
	}

	public List<BookingDTO> selectBooking(int idx) {
		return dao.selectBooking(idx);
	}

	public List<ReviewDTO> selectReviewOne(int idx) {
		return dao.selectReviewOne(idx);
	}

	public List<ReviewDTO> selectReviewTwo(int idx) {
		return dao.selectReviewTwo(idx);
	}
	
	public int addRecommend(int idx) {
		return dao.addRecommend(idx);
	}

	



}
