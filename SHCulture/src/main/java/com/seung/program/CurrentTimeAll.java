package com.seung.program;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.TextStyle;
import java.time.temporal.TemporalAdjusters;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Component;

import com.seung.model.RestaurantDTO;

@Component
public class CurrentTimeAll {
	public void currentDayAll(List<RestaurantDTO> restList){
		for(RestaurantDTO rst : restList) {
			String restWeek = rst.getRestWeek();
			String restDay = rst.getRestDay();
			String setNow = closeRest(rst.getEndTime(), rst.getStartTime());
//			-연중무휴가 아닌 경우
			if(!restWeek.equals("everDay") && !restDay.equals("all")) {
//				restDay를 DayofWeek로 변환하여 저장
				DayOfWeek closeDay = DayOfWeek.valueOf(restDay);
//				현재 날짜 구하기
				LocalDate currentDate = LocalDate.now();
				
//				--매주인 경우
				if(restWeek.equals("everyWeek")) {
//					현재 날짜의 요일 확인
					DayOfWeek currentDay = currentDate.getDayOfWeek();
					if(currentDay.equals(closeDay)) {
						rst.setCloseDay("휴무");
					} else {
						rst.setCloseDay(setNow);
					}
				}
				
//				-- 매주가 아닌 경우
				else if(restWeek != null && restDay != null) {
//					현재 달의 첫번째 날로 이동
					LocalDate firstdayOfMonth = currentDate.with(TemporalAdjusters.firstDayOfMonth());
					
//					--> 특정 주중 2개 이상일 때
					if(restWeek.contains(",")) {
						String[] strWeek = restWeek.split(",");
						int[] closeWeekes = Arrays.stream(strWeek).mapToInt(Integer::parseInt).toArray();
						for(int closeWeek : closeWeekes) {
							LocalDate nthWeekDay = firstdayOfMonth.with(TemporalAdjusters.nextOrSame(closeDay))
														.plusWeeks(closeWeek-1);
							if(currentDate.equals(nthWeekDay)) {
								rst.setCloseDay("휴무");
								break;
							}else {
								rst.setCloseDay(setNow);
							}
						}
					}
					
//					--> 특정 주가 1개의 주일 때
					else {
						int closeWeek = Integer.parseInt(restWeek);
//						특정주의 특정 요일 구하기 
						LocalDate nthWeekDay = firstdayOfMonth.with(TemporalAdjusters.nextOrSame(closeDay))
														.plusWeeks(closeWeek-1);
						if(currentDate.equals(nthWeekDay)) {
							rst.setCloseDay("휴무");
						}else {
							rst.setCloseDay(setNow);
						}
					}
				}
				
			}
			else if(restWeek.equals("everyDay") && restDay.equals("all")) {
				rst.setCloseDay(setNow);
			}
		}
	}
	
	
	
	public void CurrentDay(RestaurantDTO rst) {
		String restWeek = rst.getRestWeek();
		String restDay = rst.getRestDay();
		String koDay = convertKo(restDay);
		String setNow = closeRest(rst.getEndTime(), rst.getStartTime());
		int even = 0; 
		int odd = 0;
		
//		-연중무휴가 아닌 경우
		if(!restWeek.equals("everDay") && !restDay.equals("all")) {
//			restDay를 DayofWeek로 변환하여 저장
			DayOfWeek closeDay = DayOfWeek.valueOf(restDay);
//			현재 날짜 구하기
			LocalDate currentDate = LocalDate.now();
			
//			--매주인 경우
			if(restWeek.equals("everyWeek")) {
//				현재 날짜의 요일 확인
				DayOfWeek currentDay = currentDate.getDayOfWeek();
				if(currentDay.equals(closeDay)) {
					rst.setCloseDay("휴무");
				} else {
					rst.setCloseDay(setNow);
				}
					rst.setRestTime("매주 " + koDay + " 휴무");
			}
			
//			-- 매주가 아닌 경우
			else if(restWeek != null && restDay != null) {
//				현재 달의 첫번째 날로 이동
				LocalDate firstdayOfMonth = currentDate.with(TemporalAdjusters.firstDayOfMonth());
				
//				--> 특정 주중 2개 이상일 때
				if(restWeek.contains(",")) {
					String[] strWeek = restWeek.split(",");
					int[] closeWeekes = Arrays.stream(strWeek).mapToInt(Integer::parseInt).toArray();
					for(int closeWeek : closeWeekes) {
						if(closeWeek%2 ==0) {
							even++;
						} else {
							odd++;
						}
						
						LocalDate nthWeekDay = firstdayOfMonth.with(TemporalAdjusters.nextOrSame(closeDay))
													.plusWeeks(closeWeek-1);
						if(currentDate.equals(nthWeekDay)) {
							rst.setCloseDay("휴무");
							break;
						} else {
							rst.setCloseDay(setNow);
						}
					}
					rst.setRestTime((even%2 ==0) ? "둘쩨주, 넷째주 " + koDay + " 휴무" : "첫째주, 셋째주 " + koDay + "휴무");
				}
				
//				--> 특정 주가 1개의 주일 때
				else {
					int closeWeek = Integer.parseInt(restWeek);
//					특정주의 특정 요일 구하기 
					LocalDate nthWeekDay = firstdayOfMonth.with(TemporalAdjusters.nextOrSame(closeDay))
													.plusWeeks(closeWeek-1);
					if(currentDate.equals(nthWeekDay)) {
						rst.setCloseDay("휴무");
					} else {
						rst.setCloseDay(setNow);
					}
					rst.setRestTime(restWeek + "째주 " + koDay + " 휴무");
				}
			}
			
		}
		else if(restWeek.equals("everyDay") && restDay.equals("all")) {
			rst.setCloseDay(setNow);
			rst.setRestTime("연중무휴");
		}
	}
	
	public static String convertKo (String restDay) {
		
		switch (restDay) {
        case "MONDAY":
            return "월요일";
        case "TUESDAY":
            return "화요일";
        case "WEDNESDAY":
            return "수요일";
        case "THURSDAY":
            return "목요일";
        case "FRIDAY":
            return "금요일";
        case "SATURDAY":
            return "토요일";
        case "SUNDAY":
            return "일요일";
        default:
            return "유효하지 않은 요일";
		}
	}
	
	public static String closeRest(String closeTime, String startTime) {
		LocalTime current = LocalTime.now();
		LocalTime start = LocalTime.parse(startTime);
		LocalTime close  = LocalTime.parse(closeTime);
		LocalTime spT = LocalTime.of(6, 0); 
		
		if(close.equals(LocalTime.MIDNIGHT)) {
			close = LocalTime.parse("23:59");
		}
		String result = "";
		
		if(current.isAfter(start) && current.isBefore(close)) {
			result = "영업중";
		} 
		else if(start==close) {
			result = "영업중";
		}
		else if(current.isAfter(spT) && current.isBefore(start)){
			result = "영업전";
		}
		else if(current.isBefore(start) || current.isAfter(close)) {
			result = "영업종료";
		} 
		return result;
	}
}
