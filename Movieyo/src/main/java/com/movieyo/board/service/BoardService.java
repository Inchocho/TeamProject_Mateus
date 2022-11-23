package com.movieyo.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.board.dto.BoardDto;
import com.movieyo.user.dto.UserDto;

public interface BoardService {

	int getCount() throws Exception;

	int remove(Integer User_No, Integer board_No) throws Exception;

	int write(BoardDto boardDto) throws Exception;

	List<BoardDto> getList() throws Exception;

	BoardDto read(Integer User_No) throws Exception;

	List<BoardDto> getPage(Map<String, Object> map) throws Exception;

	int modify(BoardDto boardDto) throws Exception;

	
}
