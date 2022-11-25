package com.movieyo.buy.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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

import com.movieyo.buy.dto.BuyDto;
import com.movieyo.buy.service.BuyService;
import com.movieyo.movie.dto.MovieDto;
import com.movieyo.user.dto.UserDto;
import com.movieyo.util.Paging;

@Controller
public class BuyController {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(BuyController.class);
	
	@Autowired
	private BuyService buyService;
	
	//로그인 세션값 필요 (파라미터 HttpSession session 추가필요)
	@RequestMapping(value = "/buy/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String buyList(@RequestParam(defaultValue = "1") int curPage, Model model,
			@RequestParam(defaultValue = "all")String searchOption
		  , @RequestParam(defaultValue = "")String keyword,
			int userNo) {
		
		logger.info("Welcome BuyController buyList! curPage: {}" + ", searchOption: {}"
				, curPage, searchOption);		
		
		logger.info("keyword: {}",keyword);	
		
		int totalCount = buyService.buySelectTotalCount(searchOption, keyword, userNo);
		
		logger.info("totalCount: {}", totalCount);
		
		Paging buyPaging = new Paging(totalCount, curPage);		
		
		int start = buyPaging.getPageBegin();
		int end = buyPaging.getPageEnd();		
				
		List<Map<String, Object>> listMap = buyService.buySelectList(searchOption, keyword, start, end, userNo);
		
		//sql 페이징 쿼리실행결과 + 토탈카운트를 담아서 멤버리스트와 같이 모델에 담아준다
		//map을 활용하면 다양한 데이터를 쉽게 객체를 만들 수 있다
		//Map의 value타입이 Object인 이유 -> 스프링은 객체지향 프로그래밍 
		Map<String, Object> pagingMap = 
				new HashMap<String, Object>();
		
		//Map에다가 totalCount, memberPaging을 key로해서 담고
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("moviePaging", buyPaging);
		
		Map<String, Object> searchMap = 
				new HashMap<String, Object>();
		
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		logger.info("curPage: {}", curPage);
		logger.info("curBlock: {}", buyPaging.getCurBlock());			
		
		List<Map<String, Object>> buyListMap = new ArrayList<Map<String,Object>>();
		
		System.out.println(listMap);
		
		for (int i = 0; i < listMap.size(); i++) {
			Map<String, Object> buyMap = new HashMap<String, Object>();
			
			int moviePrice = Integer.parseInt(String.valueOf(listMap.get(i).get("MOVIE_PRICE")));
			String userNickName = (String)listMap.get(i).get("USER_NICKNAME");
			String movieTitle = (String)listMap.get(i).get("MOVIE_TITLE");
			String buyStatus = (String)listMap.get(i).get("BUY_STATUS");
			Date buyDate = (Date)listMap.get(i).get("BUY_DATE");
			
			buyMap.put("moviePrice", moviePrice);
			buyMap.put("userNickName", userNickName);
			buyMap.put("movieTitle", movieTitle);
			buyMap.put("buyStatus", buyStatus);
			buyMap.put("buyDate", buyDate);		
			
			buyListMap.add(buyMap);			
			
		}
		
		model.addAttribute("buyListMap", buyListMap);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);		
		
		return "buy/BuyListView";
	}	
	
	@RequestMapping(value = "/buy/addBuy.do", method = RequestMethod.GET)
	public String buyAdd(Model model, HttpSession session) {
		
		UserDto userDto = (UserDto)session.getAttribute("userDto");
		
		System.out.println(userDto);
		
		model.addAttribute(userDto);
		
		logger.trace("Welcome BuyController buyAdd 구매폼으로 이동!!!");
		
		return "buy/BuyForm";
	}
	
	@RequestMapping(value = "/buy/addCtr.do", method = RequestMethod.POST)
	public String buyAddCtr(BuyDto buyDto, Model model) {
		logger.trace("Welcome BuyController buyAddCtr 구매내역 추가!!! " 
			+ buyDto);
		
			//폼으로 해당정보를 넘기는지 확인
			System.out.println(buyDto);
		
			//해당 유저의 캐쉬를 감소하기 위한 userNo
			int userNo = buyDto.getBuyNo();
			
			//구매한 영화의 평가를 올리기 위한 movieNo
			int movieNo = buyDto.getMovieNo();
		
		try {
			buyService.buyInsertOne(buyDto);
			
//			buyService.updateCash(userNo);
			
//			buyService.updateMovie(movieNo);
			
		} catch (Exception e) {
			System.out.println("오랜만에 예외 처리 한다");
			System.out.println("파일 문제 예외일 가능성 높음");
			e.printStackTrace();
		}
				
		return "redirect:/buy/BuyListView";
	}	

}
