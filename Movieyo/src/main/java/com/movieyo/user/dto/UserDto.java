package com.movieyo.user.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class UserDto {

    private int no; 
    private String email;
    private String password;
    private String name;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthdate = null;
    private Date createDate = null;
    private String nickname;
    private String gender;
	
    public UserDto() {
		super();
	}

	public UserDto(int no, String email, String password, String name, Date birthdate, Date createDate, String nickname,
			String gender) {
		super();
		this.no = no;
		this.email = email;
		this.password = password;
		this.name = name;
		this.birthdate = birthdate;
		this.createDate = createDate;
		this.nickname = nickname;
		this.gender = gender;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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
		return "UserDto [no=" + no + ", email=" + email + ", password=" + password + ", name=" + name + ", birthdate="
				+ birthdate + ", createDate=" + createDate + ", nickname=" + nickname + ", gender=" + gender + "]";
	}

	

	

	

	

    
}
