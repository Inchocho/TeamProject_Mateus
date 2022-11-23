package com.movieyo.board.dao;

import java.util.List;
import java.util.Map;

import com.movieyo.board.dto.BoardDto;

public interface BoardDao {
    BoardDto select(Integer user_No) throws Exception;
    int delete(Integer user_No, Integer board_No) throws Exception;
    int insert(BoardDto dto) throws Exception;
    int update(BoardDto dto) throws Exception;
    int increaseViewCount(Object board_No) throws Exception;
    
    List<BoardDto> selectPage(Map<String, Object> map) throws Exception;
    List<BoardDto> selectAll() throws Exception;
    int deleteAll() throws Exception;
    int count() throws Exception;
   
    
}