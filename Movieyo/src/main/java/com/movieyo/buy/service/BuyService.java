package com.movieyo.buy.service;

import java.util.List;
import java.util.Map;

public interface BuyService {

	int buySelectTotalCount(String searchOption, String keyword, int userNo);

	List<Map<String, Object>> buySelectList(String searchOption, String keyword, int start, int end, int userNo);


}
