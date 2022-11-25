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
	public int buySelectTotalCount(String searchOption, String keyword, int userNo) {
		// TODO Auto-generated method stub
		return buyDao.buySelectTotalCount(searchOption, keyword, userNo);
	}

	@Override
	public List<Map<String, Object>> buySelectList(String searchOption, String keyword, int start, int end,
			int userNo) {
		// TODO Auto-generated method stub
		System.out.println(searchOption + "서치옵션");
		System.out.println(keyword + "키워드");
		System.out.println(start + "페이지시작");
		System.out.println(end + "페이지엔드");
		
		return buyDao.buySelectList(searchOption, keyword, start, end, userNo);
	}


	
}
