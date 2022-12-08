package com.movieyo.buy.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieyo.buy.dao.BuyDao;
import com.movieyo.buy.dto.BuyDto;

@Service
public class BuyServiceImpl implements BuyService {

	private static final Logger log 
	= LoggerFactory.getLogger(BuyServiceImpl.class);	

	@Autowired
	public BuyDao buyDao;

	@Override
	public int buySelectTotalCount(String searchOption, String keyword, int userNo, int userAdmin) {
		// TODO Auto-generated method stub
		return buyDao.buySelectTotalCount(searchOption, keyword, userNo, userAdmin);
	}

	@Override
	public List<Map<String, Object>> buySelectList(String searchOption, String keyword, int start, int end,
			int userNo, int userAdmin) {
		// TODO Auto-generated method stub
		
		return buyDao.buySelectList(searchOption, keyword, start, end, userNo, userAdmin);
	}

	@Override
	public int buyInsertOne(BuyDto buyDto) {
		// TODO Auto-generated method stub
		return buyDao.buyInsertOne(buyDto);
	}

	@Override
	public int buyExistOne(int userNo, int movieNo) {
		// TODO Auto-generated method stub
		return buyDao.buyExistOne(userNo, movieNo);
	}

	@Override
	public int buyStatusCheck(int userNo, int movieNo) {
		// TODO Auto-generated method stub
		return buyDao.buyStatusCheck(userNo, movieNo);
	}

	@Override
	public void buyStatusUpdate(int userNo, int movieNo) {
		// TODO Auto-generated method stub
		buyDao.buyStatusUpdate(userNo, movieNo);
	}

	@Override
	public int selectRefundNo(int userNo, int movieNo) {
		// TODO Auto-generated method stub
		return buyDao.selectRefundNo(userNo, movieNo);
	}

	@Override
	public void refundRequestUpdate(int buyNo) {
		// TODO Auto-generated method stub
		buyDao.refundRequestUpdate(buyNo);
	}

	@Override
	public void refundRequestDeny(int buyNo) {
		// TODO Auto-generated method stub
		buyDao.refundRequestDeny(buyNo);
	}

	@Override
	public int totalMoney() {
		// TODO Auto-generated method stub
		return buyDao.totalMoney();
	}

	@Override
	public int refundMoney() {
		// TODO Auto-generated method stub
		return buyDao.refundMoney();
	}
	
	@Override
	public int refundCount() {
		
		return buyDao.refundCount();
	}
	
}
