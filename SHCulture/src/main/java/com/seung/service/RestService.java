package com.seung.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seung.model.BookingDTO;
import com.seung.model.BusanDTO;
import com.seung.model.MenuDTO;
import com.seung.model.ReservationDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.WarningDTO;
import com.seung.program.InsertFile;
import com.seung.program.ReserveTimer;
import com.seung.repository.RestDAO;

@Service
public class RestService {
	
	@Autowired private RestDAO dao;
	@Autowired private InsertFile file;
	@Autowired private ReserveTimer timer;
	
	public int addRest(RestaurantDTO dto) {
		int result = 0;
		result = file.insertRestImg(dto);
		return result;
	}

	public RestaurantDTO getIdx(RestaurantDTO dto) {
		RestaurantDTO restIdx = dao.getIdx(dto);
		return restIdx;
	}

	public int insertMenu(MenuDTO dto) {
		int result = file.insertMenuImg(dto);
		return result;
	}


	public List<RestaurantDTO> userRest(String user) {
		return dao.userRest(user);
	}

	public RestaurantDTO selectUserRest(int idx) {
		return dao.selectUserRest(idx);
	}

	public int modifyRest(RestaurantDTO dto) {
		int result = 0;
		if(dto.getUploadRest()!= null) {
			file.modifyRestImg(dto);
		} else {
			result = dao.modifyRestB(dto);
		}
		return result;
	}

	public List<RestaurantDTO> restMenu(int idx) {
		return dao.restMenu(idx);
	}

	public int modifyMenu(MenuDTO dto) {
		return file.modifyMenu(dto);
	}

	public int deleteMenu(int idx) {
		return dao.deleteMenu(idx);
	}

	public int insertReserve(BookingDTO dto) {
		int result = timer.makeReserve(dto);
		return result;
	}

	public List<BookingDTO> selectBooking(int idx) {
		return dao.selectBooking(idx);
	}

	public int modifyReserve(BookingDTO dto) {
		int result = timer.modifyReserve(dto);
		return result;
	}

	public List<RestaurantDTO> manageRest(String userId) {
		return dao.manageRest(userId);
	}

	public List<ReservationDTO> selectReserListW(int rest) {
		return dao.selectReserListW(rest);
	}
	public List<ReservationDTO> selectReserListD(int rest) {
		return dao.selectReserListD(rest);
	}

	public List<ReservationDTO> reserDateList(Map<String, Object> data) {
		return dao.reserDateList(data);
	}


	public int updateReser(Map<String, Integer> data) {
		return dao.updateReser(data);
	}

	public int deleteRest(int idx) {
		return dao.deleteRest(idx);
	}
	
	public int countWarning(int idx) {
		return dao.countWarning(idx);
	}

	public int insertWarning(WarningDTO dto) {
		return dao.insertWarning(dto);
	}

	public List<WarningDTO> selectWarning(int idx) {
		return dao.selectWarning(idx);
	}

	public List<RestaurantDTO> rankRest() {
		return dao.rankRest();
	}

	
}
