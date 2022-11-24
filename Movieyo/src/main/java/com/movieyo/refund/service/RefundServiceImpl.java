package com.movieyo.refund.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieyo.refund.dao.RefundDao;

@Service
public class RefundServiceImpl implements RefundService {
	
	private static final Logger log 
	= LoggerFactory.getLogger(RefundServiceImpl.class);	

	@Autowired
	public RefundDao refundDao;

	@Override
	public List<Map<String, Object>> refundSelectList(int userNo) {
		return refundDao.refundSelectList(userNo);
	}

}
