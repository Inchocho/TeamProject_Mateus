package com.movieyo.buy.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieyo.buy.dao.BuyDao;

@Service
public class BuyServiceImpl implements BuyService {

	private static final Logger log 
	= LoggerFactory.getLogger(BuyServiceImpl.class);	

	@Autowired
	public BuyDao buyDao;

	@Override
	public List<Map<String, Object>> buySelectList(int userNo) {
		return buyDao.buySelectList(userNo);
	}
	
}
