package com.movieyo.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movieyo.user.dto.UserDto;
import com.movieyo.user.service.UserService;

@Controller
public class UserController {

	private static final Logger logger 
	= LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/auth/login.do", method = RequestMethod.GET)
	public String login(HttpSession session, Model model) {
	
		//logger.info, logger.trace, logger.debug, ~~~ 아래는 info사용한 예시
		logger.info("Welcome UserController login!");
		
		return "auth/LoginForm";
	}
	
	@RequestMapping(value="/auth/loginCtr.do", method = RequestMethod.POST)
	public String loginCtr(String email, String password
			, HttpSession session, Model model) {	
		logger.info("Welcome MemberController loginCtr! " + email + 
				", " + password);
		
		UserDto userDto = userService.userExist(email, password);
		System.out.println(userDto.getUserNo() + "이프전");
		
		
		System.out.println(userDto.getUserName());
		
		
		String viewUrl = "";
		if(userDto != null) {
			session.setAttribute("userDto", userDto);
			
			viewUrl =  "redirect:../user/one.do?userNo=" +  userDto.getUserNo();
		}else {
			viewUrl = "/auth/LoginFail";
		}
		
		return viewUrl;
	}
	
	@RequestMapping(value = "user/add.do", method = RequestMethod.GET)
	public String userAdd(Model model) {
		logger.debug("Welcome UserController userAdd! ");
		
		
		return "user/UserForm";
	}
	
	@RequestMapping(value = "/user/addCtr.do", method = RequestMethod.POST)
	public String userAdd(UserDto userDto, Model model) {
		logger.trace("Welcome UserController userAdd 신규등록 처리! " 
			+ userDto);
		
		try {
			userService.userInsertOne(userDto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("오랜만에 예외 처리 한다");
			System.out.println("파일 문제 예외일 가능성 높음");
			e.printStackTrace();
		}
		
		
		return "redirect:../auth/login.do";
	}
	
	@RequestMapping(value="/user/one.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String userOne(int userNo, Model model) {
		logger.debug("Welcome UserController userOne!"
				+ " userNo" , userNo);
		
		Map<String, Object> map = userService.userSelectOne(userNo);
		UserDto userDto = (UserDto)map.get("userDto");
		
		
		model.addAttribute("userDto", userDto);
		
		return "user/UserOneView";
	}
	
	@RequestMapping(value="/user/update.do")
	public String userUpdate(int userNo, Model model) {
		logger.debug("Welcome userUpdate enter {}", userNo);
		
		Map<String, Object> map = userService.userSelectOne(userNo);
		
		UserDto userDto = (UserDto) map.get("userDto");
		
		model.addAttribute("userDto", userDto);
		
		return "user/UserUpdateForm";
	}
	
	//수정시 바로바로 적용되게 바꾸기(세션?)
		@RequestMapping(value = "/user/updateCtr.do", method = RequestMethod.POST)
		   public String userUpdateCtr(HttpSession session, UserDto userDto, Model model)  {
		                     // email.password 네임값을 가져옴(@RequestMapping의 힘)
		      logger.info("Welcome userController userUpdateCtr!" + userDto);
		      
		      try {
		    	  userService.userUpdateOne(userDto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		      
		         UserDto sessionUserDto =
		               (UserDto)session.getAttribute("userDto");
		         
		         if (sessionUserDto != null) {
		            if (sessionUserDto.getUserNo() == userDto.getUserNo()) {
		            
		            	UserDto newUserDto = new UserDto();
		               
		            	newUserDto.setUserNo(userDto.getUserNo());
		            	newUserDto.setEmail(userDto.getEmail());
		            	newUserDto.setNickname(userDto.getNickname());
		               
		               session.removeAttribute("userDto");
		               
		               session.setAttribute("userDto", newUserDto);
		            }
		         }
		      
		      return "user/UserOneView";
		   }
		
		@RequestMapping(value = "/user/passwordUpdate.do", method = RequestMethod.GET)
		public String userPasswordUpdate(Model model, UserDto userDto) {
			logger.debug("Welcome UserController userPasswordUpdate {}", userDto);
//			int no = userDto.getNo();
//			
//			Map<String, Object> map = userService.userSelectOne(no);
//			UserDto userDto2 = (UserDto)map.get("userDto");
//			
//			
			model.addAttribute("userDto", userDto);
			
			return "user/UserPasswordUpdate";
		}
		
		@RequestMapping(value="/user/passwordUpdateCtr.do")
		public String userPasswordUpdate(HttpSession session, UserDto userDto, Model model) {
			logger.debug("Welcome userPasswordUpdate enter {}", userDto);
			int userNo = userDto.getUserNo();
			
			Map<String, Object> map = userService.userSelectOne(userNo);
			UserDto userDto2 = (UserDto)map.get("userDto");
			
			 try {
		    	  userService.passwordUpdate(userDto);
			} catch (Exception e) {
				e.printStackTrace();
			}
		      
		         UserDto sessionUserDto =
		               (UserDto)session.getAttribute("userDto");
		         
		         if (sessionUserDto != null) {
		            if (sessionUserDto.getUserNo() == userDto.getUserNo()) {
		            
		            	UserDto newUserDto = new UserDto();
		               
		            	newUserDto.setPassword(userDto.getPassword());
		               session.removeAttribute("userDto");
		               
		               session.setAttribute("userDto", newUserDto);
		            }
		         }
		         
		         model.addAttribute("userDto", userDto2);
			
			return "user/UserOneView";
		}
		
		@RequestMapping(value="/user/deleteCtr.do", method = RequestMethod.GET)
		public String userDelete(int userNo, HttpSession session, Model model) {
			logger.info("Welcome userController userDeleteCtr! " + userNo);
			
			userService.userDeleteOne(userNo);
			
			session.invalidate();
			
			return "redirect:/auth/login.do";
		}
		
		@GetMapping("/user/authorPop.do")
		public String authorPopGET() throws Exception{
			
			logger.info("authorPopGET.......");
			
			return "PopUp/authorPop";
		
		}
		
		@RequestMapping(value = "/UserFindpw.do", method = RequestMethod.GET)
		public void UserFindpwGET() throws Exception{
		
		}

		@RequestMapping(value = "/UserFindpw.do", method = RequestMethod.POST)
		public void UserFindpwPOST(@ModelAttribute UserDto userDto, HttpServletResponse response) throws Exception{
			userService.userFindPw(response, userDto);
		}
		
		@RequestMapping(value = "/user/userMpoint.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String userMpoint(HttpSession session, Model model) throws Exception{
			
			return "user/UserMPointView";
		}
		@RequestMapping(value = "/Popup/chargeMpointPop.do", method = RequestMethod.GET)
		public String chargeMpoint(HttpSession session, Model model) throws Exception{
			
			return "PopUp/ChargeMpointPop";
		}
		
}
