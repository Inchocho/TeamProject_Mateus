package com.movieyo.movie.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.movie.dto.MovieDto;

public interface MovieDao {

	public int movieInsertOne(MovieDto movieDto, MultipartHttpServletRequest mulRequest);

	public void insertFile(Map<String, Object> map);
	
	public int movieSelectTotalCount(String searchOption, String keyword);

	public List<MovieDto> movieSelectList(String searchOption, String keyword, int start, int end);

	public MovieDto movieSelectOne(int no);

	public List<Map<String, Object>> fileselectList(int no);

}
