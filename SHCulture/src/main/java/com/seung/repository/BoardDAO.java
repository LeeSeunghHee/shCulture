package com.seung.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.seung.model.BookingDTO;
import com.seung.model.BusanDTO;
import com.seung.model.InternationalDTO;
import com.seung.model.MenuDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.ReviewDTO;

@Repository
public interface BoardDAO {
	
	List<RestaurantDTO> allRest();

	List<BusanDTO> busan();

	RestaurantDTO selectRest(int idx);
	
	List<MenuDTO> selectMenu(int idx);

	int checkPick(Map<String, Object> data);

	RestaurantDTO selectRestLogin(Map<String, Object> data);

	List<InternationalDTO> international();

	List<RestaurantDTO> searchOption(@Param("gunList") List<String> gunList, @Param("interList") List<String> interList);

	List<RestaurantDTO> searchAll(String data);

	List<BookingDTO> selectBooking(int idx);

	List<ReviewDTO> selectReviewOne(int idx);

	List<ReviewDTO> selectReviewTwo(int idx);
	
	int addRecommend(int idx);



}
