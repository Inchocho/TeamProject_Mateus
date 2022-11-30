package com.movieyo.cart.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CartDto {

	private int cartNo;		//PK 카트번호
	private	int	userNo;		//FK 유저번호
	private int movieNo;	//FK 영화번호
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date inCartDate;	//담은날짜
	
	public CartDto() {
		super();
	}

	public CartDto(int cartNo, int userNo, int movieNo, Date inCartDate) {
		super();
		this.cartNo = cartNo;
		this.userNo = userNo;
		this.movieNo = movieNo;
		this.inCartDate = inCartDate;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public Date getInCartDate() {
		return inCartDate;
	}

	public void setInCartDate(Date inCartDate) {
		this.inCartDate = inCartDate;
	}

	@Override
	public String toString() {
		return "CartDto [cartNo=" + cartNo + ", userNo=" + userNo + ", movieNo=" + movieNo + ", inCartDate="
				+ inCartDate + "]";
	}
	
	
}