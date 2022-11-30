package com.movieyo.cart.dao;

import java.util.List;
import java.util.Map;

public interface CartDao {

	int selectTotalCount(String searchOption, String keyword, int userNo);
	List<Map<String, Object>> selectList(String searchOption,
			String keyword, int start, int end, int userNo);


}
