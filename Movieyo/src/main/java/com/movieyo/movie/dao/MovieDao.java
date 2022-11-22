package com.movieyo.movie.dao;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.movie.dto.MovieDto;

public interface MovieDao {

	public int movieInsertOne(MovieDto movieDto, MultipartHttpServletRequest mulRequest);

	public void insertFile(Map<String, Object> map);

}
