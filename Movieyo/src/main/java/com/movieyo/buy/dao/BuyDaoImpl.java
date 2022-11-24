package com.movieyo.buy.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieyo.buy.dto.BuyDto;
import com.movieyo.refund.dto.RefundDto;

@Repository
public class BuyDaoImpl implements BuyDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//mapper의 namespace를 변수로 생성해서 사용하자
	String namespace = "com.movieyo.buy.";

	@Override
	public List<Map<String, Object>> buySelectList(int userNo) { 
		return sqlSession.selectList(namespace + "buySelectList", userNo);
	}
	
}
