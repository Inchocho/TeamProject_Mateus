package com.movieyo.refund.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieyo.refund.dto.RefundDto;
import com.movieyo.user.dto.UserDto;

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
	public int updateRefund(RefundDto refundDto, int admit) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int buyNo = refundDto.getBuyNo();
		
		map.put("admit", admit);
		map.put("buyNo", buyNo);
		
		return sqlSession.update(namespace + "updateRefund", map);
		
	}


	@Override
	public int updateCash(int userNo, int moviePrice) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userNo", userNo);
		map.put("moviePrice", moviePrice);
		
		return sqlSession.update(namespace + "updateCash", map);
	}
	
	@Override
	public void updateBuy(int buyNo) {
		
		//환불 요청성공시 구매번호를 받아서 해당 구매번호의 구매상태를 환불처리완료로 변경한다
		
		sqlSession.update(namespace + "updateBuy", buyNo);
	}


	@Override
	public int checkCash(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "checkCash", userNo);
	}


	//11월30일 체크장르 (유저의 선호장르를 확인하기위한 리스트타입 쿼리 -> 유저로 옮길예정)
	@Override
	public List<UserDto> checkGenre(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "checkGenre", userNo);
	}


	@Override
	public String genreName(int genreNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "genreName", genreNo);
	}


	@Override
	public void refundDelete(int refundNo) {
		// TODO Auto-generated method stub
		
		sqlSession.delete(namespace + "refundDelete", refundNo);
	}

}
