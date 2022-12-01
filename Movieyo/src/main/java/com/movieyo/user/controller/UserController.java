package com.movieyo.user.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movieyo.movie.dto.MovieDto;
import com.movieyo.user.dto.UserDto;
import com.movieyo.user.service.UserService;
import com.movieyo.util.Paging;

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
		logger.info("Welcome UserController loginCtr! " + email + 
				", " + password);
		
		UserDto userDto = userService.userExist(email, password);
		
		String viewUrl = "";
		if(userDto != null) {			
			session.setAttribute("userDto", userDto);
			
			//유저권한 관리자(1)일 경우 header에 이름앞에 (관리자)가 달림
			//userAdmin을 단계별로 뭘 주는 그런걸 만들 수 있겠네
			if(userDto.getUserAdmin() != 0) {
				String adminLabel = "(관리자)";
				session.setAttribute("adminLabel", adminLabel);
			}
			
//			viewUrl =  "redirect:../user/one.do?userNo=" +  userDto.getUserNo();
			viewUrl = "redirect:../movie/main.do";
		}else {
			viewUrl = "redirect:/auth/login.do";
//			viewUrl = "<script>alert('이메일틀림');location.href='./login.do'</script>";
		}
		
		return viewUrl;
	}
	
	@RequestMapping(value = "user/add.do", method = RequestMethod.GET)
	public String userAdd(Model model) {
		logger.debug("Welcome UserController userAdd! ");
		
		
		return "user/UserForm";
	}
	
	@RequestMapping(value = "/user/addCtr.do", method = RequestMethod.POST)
	public String userAdd(UserDto userDto, Model model,
			@RequestParam(value = "genreNo[]") List<String> valueArr) {
		logger.trace("Welcome UserController userAdd aaaaaaaaaaaaaaaaaaa신규등록 처리! " 
			+ userDto);
		
		logger.info("인포qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq" + valueArr);

			try {
				userService.userInsertOne(userDto);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int userNo = userDto.getUserNo();			
			
			for (int i = 0; i < valueArr.size(); i++) {
				int checkNum = Integer.parseInt(valueArr.get(i));
				userService.userGenre(checkNum, userNo);
			}
		
		
		return "redirect:../auth/login.do";
	}
	
	@RequestMapping(value = "/user/list.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String userList(@RequestParam(defaultValue = "1") int curPage, Model model,
			@RequestParam(defaultValue = "all")String searchOption
		  , @RequestParam(defaultValue = "")String keyword)  {

		//logger에 {}안에 한개의 값(curPage의 값)이 들어간다  형식 : {} , 들어갈 변수 또는 값 (여기선 {}, curpage)
		logger.info("Welcome MovieController movieList! curPage: {}" + ", searchOption: {}"
			, curPage, searchOption);
		
		logger.info("keyword: {}",keyword);
		
		
		int totalCount = userService.userSelectTotalCount(searchOption, keyword);
		
		
		logger.info("totalCount: {}", totalCount);
		
		Paging moviePaging = new Paging(totalCount, curPage);
		
		int start = moviePaging.getPageBegin();
		int end = moviePaging.getPageEnd();
		
		List<UserDto> userList =
				userService.userSelectList(searchOption, keyword, start, end);
		//sql 페이징 쿼리실행결과 + 토탈카운트를 담아서 멤버리스트와 같이 모델에 담아준다
		//map을 활용하면 다양한 데이터를 쉽게 객체를 만들 수 있다
		//Map의 value타입이 Object인 이유 -> 스프링은 객체지향 프로그래밍 
		Map<String, Object> pagingMap = 
				new HashMap<String, Object>();
		
		
		//Map에다가 totalCount, memberPaging을 key로해서 담고
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("moviePaging", moviePaging);
		
		Map<String, Object> searchMap = 
				new HashMap<String, Object>();
		
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		logger.info("curPage: {}", curPage);
		logger.info("curBlock: {}", moviePaging.getCurBlock());
		
		//Map을 pagingMap 키로 model에 담아서
		//MemberListView에서 ${pagingMap.memberPaging.blockBegin} pagingMap의 인스턴스를 EL태그로 사용한다
		model.addAttribute("userList", userList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		return "user/UserListView";
	}
	
	@RequestMapping(value="/user/one.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String userOne(int userNo, Model model, HttpSession session) {
		logger.debug("Welcome UserController userOne!"
				+ " userNo" , userNo);
		
		UserDto adminUserDto = (UserDto)session.getAttribute("userDto");
		
		int adminCheck = adminUserDto.getUserAdmin();
		
		Map<String, Object> map = userService.userSelectOne(userNo);
		UserDto userDto = (UserDto)map.get("userDto");
		
		System.out.println(userDto.getNickname() + "현재 유저의 닉네임");
		System.out.println(userDto.getUserAdmin() + "현재 유저정보 관리자체크");
		System.out.println(adminCheck + "관리자 여부확인");
	
		model.addAttribute("userDto2", userDto);
		model.addAttribute("adminCheck", adminCheck);
		
		return "user/UserOneView";
	}
	
	@RequestMapping(value="/user/update.do")
	public String userUpdate(int userNo, Model model, int adminCheck) {
		logger.debug("Welcome userUpdate enter {}", userNo);
	
		System.out.println("유저 업데이트폼 진입전 세션의 관리자확인: " + adminCheck);
		
		Map<String, Object> map = userService.userSelectOne(userNo);
		
		UserDto userDto = (UserDto) map.get("userDto");
		
		System.out.println("현재 접근한 유저의 관리자 확인: " + userDto.getUserAdmin());
		
		model.addAttribute("userDto2", userDto);
		model.addAttribute("adminCheck", adminCheck);
		
		return "user/UserUpdateForm";
	}
	
	//수정시 바로바로 적용되게 바꾸기(세션?)
		@RequestMapping(value = "/user/updateCtr.do", method = RequestMethod.POST)
		   public String userUpdateCtr(HttpSession session, UserDto userDto, Model model, int adminCheck)  {
		      logger.info("Welcome userController userUpdateCtr!" + userDto);
		     UserDto sessionUserDto =
		               (UserDto)session.getAttribute("userDto");
		     
		     System.out.println(sessionUserDto);
		     System.out.println(sessionUserDto.getUserAdmin() + "현재 세션의 관리자체크유무");
		     System.out.println(adminCheck + "현재 세션의 관리자번호 확인");
		     
		      try {
		    	  
		    	  if(adminCheck == 1 || sessionUserDto.getUserNo() == userDto.getUserNo()) {
		    		  userService.userUpdateOne(userDto);
		    		  
		    		  System.out.println(userDto);
		    		  
		    	  }else {
		    		  System.out.println("본인이 아닙니다");
		    	  }
		    	  
		    	  
			} catch (Exception e) {
				e.printStackTrace();
			}
		      
		      	 //sessionUserDto에 지금 세션(로그인한 유저)값이 담겨있다
		         //세션의 값이 널이 아니면 (즉 로그인을 했으면)
		         if (sessionUserDto != null) {
		        	 //세션(로그인한 유저번호)이 전송된 폼의 userDto의 유저번호면
		            if (sessionUserDto.getUserNo() == userDto.getUserNo()) {
		            		
		            		String changeName = userDto.getUserName();	
		            		String changeNickname = userDto.getNickname();
		            		
		            		System.out.println(changeName + "변경한 이름");
		            		System.out.println(changeNickname + "변경한 닉네임");
		            		
		            		sessionUserDto.setUserName(changeName);
		            		sessionUserDto.setNickname(changeNickname);

		            		//기존 로그인할때 존재하는 세션값 삭제
			               session.removeAttribute("userDto");
				               
			                //업데이트 후 변경된 값 세션에 저장
			               session.setAttribute("userDto", sessionUserDto);
		            	
		            }
		         }
		         
		         //업데이트된 userDto를 키값 userDto2로 화면에 뿌려줌
		         //세션에 저장된 키값이 userDto라 userDto2로 key값을 담음
		         
//		         session.removeAttribute("userDto");
//		         session.setAttribute("sessionUserDto", sessionUserDto);
		         
		         model.addAttribute("userDto", sessionUserDto);
		         model.addAttribute("userDto2", userDto);
		         model.addAttribute("adminCheck", adminCheck);
		      
		      return "user/UserOneView";
		   }
		
		@RequestMapping(value = "/user/passwordUpdate.do", method = RequestMethod.GET)
		public String userPasswordUpdate(Model model, UserDto userDto) {
			logger.debug("Welcome UserController userPasswordUpdate {}", userDto);
			int no = userDto.getUserNo();
			
			Map<String, Object> map = userService.userSelectOne(no);
			UserDto userDto2 = (UserDto)map.get("userDto");
			
			model.addAttribute("userDto", userDto2);
			
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
		      
			 model.addAttribute("userDto2", userDto2);
			
			return "user/UserOneView";
		}
		
		@RequestMapping(value="/user/deleteCtr.do", method = RequestMethod.POST)
		public String userDelete(int userNo, HttpSession session, Model model) {
			logger.info("Welcome userController userDeleteCtr! " + userNo);
			
			userService.userDeleteOne(userNo);
			
			session.invalidate();
			

			
			return "redirect:/auth/login.do";
		}
		
		@GetMapping("/user/authorPop.do")
		public String authorPopGET(int userNo, Model model) throws Exception{
			
			logger.info("authorPopGET.......");
			model.addAttribute("userNo", userNo);
			return "PopUp/authorPop";
		
		}
		
		@RequestMapping(value = "/user/UserFindpw.do", method = RequestMethod.GET)
		public String UserFindpwGET() throws Exception{
			return "user/UserFindpw";
		}

		@RequestMapping(value = "/user/UserFindpw.do", method = RequestMethod.POST)
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
		@RequestMapping(value = "/user/chargeMpointCtr.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String chargeMpointCtr(int afterMpoint, HttpSession session, Model model) throws Exception{
			UserDto userDto = (UserDto) session.getAttribute("userDto");
			
			UserDto userDtoCarged  = userService.chargeMpointCtr(userDto,afterMpoint);
			
			session.removeAttribute("userDto");
			session.setAttribute("userDto", userDtoCarged);
			model.addAttribute("userDto", userDtoCarged);
			
			return "redirect:userMpoint.do";
		}
		
		@RequestMapping(value="/user/logout.do", method = RequestMethod.GET)
		public String logout(HttpSession session) {
				
			logger.info("Goodbye UserController logout!");
			
			session.invalidate();
			
			return "redirect:/auth/login.do";
		}
		
}
