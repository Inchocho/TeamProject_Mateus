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
	public String buyList(Model model, HttpSession session) {		
		
		//지금은 일단 고정값 번호를 넣어주는중 (2022.11.23)
		//input type hidden으로 userNo를 넘겨줄거다 즉 파라미터에 Model model, int userNo가 될 것
		int userNo = 5;
		
		List<Map<String, Object>> listMap = buyService.buySelectList(userNo);
		
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
		
		return "buy/buyListView";
	}	

}
