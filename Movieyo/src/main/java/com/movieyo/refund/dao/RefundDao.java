package com.movieyo.refund.dao;

import java.util.List;

import com.movieyo.refund.dto.RefundDto;

public interface RefundDao {

	public List<RefundDto> refundSelectList(int userNo);

}
