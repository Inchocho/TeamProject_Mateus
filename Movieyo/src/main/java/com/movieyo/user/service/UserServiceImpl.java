package com.movieyo.user.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.user.dao.UserDao;
import com.movieyo.user.dto.UserDto;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	public UserDao userDao;
	
	@Override
	public UserDto userExist(String email, String password) {
		// TODO Auto-generated method stub
		return userDao.userExist(email, password);
	}

	@Override
	public void userInsertOne(UserDto userDto) throws Exception {
		// TODO Auto-generated method stub
		userDao.userInsertOne(userDto);
	}
	
	@Override
	public Map<String, Object> userSelectOne(int no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		UserDto userDto = userDao.userSelectOne(no);
		resultMap.put("userDto", userDto);
		
		
		return resultMap;
	}

	@Override
	public void userUpdateOne(UserDto userDto) {
		// TODO Auto-generated method stub
		userDao.userUpdateOne(userDto);
	}

	@Override
	public void passwordUpdate(UserDto userDto) {
		// TODO Auto-generated method stub
		userDao.passwordUpdate(userDto);
	}

	@Override
	public void userDeleteOne(int no) {
		// TODO Auto-generated method stub
		userDao.userDeleteOne(no);
	}
}
