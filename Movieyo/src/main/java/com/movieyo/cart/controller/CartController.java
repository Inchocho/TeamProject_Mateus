package com.movieyo.cart.controller;

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
import com.movieyo.cart.service.CartService;
import com.movieyo.movie.dto.MovieDto;
import com.movieyo.movie.service.MovieService;
import com.movieyo.user.dto.UserDto;
import com.movieyo.util.CartPaging;
import com.movieyo.util.Paging;

@Controller
public class CartController {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private BuyService buyService;
	
	//
	
	@RequestMapping(value = "/cart/list.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String cartList(@RequestParam(defaultValue = "1") int curPage, Model model,
			@RequestParam(defaultValue = "all")String searchOption
		  , @RequestParam(defaultValue = "")String keyword
		  , HttpSession session) {

		UserDto userDto = (UserDto) session.getAttribute("userDto");
		
		int userNo = userDto.getUserNo();
		
		logger.info("Welcome cartController cartList! curPage: {}" + ", searchOption: {}"
				, curPage, searchOption);		
		
		logger.info("keyword: {}",keyword);	
		
		int totalCount = cartService.selectTotalCount(searchOption, keyword, userNo);
		
		logger.info("totalCount: {}", totalCount);
		
		CartPaging paging = new CartPaging(totalCount, curPage);		
		
		int start = paging.getPageBegin();
		int end = paging.getPageEnd();		

		List<Map<String, Object>> cartDBList = cartService.selectList(searchOption, keyword, start, end, userNo);
		
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		
		//Map에다가 totalCount, Paging을 key로해서 담고
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("cartPaging", paging);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		logger.info("curPage: {}", curPage);
		logger.info("curBlock: {}", paging.getCurBlock());			
		List<Map<String, Object>> cartList = new ArrayList<Map<String,Object>>();
		for (int i = 0; i < cartDBList.size(); i++) {
			Map<String, Object> cart = new HashMap<String, Object>();
			
			int movieNo = Integer.parseInt(String.valueOf(cartDBList.get(i).get("MOVIE_NO")));
			String movieTitle = (String)cartDBList.get(i).get("MOVIE_TITLE");
			int moviePrice = Integer.parseInt(String.valueOf(cartDBList.get(i).get("MOVIE_PRICE")));
			int cartNo = Integer.parseInt(String.valueOf(cartDBList.get(i).get("CART_NO")));			
			Date inCartDate = (Date)cartDBList.get(i).get("CART_INCARTDATE");
			System.out.println(inCartDate +" "+ i + "번");
			cart.put("movieNo", movieNo);
			cart.put("moviePrice", moviePrice);
			cart.put("movieTitle", movieTitle);
			cart.put("inCartDate", inCartDate);		
			cart.put("cartNo", cartNo);
			
			cartList.add(cart);
		}
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);		
		
		return "user/UserCartListView";
	}	

	@RequestMapping(value = "/cart/addCart.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String cartAdd(int movieNo, Model model
			, @RequestParam(defaultValue = "1") int curPage
			, @RequestParam(defaultValue = "all")String searchOption
			, @RequestParam(defaultValue = "")String keyword
			, HttpSession session) {
		logger.debug("Welcome CartController movieOne!{}" , movieNo);
		//로그인한 유저번호 찾기
		UserDto userDto = (UserDto)session.getAttribute("userDto");
		int userNo = userDto.getUserNo();
		
		//장바구니에 선택한 영화 담기
		cartService.cartInsertOne(userNo,movieNo);
				
		String url = "redirect:/movie/detail.do?movieNo=" + movieNo;
		return url;
	}
	
//	@RequestMapping(value = "/cart", method = RequestMethod.POST)
//	public String buyAddCtr(BuyDto buyDto, Model model, int userNo, int movieNo) {
//		logger.trace("Welcome BuyController buyAddCtr 구매내역 추가!!! " 
//			+ buyDto);
//		
//			int isCheck = buyService.buyExistOne(userNo, movieNo);
//			
//			//폼으로 해당정보를 넘기는지 확인
////			System.out.println(buyDto);		
//			
//			String viewUrl = "";
//		
//		try {
//			if(isCheck != 0) {	
//				System.out.println("이미 존재하는 영화");
//				viewUrl =  "redirect:../buy/list.do?userNo=" +  userNo;
//			}else {				
//				buyService.buyInsertOne(buyDto);
//				viewUrl =  "redirect:../buy/list.do?userNo=" +  userNo;
//			}
////			buyService.updateCash(userNo);
//			
////			buyService.updateMovie(movieNo);
//			
//		} catch (Exception e) {
//			System.out.println("오랜만에 예외 처리 한다");
//			System.out.println("파일 문제 예외일 가능성 높음");
//			e.printStackTrace();
//		}
//				
//		return viewUrl;
//	}	

}
