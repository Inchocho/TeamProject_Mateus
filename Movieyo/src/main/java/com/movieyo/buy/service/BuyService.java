package com.movieyo.buy.service;

import java.util.List;
import java.util.Map;

import com.movieyo.buy.dto.BuyDto;

public interface BuyService {

	public int buySelectTotalCount(String searchOption, String keyword, int userNo);

	public List<Map<String, Object>> buySelectList(String searchOption, String keyword, int start, int end, int userNo, int userAdmin);

	public void buyInsertOne(BuyDto buyDto);


}
