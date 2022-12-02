package com.movieyo.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.user.dto.UserDto;

public interface UserService {

	public UserDto userExist(String email, String password);

	public void userInsertOne(UserDto userDto)throws Exception;

	public Map<String, Object> userSelectOne(int userNo);

	public void userUpdateOne(UserDto userDto);

	public void passwordUpdate(UserDto userDto);

	public void userDeleteOne(int userNo);

	//비밀번호찾기
	public void userFindPw(HttpServletResponse response, UserDto userDto)throws Exception;
		
	//이메일발송
	public void sendEmail(UserDto userDto, String Div)throws Exception;

	public int userSelectTotalCount(String searchOption, String keyword);

	public List<UserDto> userSelectList(String searchOption, String keyword, int start, int end);

	public void userGenre(int checkNum, int userNo);

	public UserDto chargeMpointCtr(UserDto userDto, int afterMpoint);

	//유저 영화구매시 캐쉬 업데이트
	public int userBuyMovie(int userNo, int moviePrice);
	
	//유저 현재 캐쉬 조회
	public int userCurrentCash(int userNo);
		
}


