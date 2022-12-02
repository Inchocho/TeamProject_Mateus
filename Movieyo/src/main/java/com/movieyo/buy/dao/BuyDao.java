package com.movieyo.buy.dao;

import java.util.List;
import java.util.Map;

import com.movieyo.buy.dto.BuyDto;

public interface BuyDao {

	public int buySelectTotalCount(String searchOption, String keyword, int userNo, int userAdmin);

	public List<Map<String, Object>> buySelectList(String searchOption, String keyword, int start, int end, int userNo, int userAdmin);

	public int buyInsertOne(BuyDto buyDto);

	public int buyExistOne(int userNo, int movieNo);

	//12월 2일 환불처리 후 다시 재구매할때 구매내역에서 상태를 확인 후 insert가 아닌 이미 존재하는 구매내역의 상태를 변경
	public int buyStatusCheck(int movieNo);
	
	public void buyStatusUpdate(int movieNo);
}
