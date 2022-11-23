package com.movieyo.buy.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movieyo.buy.service.BuyService;

@Controller
public class BuyController {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(BuyController.class);
	
	@Autowired
	private BuyService buyService;
	
	//로그인 세션값 필요 (파라미터 HttpSession session 추가필요)
	@RequestMapping(value = "/buy/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String buyList(Model model) {		
		
		//지금은 일단 고정값 번호를 넣어주는중 (2022.11.23)
		//input type hidden으로 userNo를 넘겨줄거다 즉 파라미터에 Model model, int userNo가 될 것
		int userNo = 2;
		
		Map<String, Object> userMap =
				buyService.buySelectList(userNo);
		
		System.out.println(userMap);
		
		int price =  Integer.parseInt(String.valueOf(userMap.get("MOVIE_PRICE")));
		String userNickName = (String)userMap.get("USER_NICKNAME");
		String movieTitle = (String)userMap.get("MOVIE_TITLE");
		String buyStatus = (String)userMap.get("BUY_STATUS");
		Date buyDate = (Date)userMap.get("BUY_DATE");
		
		Map<String, Object> buyMap = new HashMap<String, Object>();
		
		buyMap.put("price", price);
		buyMap.put("userNickName", userNickName);
		buyMap.put("movieTitle", movieTitle);
		buyMap.put("buyStatus", buyStatus);
		buyMap.put("buyDate", buyDate);
		
		//Map을 pagingMap 키로 model에 담아서
		//MemberListView에서 ${pagingMap.memberPaging.blockBegin} pagingMap의 인스턴스를 EL태그로 사용한다
		model.addAttribute("buyMap", buyMap);
		
		return "buy/buyListView";
	}	

}
