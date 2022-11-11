package com.movieyo.user.dto;

import java.util.Date;

public class UserDto {

    private int no; 
    private String email;
    private String password;
    private String name;
    private Date birthDate;
    private Date createDate;
    private String nickName;
    private String gender;
    private String genre;
	
    public UserDto() {
		super();
	}

	public UserDto(int no, String email, String password, String name, Date birthDate, Date createDate, String nickName,
			String gender, String genre) {
		super();
		this.no = no;
		this.email = email;
		this.password = password;
		this.name = name;
		this.birthDate = birthDate;
		this.createDate = createDate;
		this.nickName = nickName;
		this.gender = gender;
		this.genre = genre;
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

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	@Override
	public String toString() {
		return "UserDto [no=" + no + ", email=" + email + ", password=" + password + ", name=" + name + ", birthDate="
				+ birthDate + ", createDate=" + createDate + ", nickName=" + nickName + ", gender=" + gender
				+ ", genre=" + genre + "]";
	}
    
    
}
