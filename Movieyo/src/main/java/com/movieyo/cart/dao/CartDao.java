package com.movieyo.cart.dao;

import java.util.List;
import java.util.Map;

import com.movieyo.cart.dto.CartDto;

public interface CartDao {

	int selectTotalCount(String searchOption, String keyword, int userNo);
	List<Map<String, Object>> selectList(String searchOption,
			String keyword, int start, int end, int userNo);
	int cartExistOne(int userNo, int movieNo);
	void cartInsertOne(CartDto cartDto);
	void deleteCart(int cartNo);


}
