package com.movieyo.refund.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RefundDto {

	private int refundNo;
	private int userNo;
	private int buyNo;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date refundDate;
	private String refundStatus;
	
	public RefundDto() {
		super();
	}

	public RefundDto(int refundNo, int userNo, int buyNo, Date refundDate, String refundStatus) {
		super();
		this.refundNo = refundNo;
		this.userNo = userNo;
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
		return "RefundDto [refundNo=" + refundNo + ", userNo=" + userNo + ", buyNo=" + buyNo + ", refundDate="
				+ refundDate + ", refundStatus=" + refundStatus + "]";
	}
	
			
}
