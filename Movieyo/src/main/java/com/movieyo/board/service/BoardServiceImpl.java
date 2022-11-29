package com.movieyo.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.movieyo.board.dao.BoardDao;
import com.movieyo.board.dto.BoardDto;
import com.movieyo.movie.dto.MovieDto;


@Service
public class BoardServiceImpl implements BoardService {
    @Autowired
    public BoardDao boardDao;

	@Override
	public List<BoardDto> boardSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		return boardDao.boardSelectList(searchOption, keyword, start, end);
	}

	@Override
	public BoardDto boardExist(String email, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> boardSelectOne(int boardNo) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		BoardDto boardDto = boardDao.boardSelectOne(boardNo);
		
		resultMap.put("boardDto", boardDto);

		
		return resultMap;
	}


	@Override
	public void boardInsertOne(BoardDto boardDto) throws Exception {
		// TODO Auto-generated method stub
		boardDao.boardInsertOne(boardDto);
	}


	@Override
	public int boardSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return boardDao.boardSelectTotalCount(searchOption, keyword);
	}

	@Override
	public void boardUpdateOne(BoardDto boardDto) {
		// TODO Auto-generated method stub
		boardDao.boardUpdateOne(boardDto);
	}

	@Override
	public void boardViewCount(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		boardDao.boardViewCount(boardNo);
	}

	@Override
	public void boardRemoveOne(int boardNo) throws Exception {
		// TODO Auto-generated method stub
		boardDao.boardRemoveOne(boardNo);
	}

	@Override
	public void boardCountUp(int boardNo) {
		// TODO Auto-generated method stub
		boardDao.boardCountUp(boardNo);
	}

//	@Override
//	public void boardUpdate(BoardDto boardDto) {
//		// TODO Auto-generated method stub
//		boardDao.boardUpdate(boardDto);
//	}

	

		
	

	@Override
	public void updateBoard(BoardDto boardDto) throws Exception {
		// TODO Auto-generated method stub
		boardDao.updateBoard(boardDto);
		
	}

	@Override
	public void boardDeleteOne(int boardNo) {
		// TODO Auto-generated method stub
		boardDao.boardDeleteOne(boardNo);
	}

	

	
	
}
