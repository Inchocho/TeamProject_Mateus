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

	public MovieDto movieSelectOne(int movieNo);

	public List<Map<String, Object>> fileselectList(int movieNo);

	public int movieUpdateOne(MovieDto movieDto);

	public void movieDeleteOne(int movieNo);

	public List<Integer> movieNoSelect(String searchOption, String keyword);

	public Map<String, Object> fileSelectStoredFileName(int parentSeq);

	public int fileDelete(int parentSeq);

	public List<Map<String, Object>> genreSelect(int userNo);

	public Map<String, Object> fileSelectOne(int fileIdx);

	public List<MovieDto> movieSelectList_title();

	public List<Map<String, Object>> fileList_title();
	
}
