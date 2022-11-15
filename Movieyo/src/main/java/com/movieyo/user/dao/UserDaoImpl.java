package com.movieyo.user.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieyo.user.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
//	String namespace = "com.movieyo.user";
	
	@Override
	public UserDto userExist(String email, String password) {
		
		//이메일과 패스워드 값을 넘기기 위해서(값을 2개이상 전달시 HashMap 사용)
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", email);
		paramMap.put("password", password);
 
		return sqlSession.selectOne("com.movieyo.user.userExist", paramMap);
	}

	@Override
	public int userInsertOne(UserDto userDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("com.movieyo.user.userInsertOne", userDto);
	}

	@Override
	public UserDto userSelectOne(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.movieyo.user.userSelectOne", userNo);
	}

	@Override
	public int userUpdateOne(UserDto userDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.movieyo.user.userUpdateOne", userDto);
	}

	@Override
	public int passwordUpdate(UserDto userDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.movieyo.user.passwordUpdate", userDto);
	}

	@Override
	public void userDeleteOne(int userNo) {
		// TODO Auto-generated method stub
		sqlSession.delete("com.movieyo.user.userDeleteOne", userNo);
	}
	
	@Override
	public int updatePw(UserDto userDto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("com.movieyo.user.updatePw", userDto);
	}

	@Override
	public UserDto readMember(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.movieyo.user.readMember", email);
	}
	
}
