package com.movieyo.refund.service;

import java.util.List;
import java.util.Map;

import com.movieyo.refund.dto.RefundDto;

public interface RefundService {

	public List<Map<String, Object>> refundSelectList(String searchOption, String keyword, int start, int end, int userNo, int userAdmin);

	public int refundSelectTotalCount(String searchOption, String keyword, int userNo, int userAdmin);

	public void refundInsertOne(int buyNo, int userNo);

	public int refundExist(int buyNo, int userNo);

	public int updateRefund(RefundDto refundDto, int admit);

	public int updateCash(int userNo, int moviePrice);
	
	public void updateBuy(int buyNo);

	public int checkCash(int userNo);

}
