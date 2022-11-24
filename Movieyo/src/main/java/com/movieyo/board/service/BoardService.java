package com.movieyo.board.service;

import java.util.List;
import java.util.Map;
import com.movieyo.board.dto.BoardDto;

public interface BoardService {

	public int getCount() throws Exception;

	public int remove(Integer UserNo, Integer boardNo) throws Exception;

	public int write(BoardDto boardDto) throws Exception;

	public List<BoardDto> getList() throws Exception;

	public BoardDto read(Integer UserNo) throws Exception;

	public List<BoardDto> getPage(Map<String, Object> map) throws Exception;

	public int modify(BoardDto boardDto) throws Exception;

	public int boardSelectTotalCount(String searchOption, String keyword);

	List<BoardDto> boardSelectList(String searchOption, String keyword, int start, int end);

	
}
