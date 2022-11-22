package com.movieyo.movie.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.movie.dto.MovieDto;
import com.movieyo.movie.service.MovieService;
import com.movieyo.user.dto.UserDto;
import com.movieyo.user.service.UserService;

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
	public String userAdd(Model model) {
		
		logger.debug("Welcome MovieController addMovie! ");
		
		return "movie/MovieForm";
	}	
	
	@RequestMapping(value = "/movie/addCtr.do", method = RequestMethod.POST)
	public String userAdd(MovieDto movieDto, 
			MultipartHttpServletRequest mulRequest, Model model) {
		logger.trace("Welcome UserController userAdd 신규등록 처리! " 
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
	
	
}
