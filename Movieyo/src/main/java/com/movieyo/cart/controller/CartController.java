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
import com.movieyo.refund.service.RefundService;
import com.movieyo.user.dto.UserDto;
import com.movieyo.user.service.UserService;
import com.movieyo.util.CartPaging;
import com.movieyo.util.Paging;

@Controller
public class CartController {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
	@Autowired
	private BuyService buyService;
	@Autowired
	private RefundService refundService; 
	
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
	
	@RequestMapping(value = "/cart/deleteCart.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteCart(int[] cartNo, Model model, HttpSession session) {
		logger.debug("Welcome CartController deleteCart!{}" , cartNo);
		
		for (int i = 0; i < cartNo.length; i++) {
			cartService.deleteCart(cartNo[i]);
		}
				
		String url = "redirect:/cart/list.do";
		return url;
	}
	
	@RequestMapping(value = "/cart/buyCart.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String buyCart(int[] movieNo,int[] cartNo, int sumPrice, Model model, HttpSession session) {
		logger.debug("Welcome CartController buyCart! movie: {}", movieNo);
		logger.debug("Welcome CartController buyCart! cart: {}", cartNo);
		UserDto userDto = (UserDto) session.getAttribute("userDto");
		int userNo = userDto.getUserNo();
		int userCash = userDto.getUserCash();
		if (userCash >= sumPrice) {	//장바구니 합계보다 유저캐시가 많을때 수행
			for (int i = 0; i < movieNo.length; i++) {
				BuyDto buyDto = new BuyDto(userNo,movieNo[i]);
				//구매성공체크(환불 재구매시)					
				cartService.deleteCart(cartNo[i]);
				
				//구매성공(케이스1 환불한 영화 다시 재구매)	
				int buyStatusCheck = 0;
				buyStatusCheck = buyService.buyStatusCheck(userNo, movieNo[i]);
				if(buyStatusCheck != 0) {
					//환불한물건 업데이트처리(구매 케이스 1)

					//구매내역에 상태가 있는지 확인
					buyService.buyStatusUpdate(userNo, movieNo[i]);
					userService.userBuyMovie(userNo, sumPrice);
					
					//구매시 장바구니에 들어있는지 확인하여
					//장바구니에 들어있는게 확인되면 장바구니 번호를 조회해서 해당 번호를 삭제							

					//환불내역(환불처리완료됨)에서 삭제처리함 
					int refundNo = 0;
					refundNo = buyService.selectRefundNo(userNo, movieNo[i]);
					refundService.refundDelete(refundNo);							
				}else {
				//구매케이스2 아예 처음 구매함
					int buySuccess = 0;					
					buySuccess = buyService.buyInsertOne(buyDto);
					
					if(buySuccess != 0) {
	
						//구매가 성공했으면 유저의 캐쉬를 영화가격만큼 감소
						userService.userBuyMovie(userNo, sumPrice);
					}
				}
			}
		String url = "redirect:/cart/list.do";
		return url;
		}else {
			String url = "alert/BuyCartFail";
			return url;
		}
	}
	@RequestMapping(value = "/cart/alert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String alert(Model model, HttpSession session) {
		
		String url = "redirect:/cart/list.do";
		return url;
	}

}
