package com.seung.program;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.seung.model.BookingDTO;
import com.seung.repository.RestDAO;

@Component
public class ReserveTimer {

	@Autowired private RestDAO dao;
	
	public int makeReserve(BookingDTO dto) {
		StringBuilder sb = new StringBuilder();
		List<LocalTime> list = new ArrayList<>();
		
		int rot = dto.getRotation();
		LocalTime breakOne = LocalTime.parse(dto.getBreakTiOne());
		LocalTime breakTwo = LocalTime.parse(dto.getBreakTiTwo());
		list.add(breakOne);
		
		LocalTime time = breakOne;
		if(rot == 30) {
			while(time.isBefore(breakTwo)) {
				time = time.plusMinutes(30);
				list.add(time);
			}
		} else if(rot == 60) {
			while(time.isBefore(breakTwo)) {
				time = time.plusHours(1);
				list.add(time);
			}
		}
		
		
		
		for(LocalTime timeList: list) {
			sb.append(timeList.toString()).append(", ");
		}
		String timeSt = sb.toString();
		timeSt = timeSt.substring(0, timeSt.length()-2);
		dto.setTimer(timeSt);
		int result = dao.addBooking(dto);
		return result;
	}
	
	
	public int modifyReserve(BookingDTO dto) {
		StringBuilder sb = new StringBuilder();
		List<LocalTime> list = new ArrayList<>();
		
		int rot = dto.getRotation();
		LocalTime breakOne = LocalTime.parse(dto.getBreakTiOne());
		LocalTime breakTwo = LocalTime.parse(dto.getBreakTiTwo());
		list.add(breakOne);
		
		LocalTime time = breakOne;
		if(rot == 30) {
			while(time.isBefore(breakTwo)) {
				time = time.plusMinutes(30);
				list.add(time);
			}
		} else if(rot == 60) {
			while(time.isBefore(breakTwo)) {
				time = time.plusHours(1);
				list.add(time);
			}
		}
		
		
		
		for(LocalTime timeList: list) {
			sb.append(timeList.toString()).append(", ");
		}
		String timeSt = sb.toString();
		timeSt = timeSt.substring(0, timeSt.length()-2);
		dto.setTimer(timeSt);
		int result = dao.modifyReserve(dto);
		return result;
	}
}
