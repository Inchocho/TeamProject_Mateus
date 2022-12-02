package com.movieyo.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movieyo.user.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
//	String namespace = "com.movieyo.user";
	String namespace = "com.movieyo.user.";
	
	@Override
	public UserDto userExist(String email, String password) {
		
		//이메일과 패스워드 값을 넘기기 위해서(값을 2개이상 전달시 HashMap 사용)
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("email", email);
		paramMap.put("password", password);
 
		return sqlSession.selectOne(namespace + "userExist", paramMap);
	}

	@Override
	public int userInsertOne(UserDto userDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "userInsertOne", userDto);
	}

	@Override
	public UserDto userSelectOne(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "userSelectOne", userNo);
	}

	@Override
	public int userUpdateOne(UserDto userDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "userUpdateOne", userDto);
	}

	@Override
	public int passwordUpdate(UserDto userDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "passwordUpdate", userDto);
	}

	@Override
	public void userDeleteOne(int userNo) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "userDeleteOne", userNo);
	}
	
	@Override
	public int updatePw(UserDto userDto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "updatePw", userDto);
	}

	@Override
	public UserDto readMember(String email) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "readMember", email);
	}

	@Override
	public int userSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "userSelectTotalCount", map);
	}

	@Override
	public List<UserDto> userSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("searchOption", searchOption);
		
		return sqlSession.selectList(namespace + "userSelectList", map);
	}

	@Override
	public void userGenre(int checkNum, int userNo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("genreNo", checkNum);
		map.put("userNo", userNo);
		
		sqlSession.insert("com.movieyo.genre.userGenre", map);
	}

	@Override
	public UserDto chargeMpointCtr(UserDto userDto, int afterMpoint) {
		// TODO Auto-generated method stub
		int userNo = userDto.getUserNo();
		userDto.setUserCash(afterMpoint);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userCash", afterMpoint);
		map.put("userNo", userNo);
		
		sqlSession.update(namespace + "updateCash", map);
		
		return userDto;
	}

	@Override
	public int userBuyMovie(int userNo, int moviePrice) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userNo", userNo);
		map.put("moviePrice", moviePrice);
		
		return sqlSession.update(namespace + "userBuyMovie", map);
	}

	@Override
	public int userCurrentCash(int userNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "userCurrentCash", userNo);
	}

	
	
}
