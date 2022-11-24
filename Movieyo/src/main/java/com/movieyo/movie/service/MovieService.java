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
}
