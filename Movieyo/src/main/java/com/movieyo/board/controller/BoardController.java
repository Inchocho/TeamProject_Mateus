package com.movieyo.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@RequestMapping(value = "/board/board.do", method = RequestMethod.GET)
	public String board(HttpSession session, Model model) {

		return "board/board";
	}

	@RequestMapping(value = "/board/add.do", method = RequestMethod.GET)
	public String boardAdd(Model model) {

		return "board/board";
	}

	@RequestMapping(value = "/board/addCtr.do", method = RequestMethod.POST)
	public String boardAdd(BoardDto boardDto, int userNo, Model model) {

		try {
			boardService.boardInsertOne(boardDto);
		} catch (Exception e) {
			System.out.println("예외처리");
			System.out.println("파일 문제 예외일 가능성 높음");
			e.printStackTrace();
		}

		return "redirect:/board/boardList.do";
	}

	// 게시판 화면으로
	@RequestMapping(value = "/board/boardList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardList(@RequestParam(defaultValue = "1") int curPage, Model model,
			@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword) {

		// logger에 {}안에 한개의 값(curPage의 값)이 들어간다 형식 : {} , 들어갈 변수 또는 값 (여기선 {}, curpage)

//		if ("name".equals(searchOption)) {
//			searchOption = "mname";
//		};

		int totalCount = boardService.boardSelectTotalCount(searchOption, keyword);

		Paging boardPaging = new Paging(totalCount, curPage);

		int start = boardPaging.getPageBegin();
		int end = boardPaging.getPageEnd();

		List<BoardDto> boardList = boardService.boardSelectList(searchOption, keyword, start, end);

		// sql 페이징 쿼리실행결과 + 토탈카운트를 담아서 멤버리스트와 같이 모델에 담아준다
		// map을 활용하면 다양한 데이터를 쉽게 객체를 만들 수 있다
		// Map의 value타입이 Object인 이유 -> 스프링은 객체지향 프로그래밍
		Map<String, Object> pagingMap = new HashMap<String, Object>();

		// Map에다가 totalCount, memberPaging을 key로해서 담고
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("boardPaging", boardPaging);

		Map<String, Object> searchMap = new HashMap<String, Object>();

		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);

		// Map을 pagingMap 키로 model에 담아서
		// MemberListView에서 ${pagingMap.memberPaging.blockBegin} pagingMap의 인스턴스를 EL태그로
		// 사용한다
		model.addAttribute("boardList", boardList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);

		return "board/boardList";
	}

	// 게시글 상세 화면으로
	@RequestMapping(value = "/board/one.do", method = RequestMethod.GET)
	public String boardOne(int boardNo, int curPage, String searchOption, String keyword, Model model) {
//		logger.info("Welcome boardOne! enter - {}" + no);

		System.out.println("상세보기 1");

		Map<String, Object> map = boardService.boardSelectOne(boardNo);

		BoardDto boardDto = (BoardDto) map.get("boardDto");
		List<Map<String, Object>> fileList = (List<Map<String, Object>>) map.get("fileList");

		boardService.boardCountUp(boardNo);

		Map<String, Object> prevMap = new HashMap<>();
		prevMap.put("curPage", curPage);
		prevMap.put("searchOption", searchOption);
		prevMap.put("keyword", keyword);

		model.addAttribute("boardDto", boardDto);
		model.addAttribute("fileList", fileList);
		model.addAttribute("prevMap", prevMap);

		return "board/boardOneView";
	}

	

	@RequestMapping(value = "/board/update.do")
	public String boardUpdate(int boardNo, Model model, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword) {

		Map<String, Object> map = boardService.boardSelectOne(boardNo);
		BoardDto boardDto = (BoardDto) map.get("boardDto");

		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		searchMap.put("curPage", curPage);

		List<Map<String, Object>> fileList = (List<Map<String, Object>>) map.get("fileList");

		model.addAttribute("boardDto", boardDto);
		model.addAttribute("fileList", fileList);
		model.addAttribute("searchMap", searchMap);

		return "board/boardUpdateForm";
	}

	@RequestMapping(value = "/board/updateCtr.do", method = RequestMethod.POST)
	public String boardUpdateCtr(HttpSession session, BoardDto boardDto, Model model) {
		// email.password 네임값을 가져옴(@RequestMapping의 힘)

		boardService.boardUpdateOne(boardDto);

		return "redirect:/board/list.do";
	}

	@RequestMapping(value = "/board/deleteCtr.do", method = RequestMethod.GET)
	public String boardDelete(int boardNo, HttpSession session, Model model) {

		boardService.boardDeleteOne(boardNo);

		return "redirect:/board/list.do";
	}



	// 회원수정 화면으로
	@RequestMapping(value = "board/updateBoard.do", method = RequestMethod.GET)
	public String updateBoard(BoardDto boardDto) throws Exception {

//		 	BoardDto boardDto = new BoardDto();

		System.out.println(boardDto);
//		 	boardDto.setBoardTitle(boardTitle);
//			boardDto.setBoardContent(boardContent);
//			boardDto.setBoardNo(boardNo);

//			System.out.println("제목" + boardTitle + "내용" + boardContent + "게시판번호" + boardNo);

		boardService.updateBoard(boardDto);
		return "board/boardUpdateForm";
	}

}
