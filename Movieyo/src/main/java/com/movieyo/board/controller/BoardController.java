package com.movieyo.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movieyo.board.dto.BoardDto;
import com.movieyo.board.service.BoardService;
import com.movieyo.util.Paging;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping(value="/board/board.do", method = RequestMethod.GET)
	public String board(Model model) {
	
		return "board/board";
	}

	@RequestMapping(value = "/board/boardList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardList(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword,
			Model model) {

		

		int totalCount = boardService.boardSelectTotalCount(searchOption, keyword);

		Paging boardPaging = new Paging(totalCount, curPage);
		int start = boardPaging.getPageBegin();
		int end = boardPaging.getPageEnd();

		List<BoardDto> boardList = boardService.boardSelectList(searchOption, keyword, start, end);

		

		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);

		Map<String, Object> pagingMap = new HashMap<String, Object>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("boardPaging", boardPaging);

		model.addAttribute("boardList", boardList);
		model.addAttribute("searchMap", searchMap);
		model.addAttribute("pagingMap", pagingMap);

		return "board/BoardList";
	}
}