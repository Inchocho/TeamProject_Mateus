package com.movieyo.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.movieyo.board.dto.BoardDto;

public interface BoardDao {

	public int boardInsertOne(BoardDto boardDto);
	
	public int boardSelectTotalCount(String searchOption, String keyword);

	public List<Map<String, Object>> boardSelectList(String searchOption, String keyword, int start, int end);

	public BoardDto boardSelectOne(int boardNo);

	public int boardUpdateOne(BoardDto boardDto);

	public int boardRemoveOne(int boardNo) throws Exception;

	public void boardCountUp(int boardNo);

	public BoardDto movePage(int boardNo) throws Exception;

	

	

	

	
	
	
	
	
	

}