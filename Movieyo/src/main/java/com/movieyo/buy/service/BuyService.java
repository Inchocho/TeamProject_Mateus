package com.movieyo.buy.service;

import java.util.List;
import java.util.Map;

import com.movieyo.buy.dto.BuyDto;

public interface BuyService {

	public int buySelectTotalCount(String searchOption, String keyword, int userNo, int userAdmin);

	public List<Map<String, Object>> buySelectList(String searchOption, String keyword, int start, int end, int userNo, int userAdmin);

	public int buyInsertOne(BuyDto buyDto);

	public int buyExistOne(int userNo, int movieNo);

	public int buyStatusCheck(int userNo, int movieNo);
	
	public void buyStatusUpdate(int userNo, int movieNo);

	public int selectRefundNo(int userNo, int movieNo);

	public void refundRequestUpdate(int buyNo);

	public void refundRequestDeny(int buyNo);

	public int totalMoney();

	public int refundMoney();
}
