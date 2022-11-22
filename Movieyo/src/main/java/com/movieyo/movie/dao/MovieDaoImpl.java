package com.movieyo.movie.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.movie.dto.MovieDto;

@Repository
public class MovieDaoImpl implements MovieDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.movieyo.movie.";

	@Override
	public int movieInsertOne(MovieDto movieDto, MultipartHttpServletRequest mulRequest) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "movieInsertOne", movieDto);
	}

	@Override
	public void insertFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		sqlSession.insert(namespace + "insertFile", map);
	}

}
