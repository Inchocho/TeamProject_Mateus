package com.movieyo.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
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
	public BoardDto select(Integer boardNo) throws Exception {
		return sqlSession.selectOne(namespace + "select", boardNo);	}

	@Override
	public int delete(Integer userNo, Integer boardNo) throws Exception {
		return 0;
	}

	@Override
	public int insert(BoardDto dto) throws Exception {
		return sqlSession.insert(namespace+"insert", dto);	}

	@Override
	public int update(BoardDto dto) throws Exception {
		return 0;
	}

	@Override
	public int increaseViewCount(Object boardNo) throws Exception {
		 return sqlSession.update(namespace+"update", boardNo);	}

	@Override
	public List<BoardDto> selectPage(Map map) throws Exception {
		  return sqlSession.selectList(namespace+"selectPage", map);
	}

	@Override
	public List<BoardDto> selectAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteAll() throws Exception {
		// TODO Auto-generated method stub
		 return sqlSession.selectOne(namespace+"deleteAll");	
	}

	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		 return sqlSession.selectOne(namespace+"count");	
	}

	@Override
	public List<BoardDto> boardSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
