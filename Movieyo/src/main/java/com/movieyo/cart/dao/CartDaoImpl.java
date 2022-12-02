package com.movieyo.cart.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;
import java.util.function.Function;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieyo.cart.dto.CartDto;

@Repository
public class CartDaoImpl implements CartDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String mappingName;
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
		
		mappingName = "selectList";
		
		return sqlSession.selectList(name(mappingName), map);
	}

	@Override
	public int cartExistOne(int userNo, int movieNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userNo", userNo);
		map.put("movieNo", movieNo);
		
		mappingName = "cartExist";
		
		return sqlSession.selectOne(name(mappingName), map);
	}

	@Override
	public void cartInsertOne(CartDto cartDto) {
		// TODO Auto-generated method stub

		mappingName = "cartInsertOne";
		
		sqlSession.insert(name(mappingName), cartDto);
	}

	@Override
	public void deleteCart(int cartNo) {
		// TODO Auto-generated method stub
		mappingName = "deleteCart";
		
		sqlSession.insert(name(mappingName), cartNo);
	}

	@Override
	public int selectCartNo(int userNo, int movieNo) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userNo", userNo);
		map.put("movieNo", movieNo);
		
		mappingName = "selectCartNo";
		
		return sqlSession.selectOne(name(mappingName), map);
		
	}

}
