package com.movieyo.board.dao;

import java.util.List;
import java.util.Map;

import com.movieyo.board.dto.BoardDto;

public interface BoardDao {
	BoardDto select(Integer boardNo) throws Exception;

	int delete(Integer userNo, Integer boardNo) throws Exception;

	int insert(BoardDto dto) throws Exception;

	int update(BoardDto dto) throws Exception;

	int increaseViewCount(Object boardNo) throws Exception;

	List<BoardDto> selectPage(Map map) throws Exception;

	List<BoardDto> selectAll() throws Exception;

	int deleteAll() throws Exception;

	int count() throws Exception;

	List<BoardDto> boardSelectTotalCount(String searchOption, String keyword);

}