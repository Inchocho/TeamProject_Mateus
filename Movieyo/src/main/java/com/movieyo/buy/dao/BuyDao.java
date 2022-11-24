package com.movieyo.buy.dao;

import java.util.List;
import java.util.Map;

public interface BuyDao {

	public List<Map<String, Object>> buySelectList(int userNo);

}
