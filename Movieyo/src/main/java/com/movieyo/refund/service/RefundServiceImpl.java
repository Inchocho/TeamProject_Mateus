package com.movieyo.refund.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieyo.refund.dao.RefundDao;
import com.movieyo.refund.dto.RefundDto;
import com.movieyo.user.dto.UserDto;

@Service
public class RefundServiceImpl implements RefundService {
	
	private static final Logger log 
	= LoggerFactory.getLogger(RefundServiceImpl.class);	

	@Autowired
	public RefundDao refundDao;

	@Override
	public int refundSelectTotalCount(String searchOption, String keyword, int userNo, int userAdmin) {
		// TODO Auto-generated method stub
		return refundDao.refundSelectTotalCount(searchOption, keyword, userNo, userAdmin);
	}

	@Override
	public List<Map<String, Object>> refundSelectList(String searchOption, String keyword
			, int start, int end, int userNo, int userAdmin) {
		// TODO Auto-generated method stub
		return refundDao.refundSelectList(searchOption, keyword, start, end, userNo, userAdmin);
	}

	@Override
	public void refundInsertOne(int buyNo, int userNo) {
		// TODO Auto-generated method stub
		refundDao.refundInsertOne(buyNo, userNo);
	}

	@Override
	public int refundExist(int buyNo, int userNo) {
		// TODO Auto-generated method stub
		return refundDao.refundExist(buyNo, userNo);
	}

	@Override
	public int updateRefund(RefundDto refundDto, int admit) {
		// TODO Auto-generated method stub
		//admit 0 -> 환불불가 admit 1 -> 환불
		
		return refundDao.updateRefund(refundDto, admit);
		
	}

	@Override
	public int updateCash(int userNo, int moviePrice) {
		// TODO Auto-generated method stub
		
		//환불이 성공적으로 성공시 영화가격만큼 유저 캐쉬 증가
		return refundDao.updateCash(userNo, moviePrice);
		
	}
	
	@Override
	public void updateBuy(int buyNo) {
		
		//환불이 성공적으로 성공시 (1)환불완료 -> (2)환불한 영화가격만큼 유저의 캐쉬증가 -> (3)구매상태 환불됨으로 변경
		refundDao.updateBuy(buyNo);
	}

	@Override
	public int checkCash(int userNo) {
		// TODO Auto-generated method stub
		
		//환불이 성공적으로 완료 후 캐쉬가 갱신된후 해당 회원의 캐쉬를 조회
		return refundDao.checkCash(userNo);
	}

	//11월30일 체크장르 (유저의 선호장르를 확인하기위한 리스트타입 쿼리 -> 유저로 옮길예정)
	@Override
	public List<UserDto> checkGenre(int userNo) {
		// TODO Auto-generated method stub
		
		//(refundDao -> userDao로 변경필요)
		return refundDao.checkGenre(userNo);
	}

	@Override
	public String genreName(int genreNo) {
		// TODO Auto-generated method stub
		
		return refundDao.genreName(genreNo);
	}

	@Override
	public void refundDelete(int refundNo) {
		// TODO Auto-generated method stub
		refundDao.refundDelete(refundNo);
	}


}
