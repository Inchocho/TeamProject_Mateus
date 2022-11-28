package com.movieyo.refund.service;

import java.util.List;
import java.util.Map;

public interface RefundService {

	public List<Map<String, Object>> refundSelectList(String searchOption, String keyword, int start, int end, int userNo, int userAdmin);

	public int refundSelectTotalCount(String searchOption, String keyword, int userNo);

}
