package com.movieyo.user.dao;

import java.util.List;

import com.movieyo.user.dto.UserDto;

public interface UserDao {

	public UserDto userExist(String email, String password);

	public int userInsertOne(UserDto userDto);

	public UserDto userSelectOne(int userNo);

	public int userUpdateOne(UserDto userDto);

	public int passwordUpdate(UserDto userDto);

	public void userDeleteOne(int userNo);

	//비밀번호변경
	public int updatePw(UserDto userDto)throws Exception;
	public UserDto readMember(String email);

	public int userSelectTotalCount(String searchOption, String keyword);

	public List<UserDto> userSelectList(String searchOption, String keyword, int start, int end);

	public void userGenre(int checkNum, int userNo);

	public UserDto chargeMpointCtr(UserDto userDto, int afterMpoint);

	public int userBuyMovie(int userNo, int moviePrice);

	public int userCurrentCash(int userNo);

	public void userGenreDelete(int userNo);

	public void userRefundDelete(int userNo);
	
	
}
