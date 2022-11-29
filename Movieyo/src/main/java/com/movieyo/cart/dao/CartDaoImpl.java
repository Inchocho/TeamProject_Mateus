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
	String namespace(String inputStr) {
		String resultN = "com.movieyo.cart." + inputStr;
		return resultN;
	}

}
