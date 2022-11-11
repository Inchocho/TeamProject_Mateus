package com.movieyo.user.dao;

import com.movieyo.user.dto.UserDto;

public interface UserDao {

	public UserDto userExist(String email, String password);

	public int userInsertOne(UserDto userDto);
	
}
