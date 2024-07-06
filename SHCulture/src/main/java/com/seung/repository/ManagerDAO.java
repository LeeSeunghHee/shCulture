package com.seung.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.seung.model.MemberDTO;
import com.seung.model.QnaDTO;
import com.seung.model.ReplyDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.WarningDTO;

@Repository
public interface ManagerDAO {

	List<QnaDTO> selectQnaUser(String userId);

	int addQna(QnaDTO dto);

	QnaDTO selectQna(int idx);

	ReplyDTO selectReply(int idx);

	QnaDTO countQna(String userId);

	List<QnaDTO> selectOptionQna(Map<String, String> data);

	int deleteQna(int idx);

	int modifyQna(QnaDTO dto);

	QnaDTO selectMQ(int id);

	int insertReply(ReplyDTO dto);

	int updateReply(ReplyDTO dto);

	List<RestaurantDTO> restList();

	List<WarningDTO> warningList(String search);

	List<RestaurantDTO> searchRest(String search);

	int deleteRest(int idx);

	WarningDTO approvalWarning(int idx);

	WarningDTO selectWarning(Map<String, String> data);

	int updateWarning(WarningDTO dto);


}
