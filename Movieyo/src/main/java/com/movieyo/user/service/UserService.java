package com.movieyo.user.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.user.dto.UserDto;

public interface UserService {

	public UserDto userExist(String email, String password);

	public void userInsertOne(UserDto userDto)throws Exception;

	public Map<String, Object> userSelectOne(int no);

	public void userUpdateOne(UserDto userDto);

	public void passwordUpdate(UserDto userDto);

	public void userDeleteOne(int no);

	//비밀번호찾기
	public void userFindPw(HttpServletResponse response, UserDto userDto)throws Exception;
		
	//이메일발송
	public void sendEmail(UserDto userDto, String Div)throws Exception;
	
		
		
	}


