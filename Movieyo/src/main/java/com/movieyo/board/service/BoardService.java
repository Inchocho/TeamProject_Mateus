package com.movieyo.board.service;

import java.util.List;
import java.util.Map;

import com.movieyo.board.dto.BoardDto;
import com.movieyo.movie.dto.MovieDto;

public interface BoardService {

	public List<BoardDto> boardSelectList(String searchOption, String keyword, int start, int end);

	public BoardDto boardExist(String email, String password);

	public Map<String, Object> boardSelectOne(int boardNo);


	public void boardInsertOne(BoardDto boardDto) throws Exception;

	public int boardSelectTotalCount(String searchOption, String keyword);

	public void boardUpdateOne(BoardDto boardDto);

	public void boardViewCount(int boardNo) throws Exception;

	void boardRemoveOne(int boardNo) throws Exception;

	public void boardCountUp(int boardNo);

	public void updateBoard(BoardDto boardDto) throws Exception;

	public void boardDeleteOne(int boardNo);

//	public void boardUpdate(BoardDto boardDto);

	


	


	

}
