package com.movieyo.refund.service;

import java.util.List;

import com.movieyo.refund.dto.RefundDto;

public interface RefundService {

	public List<RefundDto> refundSelectList(int userNo);

}
