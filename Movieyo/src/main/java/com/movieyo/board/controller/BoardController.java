package com.movieyo.board.controller;


import java.lang.reflect.Member;
import java.security.Provider.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

		Paging commonPaging = new Paging(totalCount, curPage);

		int start = commonPaging.getPageBegin();
		int end = commonPaging.getPageEnd();

		List<Map<String, Object>> boardList = boardService.boardSelectList(searchOption, keyword, start, end);

		// sql 페이징 쿼리실행결과 + 토탈카운트를 담아서 멤버리스트와 같이 모델에 담아준다
		// map을 활용하면 다양한 데이터를 쉽게 객체를 만들 수 있다
		// Map의 value타입이 Object인 이유 -> 스프링은 객체지향 프로그래밍
		Map<String, Object> pagingMap = new HashMap<String, Object>();

		// Map에다가 totalCount, memberPaging을 key로해서 담고
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("commonPaging", commonPaging);

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

	// 게시글 화면으로
	@RequestMapping(value = "/board/one.do", method = RequestMethod.GET)
	public String boardOne(int boardNo, @RequestParam(defaultValue = "1") int curPage, String searchOption, String keyword, Model model
			, HttpServletRequest request, HttpServletResponse response) {
//		logger.info("Welcome boardOne! enter - {}" + no);
//		int boardNo = Integer.parseInt(boardNoS);

		Map<String, Object> map = boardService.boardSelectOne(boardNo);	

		BoardDto boardDto = (BoardDto) map.get("boardDto");

		boardService.boardCountUp(boardNo);
		
		Map<String, Object> prevMap = new HashMap<>();
		prevMap.put("curPage", curPage);
		prevMap.put("searchOption", searchOption);
		prevMap.put("keyword", keyword);
		
		model.addAttribute("boardDto", boardDto);
		model.addAttribute("prevMap", prevMap);
		//쿠키로 조회수 막는거 미구현
//		 Cookie[] cookies = request.getCookies();
//		 if (cookies != null) {
//	            for (Cookie cookie : cookies) {
//	               
//
//	                if (!cookie.getValue().contains(request.getParameter("boardNo"))) {
//	                    cookie.setValue(cookie.getValue() + "_" + request.getParameter("boardNo"));
//	                    cookie.setMaxAge(60 * 60 * 2);  /* 쿠키 시간 */
//	                    response.addCookie(cookie);
//	                    boardService.boardCountUp(boardNo);
//	                    break;
//	                }
//	            }
//	        } else {
//	            Cookie newCookie = new Cookie("visit_cookie", request.getParameter("boardNo"));
//	            newCookie.setMaxAge(60 * 60 * 2);
//	            response.addCookie(newCookie);
//	            boardService.boardCountUp(boardNo);
//	        }
		

		return "board/boardOneView";
	}

	
	
	@RequestMapping(value = "/board/update.do", method = RequestMethod.GET)
	public String boardUpdate(int boardNo, Model model, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword) {

		Map<String, Object> map = boardService.boardSelectOne(boardNo);
		BoardDto boardDto = (BoardDto) map.get("boardDto");

		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		searchMap.put("curPage", curPage);

//		List<Map<String, Object>> fileList = (List<Map<String, Object>>) map.get("fileList");

		model.addAttribute("boardDto", boardDto);
//		model.addAttribute("fileList", fileList);
		model.addAttribute("searchMap", searchMap);

		return "board/boardUpdateForm";
	}
	//	게시글 수정 화면으로
	@RequestMapping(value = "/board/updateCtr.do", method = RequestMethod.POST)
	public String boardUpdateCtr(HttpSession session,
			BoardDto boardDto, Model model, String boardWriter)  {
	                     // email.password 네임값을 가져옴(@RequestMapping의 힘)
	    try {
			boardService.boardUpdateOne(boardDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    model.addAttribute("boardWriter", boardWriter);  
	    return "board/boardUpdateForm";
	}
	//게시글 삭제
	@RequestMapping(value = "/board/deleteCtr.do", method = RequestMethod.GET)
	public String boardDelete(int boardNo) throws Exception {

		boardService.boardRemoveOne(boardNo);

		return "redirect:/board/boardList.do";
		
	}
	
	//	게시물 선택삭제
	@ResponseBody
	@RequestMapping(value = "/board/listDeleteCtr.do", method = RequestMethod.POST)
	public String selectDelete(@RequestParam(value="checkBoxArr[]") List<Integer> checkBoxArr
			, HttpSession session) throws Exception{
		
		for (int checkObj : checkBoxArr) {
			boardService.boardRemoveOne(checkObj);
		}
		
		return "redierct:/board/boardList.do";
	}

//	이전글 다음글 미구현
	@RequestMapping(value="/board/readView.do", method=RequestMethod.GET)
	public String movePage(int boardNo, @RequestParam(defaultValue = "1") int curPage, BoardDto boardDto, String searchOption, String keyword,
			HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		 	
		BoardDto boarDto = boardService.movePage(boardNo);
//		int nextpageCheck = boardService.nextpageCheck(boardDto.getNext());
	//		Map<String, Object> map = boardService.boardSelectOne(boardNo);	
	//
//		model.addAttribute("movePage", boardService.movePage(boardDto.getBoardNo()));
		return "/board/boardOneView";
	}
		


}
