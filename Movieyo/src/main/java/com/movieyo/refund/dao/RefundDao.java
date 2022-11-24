package com.movieyo.refund.dao;

import java.util.List;
import java.util.Map;

public interface RefundDao {

	public List<Map<String, Object>> refundSelectList(int userNo);

}
