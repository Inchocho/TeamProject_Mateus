package com.movieyo.buy.dao;

import java.util.List;
import java.util.Map;

import com.movieyo.buy.dto.BuyDto;

public interface BuyDao {

	public int buySelectTotalCount(String searchOption, String keyword, int userNo, int userAdmin);

	public List<Map<String, Object>> buySelectList(String searchOption, String keyword, int start, int end, int userNo, int userAdmin);

	public void buyInsertOne(BuyDto buyDto);

	public BuyDto buyExist(int userNo, int movieNo);

}
