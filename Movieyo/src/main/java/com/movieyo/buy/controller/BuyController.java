package com.movieyo.buy.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movieyo.buy.service.BuyService;
import com.movieyo.refund.dto.RefundDto;

@Controller
public class BuyController {
	
	private static final Logger logger 
	= LoggerFactory.getLogger(BuyController.class);
	
	@Autowired
	private BuyService buyService;
	
	//로그인 세션값 필요 (파라미터 HttpSession session 추가필요)
	@RequestMapping(value = "/buy/buy.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String buyList(Model model) {		
		
		int userNo = 5;
		
		//후에 refundSelectList(유저번호) 들어갈예정
		List<RefundDto> refundList =
				buyService.buySelectList(userNo);
		
		//Map을 pagingMap 키로 model에 담아서
		//MemberListView에서 ${pagingMap.memberPaging.blockBegin} pagingMap의 인스턴스를 EL태그로 사용한다
		model.addAttribute("refundList", refundList);
		
		return "buy/buyListView";
	}	

}
