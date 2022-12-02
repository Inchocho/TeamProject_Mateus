package com.movieyo.cart.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieyo.cart.dao.CartDao;
import com.movieyo.cart.dto.CartDto;

@Service
public class CartServiceImpl implements CartService {

	private static final Logger log 
	= LoggerFactory.getLogger(CartServiceImpl.class);	

	@Autowired
	public CartDao cartDao;

	@Override
	public int selectTotalCount(String searchOption, String keyword, int userNo) {
		// TODO Auto-generated method stub
		return cartDao.selectTotalCount(searchOption, keyword, userNo);
	}

	@Override
	public List<Map<String, Object>> selectList(String searchOption, String keyword, int start, int end, int userNo) {
		// TODO Auto-generated method stub
		return cartDao.selectList(searchOption,keyword,start,end,userNo);
	}

	@Override
	public int cartExistOne(int userNo, int movieNo) {
		// TODO Auto-generated method stub
		return cartDao.cartExistOne(userNo,movieNo);
	}

	@Override
	public void cartInsertOne(int userNo, int movieNo) {
		// TODO Auto-generated method stub
		CartDto cartDto = new CartDto();
		cartDto.setUserNo(userNo);
		cartDto.setMovieNo(movieNo);
		
		cartDao.cartInsertOne(cartDto);
	}

	@Override
	public void deleteCart(int cartNo) {
		// TODO Auto-generated method stub
		cartDao.deleteCart(cartNo);
	}

	@Override
	public int selectCartNo(int userNo, int movieNo) {
		// TODO Auto-generated method stub
		return cartDao.selectCartNo(userNo, movieNo);
	}

	
	
}
