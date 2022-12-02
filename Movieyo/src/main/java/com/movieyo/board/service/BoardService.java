package com.movieyo.board.service;

import java.util.List;
import java.util.Map;

import com.movieyo.board.dto.BoardDto;
import com.movieyo.movie.dto.MovieDto;

public interface BoardService {

	public List<Map<String, Object>> boardSelectList(String searchOption, String keyword, int start, int end);

	public Map<String, Object> boardSelectOne(int boardNo);

	public void boardInsertOne(BoardDto boardDto) throws Exception;

	public int boardSelectTotalCount(String searchOption, String keyword);

	public void boardUpdateOne(BoardDto boardDto);

	public void boardRemoveOne(int checkObj) throws Exception;

	public void boardCountUp(int boardNo);


	


	


	



	


	


	

}
