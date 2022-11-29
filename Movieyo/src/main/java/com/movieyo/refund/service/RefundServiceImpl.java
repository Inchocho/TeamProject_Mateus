package com.movieyo.refund.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieyo.refund.dao.RefundDao;
import com.movieyo.refund.dto.RefundDto;

@Service
public class RefundServiceImpl implements RefundService {
	
	private static final Logger log 
	= LoggerFactory.getLogger(RefundServiceImpl.class);	

	@Autowired
	public RefundDao refundDao;

	@Override
	public int refundSelectTotalCount(String searchOption, String keyword, int userNo) {
		// TODO Auto-generated method stub
		return refundDao.refundSelectTotalCount(searchOption, keyword, userNo);
	}

	@Override
	public List<Map<String, Object>> refundSelectList(String searchOption, String keyword
			, int start, int end, int userNo, int userAdmin) {
		// TODO Auto-generated method stub
		return refundDao.refundSelectList(searchOption, keyword, start, end, userNo, userAdmin);
	}

	@Override
	public void refundInsertOne(int buyNo, int userNo) {
		// TODO Auto-generated method stub
		refundDao.refundInsertOne(buyNo, userNo);
	}

	@Override
	public int refundExist(int buyNo, int userNo) {
		// TODO Auto-generated method stub
		return refundDao.refundExist(buyNo, userNo);
	}


}
