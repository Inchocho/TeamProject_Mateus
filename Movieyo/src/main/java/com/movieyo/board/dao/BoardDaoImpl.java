package com.movieyo.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieyo.board.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.movieyo.board.";	

	@Override
	public BoardDto select(Integer user_No) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Integer user_No, Integer board_No) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(BoardDto dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(BoardDto dto) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseViewCount(Object board_No) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardDto> selectPage(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDto> selectAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteAll() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
