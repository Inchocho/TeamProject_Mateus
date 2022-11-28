package com.movieyo.board.dao;

import java.util.List;
import com.movieyo.board.dto.BoardDto;

public interface BoardDao {

	public int boardInsertOne(BoardDto boardDto);
	
	public int boardSelectTotalCount(String searchOption, String keyword);

	public List<BoardDto> boardSelectList(String searchOption, String keyword, int start, int end);

	public BoardDto boardSelectOne(int boardNo);

	public int boardUpdateOne(BoardDto boardDto);

	public void boardViewCount(int boardNo) throws Exception;

	
	
	

}