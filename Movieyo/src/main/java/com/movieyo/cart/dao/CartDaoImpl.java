package com.movieyo.cart.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;
import java.util.function.Function;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl implements CartDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//mapper의 namespace를 함수로 생성해서 사용하자
	String name(String inputStr) {
		String resultN = "com.movieyo.cart." + inputStr;
		return resultN;
	}

	@Override
	public int selectTotalCount(String searchOption, String keyword, int userNo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("userNo", userNo);
		
		return sqlSession.selectOne(name("selectTotalCount"), map);
	}

	@Override
	public List<Map<String, Object>> selectList(String searchOption, String keyword, int start, int end, int userNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("userNo", userNo);
		
		return sqlSession.selectList(name("selectList"), map);
	}

}
