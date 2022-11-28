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
	public int refundSelectTotalCount(String searchOption, String keyword, int userNo) {
		// TODO Auto-generated method stub
		return refundDao.refundSelectTotalCount(searchOption, keyword, userNo);
	}

	@Override
	public List<Map<String, Object>> refundSelectList(String searchOption, String keyword
			, int start, int end, int userNo, int userAdmin) {
		// TODO Auto-generated method stub
		System.out.println(searchOption + "서치옵션");
		System.out.println(keyword + "키워드");
		System.out.println(start + "페이지시작");
		System.out.println(end + "페이지엔드");
		
		return refundDao.refundSelectList(searchOption, keyword, start, end, userNo, userAdmin);
	}


}
