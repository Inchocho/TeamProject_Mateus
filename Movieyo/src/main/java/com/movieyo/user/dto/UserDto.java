package com.movieyo.user.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class UserDto {

	private int userNo;
	private String Email;
	private String Password;
	private String userName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date userBirth;
	private Date userCreateDate;
	private String nickname;
	private String gender;
	
	public UserDto(int userNo, String email, String password, String userName, Date userBirth, Date userCreateDate,
			String nickname, String gender) {
		super();
		this.userNo = userNo;
		Email = email;
		Password = password;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userCreateDate = userCreateDate;
		this.nickname = nickname;
		this.gender = gender;
	}

	public UserDto() {
		super();
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}

	public Date getUserCreateDate() {
		return userCreateDate;
	}

	public void setUserCreateDate(Date userCreateDate) {
		this.userCreateDate = userCreateDate;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "UserDto [userNo=" + userNo + ", Email=" + Email + ", Password=" + Password + ", userName=" + userName
				+ ", userBirth=" + userBirth + ", userCreateDate=" + userCreateDate + ", nickname=" + nickname
				+ ", gender=" + gender + "]";
	}
	
}
