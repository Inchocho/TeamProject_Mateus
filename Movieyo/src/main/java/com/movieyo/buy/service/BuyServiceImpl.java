package com.movieyo.buy.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieyo.buy.dao.BuyDao;
import com.movieyo.refund.dto.RefundDto;

@Service
public class BuyServiceImpl implements BuyService {

	private static final Logger log 
	= LoggerFactory.getLogger(BuyServiceImpl.class);	

	@Autowired
	public BuyDao buyDao;

	@Override
	public List<RefundDto> buySelectList(int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
