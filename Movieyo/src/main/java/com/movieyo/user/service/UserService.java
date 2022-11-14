package com.movieyo.user.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.user.dto.UserDto;

public interface UserService {

	public UserDto userExist(String email, String password);

	public void userInsertOne(UserDto userDto)throws Exception;

	public Map<String, Object> userSelectOne(int no);

	public void userUpdateOne(UserDto userDto);

	public void passwordUpdate(UserDto userDto);

	public void userDeleteOne(int no);
		
	
		
		
	}


