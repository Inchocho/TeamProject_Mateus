package com.movieyo.buy.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BuyDto {

	private int buyNo;	//PK 구매번호
	private int movieNo;	//FK 영화번호
	private	int	userNo;		//FK 유저번호
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date buyDate;		//구매일
	private String buyStatus;	//구매상태
	
	public BuyDto() {
		super();
	}

	public BuyDto(int buyNo, int movieNo, int userNo, Date buyDate, String buyStatus) {
		super();
		this.buyNo = buyNo;
		this.movieNo = movieNo;
		this.userNo = userNo;
		this.buyDate = buyDate;
		this.buyStatus = buyStatus;
	}

	public BuyDto(int movieNo, int userNo) {
		super();
		this.movieNo = movieNo;
		this.userNo = userNo;
	}

	public int getBuyNo() {
		return buyNo;
	}

	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public String getBuyStatus() {
		return buyStatus;
	}

	public void setBuyStatus(String buyStatus) {
		this.buyStatus = buyStatus;
	}

	@Override
	public String toString() {
		return "BuyDto [buyNo=" + buyNo + ", movieNo=" + movieNo + ", userNo=" + userNo + ", buyDate=" + buyDate
				+ ", buyStatus=" + buyStatus + "]";
	}
	
}
