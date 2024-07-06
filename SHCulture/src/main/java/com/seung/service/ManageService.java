package com.seung.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.seung.model.MemberDTO;
import com.seung.model.QnaDTO;
import com.seung.model.ReplyDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.WarningDTO;
import com.seung.repository.ManagerDAO;

@Service
public class ManageService {
	
	
	@Autowired private ManagerDAO dao;
	
	public List<QnaDTO> selectQnaUser(String userId) {
		return dao.selectQnaUser(userId);
	}

	public int addQna(QnaDTO dto) {
		return dao.addQna(dto);
	}

	public QnaDTO selectQna(int idx) {
		return dao.selectQna(idx);
	}

	public ReplyDTO selectReply(int idx) {
		return dao.selectReply(idx);
	}

	public QnaDTO countQna(String userId) {
		return dao.countQna(userId);
	}

	public List<QnaDTO> selectOptionQna(Map<String, String> data) {
		return dao.selectOptionQna(data);
	}

	public int deleteQna(int idx) {
		return dao.deleteQna(idx);
	}

	public int modifyQna(QnaDTO dto) {
		return dao.modifyQna(dto);
	}

	public QnaDTO selectMQ(int id) {
		return dao.selectMQ(id);
	}

	public int insertReply(ReplyDTO dto) {
		return dao.insertReply(dto);
	}

	public int updateReply(ReplyDTO dto) {
		return dao.updateReply(dto);
	}

	public List<RestaurantDTO> restList() {
		return dao.restList();
	}

	public List<WarningDTO> warningList(String search) {
		return dao.warningList(search);
	}

	public List<RestaurantDTO> searchRest(String search) {
		return dao.searchRest(search);
	}

	public int deleteRest(int idx) {
		return dao.deleteRest(idx);
	}

	public WarningDTO approvalWarning(int idx) {
		return dao.approvalWarning(idx);
	}

	public WarningDTO selectWarning(Map<String, String> data) {
		return dao.selectWarning(data);
	}

	public int updateWarning(WarningDTO dto) {
		return dao.updateWarning(dto);
	}




	
}
