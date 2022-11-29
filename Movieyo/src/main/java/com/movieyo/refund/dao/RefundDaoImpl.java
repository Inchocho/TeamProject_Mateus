package com.movieyo.refund.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieyo.refund.dto.RefundDto;

@Repository
public class RefundDaoImpl implements RefundDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//mapper의 namespace를 변수로 생성해서 사용하자
	String namespace = "com.movieyo.refund.";

	@Override
	public int refundSelectTotalCount(String searchOption, String keyword, int userNo, int userAdmin) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("userNo", userNo);
		map.put("userAdmin", userAdmin);
		
		return sqlSession.selectOne(namespace + "refundSelectTotalCount", map);
	}


	@Override
	public List<Map<String, Object>> refundSelectList(String searchOption, String keyword, int start, int end,
			int userNo, int userAdmin) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);		
		map.put("userNo", userNo);
		map.put("userAdmin", userAdmin);
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList(namespace + "refundSelectList", map);
	}


	@Override
	public void refundInsertOne(int buyNo, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("buyNo", buyNo);
		map.put("userNo", userNo);
		
		sqlSession.insert(namespace + "refundInsertOne", map);
	}


	@Override
	public int refundExist(int buyNo, int userNo) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("buyNo", buyNo);
		map.put("userNo", userNo);
		
		return sqlSession.selectOne(namespace + "refundExist", map);
	}


	@Override
	public void updateRefund(RefundDto refundDto, int admit) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int buyNo = refundDto.getBuyNo();
		
		map.put("admit", admit);
		map.put("buyNo", buyNo);
		
		sqlSession.update(namespace + "updateRefund", map);
		
	}
}
