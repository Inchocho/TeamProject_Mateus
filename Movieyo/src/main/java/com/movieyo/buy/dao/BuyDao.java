package com.movieyo.buy.dao;

import java.util.List;
import java.util.Map;

public interface BuyDao {

	public int buySelectTotalCount(String searchOption, String keyword, int userNo);

	public List<Map<String, Object>> buySelectList(String searchOption, String keyword, int start, int end, int userNo);


}
