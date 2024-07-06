package com.seung.program;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.cache.decorators.FifoCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.seung.model.MemberDTO;
import com.seung.model.MenuDTO;
import com.seung.model.RestaurantDTO;
import com.seung.model.ReviewDTO;
import com.seung.repository.MemberDAO;
import com.seung.repository.RestDAO;
import com.sun.mail.handlers.multipart_mixed;

@Component
public class InsertFile {
	
	@Autowired private RestDAO rdao;
	@Autowired private MemberDAO mdao;
	
	public int insertRestImg(RestaurantDTO dto) {
		int result = 0;
		
		if (dto.getUploadRest() != null) {
			MultipartFile multiF = dto.getUploadRest();
			
			if(!multiF.getOriginalFilename().equals("") && multiF != null) {
				File direct = new File("C:\\shCultureRest");
				
				if(direct.exists() == false) {
					direct.mkdir();
				}
				File f = new File(direct, multiF.getOriginalFilename());
				System.out.println("getOriginalFilenaem: "+ multiF.getOriginalFilename());
				try {
					multiF.transferTo(f);
					
					dto.setRestImg(f.getName());
					System.out.println("restImg: " + dto.getRestImg());
					result = rdao.insertRest(dto);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			} 
		} 
		else {
			result = rdao.insertRest(dto);
		}
		return result;
	}
	
	
	public int insertMenuImg(MenuDTO dto) {
		int result = 0;
		
		if(dto.getMenuUpload() != null) {
			MultipartFile multiF = dto.getMenuUpload();
			
			if(!multiF.getOriginalFilename().equals("") && multiF != null) {
				File direct = new File("C:\\shCultureMenu");
				
				if(direct.exists() == false) {
					direct.mkdir();
				}
				File f = new File(direct, multiF.getOriginalFilename());
				try {
					multiF.transferTo(f);
					
					dto.setMenuImg(f.getName());
					result = rdao.insertMenu(dto);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			} 
			else {
				result = rdao.insertMenu(dto);
			}
		}
		return result;
	}
	
	public int modifyRestImg(RestaurantDTO dto) {
		int result = 0;
		
		if(dto.getUploadRest() != null) {
			MultipartFile multiF = dto.getUploadRest();
			if(!multiF.getOriginalFilename().equals("") && multiF != null) {
				File direct = new File("C:\\shCultureRest");
				
				if(direct.exists() == false) {
					direct.mkdirs();
				}
				File f = new File(direct, multiF.getOriginalFilename());
				try {
					multiF.transferTo(f);
					dto.setRestImg(f.getName());
					result = rdao.modifyRestA(dto);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		} 
		return result;
	}
	
	public int modifyMenu(MenuDTO dto) {
		int result = 0;
		if(dto.getMenuUpload() != null) {
			MultipartFile multiF = dto.getMenuUpload();
			if(!multiF.getOriginalFilename().equals("") && multiF != null) {
				File direct = new File("C:\\shCultureMenu");
				
				if(direct.exists() == false) {
					direct.mkdirs();
				}
				File f = new File(direct, multiF.getOriginalFilename());
				try {
					multiF.transferTo(f);
					dto.setMenuImg(f.getName());
					
					System.out.println("modifyMenuA");
					result = rdao.modifyMenuA(dto);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			} else {
				System.out.println("modifyMenuB");
				result = rdao.modifyMenuB(dto);
			}
		}
		return result;
	}
	
	public int modifyProfile(MemberDTO dto) {
		int result = 0;
		if(dto.getUploadProfile()!= null) {
			MultipartFile multiF = dto.getUploadProfile();
			if(!multiF.getOriginalFilename().equals("") && multiF != null) {
				File direct = new File("C:\\shCultureMember");
				
				if(direct.exists() == false) {
					direct.mkdirs();
				}
				File f = new File(direct, multiF.getOriginalFilename());
				try {
					multiF.transferTo(f);
					dto.setProfileImg(f.getName());
					
					result = mdao.modifyPA(dto);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		} else {
			result = mdao.modifyPB(dto);
		}
		return result;
	}
	
	public int insertReviewImg(ReviewDTO dto) {
		int result = 0;
		List<String> list = new ArrayList<>();
		
		if(dto.getUploadReview() != null) {
			for(int i = 0; i < dto.getUploadReview().size(); i++) {
				MultipartFile mulfiF = dto.getUploadReview().get(i);
				if(!mulfiF.getOriginalFilename().contentEquals("") && mulfiF != null) {
					list.add(mulfiF.getOriginalFilename());
					File direct = new File("C:\\shCultureReview");
					
					if(direct.exists() == false) {
						direct.mkdirs();
					}
					File f = new File(direct, mulfiF.getOriginalFilename());
					try {
						mulfiF.transferTo(f);
						if(i == dto.getUploadReview().size()-1) {
							String fileName = Arrays.toString(list.stream().map(s -> "'" + s + "'").toArray());
							fileName = fileName.substring(1, fileName.length() - 1);
							dto.setReviewImg(fileName);
							result = mdao.insertReview(dto);
							System.out.println(fileName);
						}
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				} else {
					result = mdao.insertReview(dto);
				}
			}
		}
		return result;
	}
}
