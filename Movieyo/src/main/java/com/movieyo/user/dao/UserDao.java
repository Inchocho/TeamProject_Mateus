package com.movieyo.user.dao;

import com.movieyo.user.dto.UserDto;

public interface UserDao {

	public UserDto userExist(String email, String password);

	public int userInsertOne(UserDto userDto);

	public UserDto userSelectOne(int no);

	public int userUpdateOne(UserDto userDto);

	public int passwordUpdate(UserDto userDto);

	public void userDeleteOne(int no);

	//비밀번호변경
	public int updatePw(UserDto userDto)throws Exception;
	public UserDto readMember(String email);
	
	
}
