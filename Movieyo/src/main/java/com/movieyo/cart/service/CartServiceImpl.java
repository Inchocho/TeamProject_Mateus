package com.movieyo.cart.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movieyo.cart.dao.CartDao;

@Service
public class CartServiceImpl implements CartService {

	private static final Logger log 
	= LoggerFactory.getLogger(CartServiceImpl.class);	

	@Autowired
	public CartDao cartDao;

	
	
}
