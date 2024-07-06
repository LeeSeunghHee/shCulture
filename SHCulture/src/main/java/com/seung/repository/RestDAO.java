package com.seung.repository;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.seung.model.BookingDTO;
import com.seung.model.MenuDTO;
import com.seung.model.ReservationDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.WarningDTO;

@Repository
public interface RestDAO {

	int insertRest(RestaurantDTO dto);

	RestaurantDTO getIdx(RestaurantDTO dto);

	int insertMenu(MenuDTO dto);

	List<RestaurantDTO> userRest(String user);

	RestaurantDTO selectUserRest(int idx);

	int modifyRest(RestaurantDTO dto);

	int modifyRestA(RestaurantDTO dto);
	
	int modifyRestB(RestaurantDTO dto);

	List<RestaurantDTO> restMenu(int idx);

	int modifyMenuA(MenuDTO dto);

	int modifyMenuB(MenuDTO dto);

	int deleteMenu(int idx);

	int addBooking(BookingDTO dto);

	List<BookingDTO> selectBooking(int idx);

	int modifyReserve(BookingDTO dto);

	List<RestaurantDTO> manageRest(String userId);

	List<ReservationDTO> selectReserListW(int rest);
	
	List<ReservationDTO> selectReserListD(int rest);

	List<ReservationDTO> reserDateList(Map<String, Object> data);


	int updateReser(Map<String, Integer> data);

	int deleteRest(int idx);
	
	int countWarning(int idx);

	int insertWarning(WarningDTO dto);

	List<WarningDTO> selectWarning(int idx);

	List<RestaurantDTO> rankRest();

	
}
