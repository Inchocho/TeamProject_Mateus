package com.movieyo.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.movie.dto.MovieDto;

public interface MovieService {

	public void movieInsertOne(MovieDto movieDto, MultipartHttpServletRequest mulRequest) throws Exception;

	public int movieSelectTotalCount(String searchOption, String keyword);

	public List<MovieDto> movieSelectList(String searchOption, String keyword, int start, int end);

	public Map<String, Object> movieSelectOne(int movieNo);

	public int movieUpdateOne(MovieDto movieDto, MultipartHttpServletRequest multipart, int fileIdx) throws Exception;

	public void movieDeleteOne(int movieNo);

	public List<Integer> movieNoSelect(String searchOption, String keyword);

	public Map<String, Object> moviefileOne(int movieNo2);
	
	public List<Map<String,Object>> genreSelect(int userNo);

}
