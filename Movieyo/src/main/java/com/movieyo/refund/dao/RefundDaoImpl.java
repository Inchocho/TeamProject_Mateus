package com.movieyo.refund.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RefundDaoImpl implements RefundDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//mapper의 namespace를 변수로 생성해서 사용하자
	String namespace = "com.movieyo.refund.";

	@Override
	public List<Map<String, Object>> refundSelectList(int userNo) { 
		return sqlSession.selectList(namespace + "refundSelectList", userNo);
	}
}
