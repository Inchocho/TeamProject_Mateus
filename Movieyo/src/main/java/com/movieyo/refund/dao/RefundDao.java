package com.movieyo.refund.dao;

import java.util.List;
import java.util.Map;

import com.movieyo.refund.dto.RefundDto;
import com.movieyo.user.dto.UserDto;

public interface RefundDao {

	public List<Map<String, Object>> refundSelectList(String searchOption, String keyword, int start, int end, int userNo, int userAdmin);

	public int refundSelectTotalCount(String searchOption, String keyword, int userNo, int userAdmin);

	public void refundInsertOne(int buyNo, int userNo);

	public int refundExist(int buyNo, int userNo);

	public int updateRefund(RefundDto refundDto, int admit);

	public int updateCash(int userNo, int moviePrice);

	public void updateBuy(int buyNo);

	public int checkCash(int userNo);

	//11월30일 체크장르 (유저의 선호장르를 확인하기위한 리스트타입 쿼리 -> 유저로 옮길예정)
	public List<UserDto> checkGenre(int userNo);

	public String genreName(int genreNo);

	public void refundDelete(int refundNo);

		
}
