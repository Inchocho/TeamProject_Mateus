package com.movieyo.board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieyo.board.dao.BoardDao;
import com.movieyo.board.dto.BoardDto;
import com.movieyo.util.FileUtils;

@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    public BoardDao boardDao;

    @Resource(name="fileUtils")
	private FileUtils fileUtils;

	private Object boardCount;
    
    @Override
    public int getCount() throws Exception {
        return boardDao.count();
    }

    @Override
    public int remove(Integer User_No, Integer board_No) throws Exception {
        return boardDao.delete(User_No, board_No);
    }

    @Override
    public int write(BoardDto boardDto) throws Exception {
        return boardDao.insert(boardDto);
    }

    @Override
    public List<BoardDto> getList() throws Exception {
        return boardDao.selectAll();
    }

    @Override
    public BoardDto read(Integer board_No) throws Exception {
        BoardDto boardDto = boardDao.select(board_No);
        boardDao.increaseViewCount(board_No);

        return boardDto;
    }

    @Override
    public List<BoardDto> getPage(Map<String, Object> map) throws Exception {
        return boardDao.selectPage(map);
    }

    @Override
    public int modify(BoardDto boardDto) throws Exception {
        return boardDao.update(boardDto);
    }

	


}
