package com.movieyo.refund.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RefundDto {

	private int refundNo;		//기본키 - 환불번호
	private int userNo;			//외래키 - 유저번호
	private String movieTitle;	//영화제목
	private int moviePrice;		//영화가격
	private Date buyDate;		//구매일
	private int buyNo;			//외래키 - 구매번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date refundDate;	//환불일
	private String refundStatus;	//환불상태
	
	public RefundDto() {
		super();
	}

	public RefundDto(int refundNo, int userNo, String movieTitle, int moviePrice, Date buyDate, int buyNo,
			Date refundDate, String refundStatus) {
		super();
		this.refundNo = refundNo;
		this.userNo = userNo;
		this.movieTitle = movieTitle;
		this.moviePrice = moviePrice;
		this.buyDate = buyDate;
		this.buyNo = buyNo;
		this.refundDate = refundDate;
		this.refundStatus = refundStatus;
	}

	public int getRefundNo() {
		return refundNo;
	}

	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public int getMoviePrice() {
		return moviePrice;
	}

	public void setMoviePrice(int moviePrice) {
		this.moviePrice = moviePrice;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public int getBuyNo() {
		return buyNo;
	}

	public void setBuyNo(int buyNo) {
		this.buyNo = buyNo;
	}

	public Date getRefundDate() {
		return refundDate;
	}

	public void setRefundDate(Date refundDate) {
		this.refundDate = refundDate;
	}

	public String getRefundStatus() {
		return refundStatus;
	}

	public void setRefundStatus(String refundStatus) {
		this.refundStatus = refundStatus;
	}

	@Override
	public String toString() {
		return "RefundDto [refundNo=" + refundNo + ", userNo=" + userNo + ", movieTitle=" + movieTitle + ", moviePrice="
				+ moviePrice + ", buyDate=" + buyDate + ", buyNo=" + buyNo + ", refundDate=" + refundDate
				+ ", refundStatus=" + refundStatus + "]";
	}
	
}
