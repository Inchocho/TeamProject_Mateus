package com.movieyo.buy.service;

import java.util.List;

import com.movieyo.refund.dto.RefundDto;

public interface BuyService {

	public List<RefundDto> buySelectList(int userNo);

}
