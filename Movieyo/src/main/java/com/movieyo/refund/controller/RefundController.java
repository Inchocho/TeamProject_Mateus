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

import com.movieyo.refund.service.RefundService;

@Controller
public class RefundController {

	private static final Logger logger 
	= LoggerFactory.getLogger(RefundController.class);
	
	@Autowired
	private RefundService refundService;
	
	//로그인 세션값 필요 (파라미터 HttpSession session 추가필요)
	@RequestMapping(value = "/refund/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String refundList(Model model, int userNo) {		
		
		List<Map<String, Object>> listMap = refundService.refundSelectList(userNo);
		
		List<Map<String, Object>> refundListMap = new ArrayList<Map<String,Object>>();
		
		System.out.println(listMap);
		
		for (int i = 0; i < listMap.size(); i++) {
			Map<String, Object> refundMap = new HashMap<String, Object>();
			
			String movieTitle = (String)listMap.get(i).get("MOVIE_TITLE");
			int moviePrice = Integer.parseInt(String.valueOf(listMap.get(i).get("MOVIE_PRICE")));
			Date buyDate = (Date)listMap.get(i).get("BUY_DATE");
			Date refundDate = (Date)listMap.get(i).get("REFUND_DATE");
			String refundStatus = (String)listMap.get(i).get("REFUND_STATUS");
			
			refundMap.put("moviePrice", moviePrice);
			refundMap.put("movieTitle", movieTitle);
			refundMap.put("refundStatus", refundStatus);
			refundMap.put("refundDate", refundDate);		
			refundMap.put("buyDate", buyDate);		
			
			refundListMap.add(refundMap);			
			
		}
		
		model.addAttribute("refundListMap", refundListMap);
		
		return "refund/refundListView";
	}
	
}
