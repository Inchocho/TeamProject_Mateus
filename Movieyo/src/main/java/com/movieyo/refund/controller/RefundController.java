package com.movieyo.refund.controller;

import java.util.ArrayList;
import java.util.Date;
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
import com.movieyo.refund.dto.RefundDto;
import com.movieyo.refund.service.RefundService;
import com.movieyo.user.dto.UserDto;
import com.movieyo.util.Paging;

@Controller
public class RefundController {

	private static final Logger logger 
	= LoggerFactory.getLogger(RefundController.class);
	
	@Autowired
	private RefundService refundService;
	
	//로그인 세션값 필요 (파라미터 HttpSession session 추가필요)
	@RequestMapping(value = "/refund/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String refundList(@RequestParam(defaultValue = "1") int curPage, Model model,
			@RequestParam(defaultValue = "all")String searchOption
		  , @RequestParam(defaultValue = "")String keyword
		  , HttpSession session
		  , int userNo) {
		
		UserDto userDto = (UserDto)session.getAttribute("userDto");
		
		//userAdmin을 통해 환불내역 조회
		int userAdmin = userDto.getUserAdmin();
		
		logger.info("Welcome RefundController refundList! curPage: {}" + ", searchOption: {}"
				, curPage, searchOption);		
		
		logger.info("keyword: {}",keyword);	
		
		int totalCount = refundService.refundSelectTotalCount(searchOption, keyword, userNo, userAdmin);
		
		logger.info("totalCount: {}", totalCount);
		
		Paging refundPaging = new Paging(totalCount, curPage);		
		
		int start = refundPaging.getPageBegin();
		int end = refundPaging.getPageEnd();
		
		List<Map<String, Object>> listMap 
			= refundService.refundSelectList(searchOption, keyword, start, end, userNo, userAdmin);
		
		//sql 페이징 쿼리실행결과 + 토탈카운트를 담아서 멤버리스트와 같이 모델에 담아준다
		//map을 활용하면 다양한 데이터를 쉽게 객체를 만들 수 있다
		//Map의 value타입이 Object인 이유 -> 스프링은 객체지향 프로그래밍 
		Map<String, Object> pagingMap = 
				new HashMap<String, Object>();
		
		//Map에다가 totalCount, memberPaging을 key로해서 담고
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("moviePaging", refundPaging);
		
		Map<String, Object> searchMap = 
				new HashMap<String, Object>();
		
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		logger.info("curPage: {}", curPage);
		logger.info("curBlock: {}", refundPaging.getCurBlock());		
		
		List<Map<String, Object>> refundListMap = new ArrayList<Map<String,Object>>();
		
		for (int i = 0; i < listMap.size(); i++) {
			Map<String, Object> refundMap = new HashMap<String, Object>();
			
			int refundNo = Integer.parseInt(String.valueOf(listMap.get(i).get("REFUND_NO")));
			int movieNo = Integer.parseInt(String.valueOf(listMap.get(i).get("MOVIE_NO")));
			String movieTitle = (String)listMap.get(i).get("MOVIE_TITLE");
			int moviePrice = Integer.parseInt(String.valueOf(listMap.get(i).get("MOVIE_PRICE")));
			Date buyDate = (Date)listMap.get(i).get("BUY_DATE");
			Date refundDate = (Date)listMap.get(i).get("REFUND_DATE");
			String refundStatus = (String)listMap.get(i).get("REFUND_STATUS");
			int refundUserNo = Integer.parseInt(String.valueOf(listMap.get(i).get("USER_NO")));
			
			refundMap.put("moviePrice", moviePrice);
			refundMap.put("movieTitle", movieTitle);
			refundMap.put("refundStatus", refundStatus);
			refundMap.put("refundDate", refundDate);		
			refundMap.put("buyDate", buyDate);
			refundMap.put("refundNo", refundNo);
			refundMap.put("movieNo", movieNo);
			refundMap.put("refundUserNo", refundUserNo);
			refundMap.put("userNo", userNo);
			
			refundListMap.add(refundMap);			
			
		}
		
		model.addAttribute("refundListMap", refundListMap);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		return "refund/RefundListView";
	}
	
	//구매내역에서 환불버튼 누르면 해당 번호가 환불내역에 쌓임
	@RequestMapping(value = "/refund/addRefund.do", method = RequestMethod.GET)
	public String addRefund(Model model, HttpSession session, int buyNo, int userNo) {
		
			int chk = refundService.refundExist(buyNo, userNo);
			System.out.println(chk + "와와와와");
			if(chk == 0) {
				System.out.println("여기탔니?");
				refundService.refundInsertOne(buyNo, userNo);
			}else {
				System.out.println("이프문 타는지 확인");
				return "redirect:./list.do?userNo=" + userNo;				
			}

		return "redirect:./list.do?userNo=" +  userNo;
	}
	
	//관리자가 환불 버튼을 눌러주면 환불처리가 되고 유저 계좌에 영화가격만큼 돈이 올라감 
	@RequestMapping(value = "/refund/updateRefund.do", method = RequestMethod.POST)
	public String updateRefund(HttpSession session,			
			RefundDto refundDto, Model model, int admit)  {
	                     // email.password 네임값을 가져옴(@RequestMapping의 힘)
	    logger.info("Welcome refundController updateRefund!" + refundDto);
	    
	    int userNo = refundDto.getUserNo();
	      
	    try {
	    	//int admit -> 예(1),아니오(0)
			refundService.updateRefund(refundDto, admit);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      
	    return "redirect:./list.do?userNo=" +  userNo;
	}	
	
}
