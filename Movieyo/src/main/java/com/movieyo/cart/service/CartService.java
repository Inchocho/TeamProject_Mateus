package com.movieyo.cart.service;

import java.util.List;
import java.util.Map;

public interface CartService {

	int selectTotalCount(String searchOption, String keyword, int userNo);

	List<Map<String, Object>> selectList(String searchOption,
			String keyword, int start, int end, int userNo);

	int cartExistOne(int userNo, int movieNo);

	void cartInsertOne(int userNo, int movieNo);

  

}
