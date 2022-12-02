package com.movieyo.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.movieyo.board.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.movieyo.board.";
	//게시물 작성
	@Override
	public int boardInsertOne(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+ "boardInsertOne", boardDto);
	}

	@Override
	public int boardSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOption", searchOption);	
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "boardSelectTotalCount", map) ;
	}
	//게시물 조회
	@Override
	public List<Map<String, Object>> boardSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("searchOption", searchOption);
		
		return sqlSession.selectList(namespace + "boardSelectList", map);
		
	}

	@Override
	public BoardDto boardSelectOne(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "boardSelectOne", boardNo);	
	}


	@Override
	public int boardUpdateOne(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "boardUpdateOne", boardDto);
	}
	// 조회수
	

	@Override
	public int boardRemoveOne(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "boardRemoveOne", boardNo);
	}

	@Override
	public void boardCountUp(int boardNo) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace + "boardCountUp", boardNo);
		
	}


	

	

	

	
	


}

	
	


