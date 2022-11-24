package com.movieyo.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.movie.dto.MovieDto;
import com.movieyo.movie.service.MovieService;
import com.movieyo.user.dto.UserDto;
import com.movieyo.user.service.UserService;
import com.movieyo.util.Paging;

@Controller
public class MovieController {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(MovieController.class);
	
	@Autowired
	private MovieService movieService;	
	
	//apiTest 영화목록 들어가기
	@RequestMapping(value="/movie/movie.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
	
		//logger.info, logger.trace, logger.debug, ~~~ 아래는 info사용한 예시
		logger.info("Welcome MovieAddForm Access!");
		
		return "movie/apiTest";
	}	
	
	@RequestMapping(value = "/movie/addMovie.do", method = RequestMethod.GET)
	public String movieAdd(Model model) {
		
		logger.debug("Welcome MovieController 영화등록폼! ");
		
		return "movie/MovieAddForm";
	}	
	
	@RequestMapping(value = "/movie/addCtr.do", method = RequestMethod.POST)
	public String movieAdd(MovieDto movieDto, Model model,
			MultipartHttpServletRequest mulRequest) {
		logger.trace("Welcome MoiveController movieAdd 신규등록 처리! " 
			+ movieDto);
		
		try {
			movieService.movieInsertOne(movieDto, mulRequest);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("오랜만에 예외 처리 한다");
			System.out.println("파일 문제 예외일 가능성 높음");
			e.printStackTrace();
		}
				
		return "redirect:/movie/list.do";
	}
	
	@RequestMapping(value = "/movie/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String movieList(@RequestParam(defaultValue = "1") int curPage, Model model,
			@RequestParam(defaultValue = "all")String searchOption
		  , @RequestParam(defaultValue = "")String keyword)  {

		//logger에 {}안에 한개의 값(curPage의 값)이 들어간다  형식 : {} , 들어갈 변수 또는 값 (여기선 {}, curpage)
		logger.info("Welcome MovieController movieList! curPage: {}" + ", searchOption: {}"
			, curPage, searchOption);
		
		logger.info("keyword: {}",keyword);
		
//		if ("name".equals(searchOption)) {
//			searchOption = "mname";
//		};
		
		int totalCount = movieService.movieSelectTotalCount(searchOption, keyword);
		
		
		logger.info("totalCount: {}", totalCount);
		
		Paging moviePaging = new Paging(totalCount, curPage);
		
		int start = moviePaging.getPageBegin();
		int end = moviePaging.getPageEnd();
		
		List<MovieDto> movieList =
				movieService.movieSelectList(searchOption, keyword, start, end);
		//sql 페이징 쿼리실행결과 + 토탈카운트를 담아서 멤버리스트와 같이 모델에 담아준다
		//map을 활용하면 다양한 데이터를 쉽게 객체를 만들 수 있다
		//Map의 value타입이 Object인 이유 -> 스프링은 객체지향 프로그래밍 
		Map<String, Object> pagingMap = 
				new HashMap<String, Object>();
		
		
		//Map에다가 totalCount, memberPaging을 key로해서 담고
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("moviePaging", moviePaging);
		
		Map<String, Object> searchMap = 
				new HashMap<String, Object>();
		
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		logger.info("curPage: {}", curPage);
		logger.info("curBlock: {}", moviePaging.getCurBlock());
		
		//Map을 pagingMap 키로 model에 담아서
		//MemberListView에서 ${pagingMap.memberPaging.blockBegin} pagingMap의 인스턴스를 EL태그로 사용한다
		model.addAttribute("movieList", movieList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		return "movie/MovieListView";
	}
	
	//	상세보기 (선택시 상세정보를 보여줌 readOnly 페이지)
		@RequestMapping(value="/movie/one.do", method = RequestMethod.GET)
		public String memberOne(int movieNo, Model model
				, @RequestParam(defaultValue = "1") int curPage
				, @RequestParam(defaultValue = "all")String searchOption
				, @RequestParam(defaultValue = "")String keyword) {
			logger.debug("Welcome MovieController movieOne!{}" , movieNo);
			
			Map<String, Object> map = movieService.movieSelectOne(movieNo);
			MovieDto movieDto = (MovieDto) map.get("movieDto");
			
			Map<String, Object> searchMap = new HashMap<String, Object>();
			searchMap.put("searchOption", searchOption);
			searchMap.put("keyword", keyword);
			searchMap.put("curPage", curPage);
			
			List<Map<String, Object>> fileList = (List<Map<String, Object>>) map.get("fileList");
			
			model.addAttribute("movieDto", movieDto);
			model.addAttribute("fileList", fileList);
			model.addAttribute("searchMap", searchMap);
			
			return "movie/MovieOneView";
		}
		
		@RequestMapping(value="/movie/update.do")
		public String userUpdate(int movieNo, Model model) {
			logger.debug("Welcome userUpdate enter {}", movieNo);
			
			Map<String, Object> map = movieService.movieSelectOne(movieNo);
			
			MovieDto movieDto = (MovieDto) map.get("movieDto");
			
			model.addAttribute("movieDto", movieDto);
			
			return "movie/MovieUpdateForm";
		}
	
}
