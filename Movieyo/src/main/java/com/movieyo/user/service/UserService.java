package com.movieyo.user.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.user.dto.UserDto;

public interface UserService {

	public UserDto userExist(String email, String password);

	public void userInsertOne(UserDto userDto)throws Exception;
		
	
		
		
	}


