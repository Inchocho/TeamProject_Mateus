package com.movieyo.user.dto;

public class UserGenreDto {

	private int genreUserNo;
	private int userNo;
	private int genreNo;
	
	public UserGenreDto() {
		super();
	}

	public int getGenreUserNo() {
		return genreUserNo;
	}

	public void setGenreUserNo(int genreUserNo) {
		this.genreUserNo = genreUserNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getGenreNo() {
		return genreNo;
	}

	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}

	public UserGenreDto(int genreUserNo, int userNo, int genreNo) {
		super();
		this.genreUserNo = genreUserNo;
		this.userNo = userNo;
		this.genreNo = genreNo;
	}

	@Override
	public String toString() {
		return "UserGenreDto [genreUserNo=" + genreUserNo + ", userNo=" + userNo + ", genreNo=" + genreNo + "]";
	}
	
}
