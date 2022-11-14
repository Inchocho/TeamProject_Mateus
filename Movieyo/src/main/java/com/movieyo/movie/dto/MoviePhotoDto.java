package com.movieyo.movie.dto;

public class MoviePhotoDto {

	private int photoNo;	// 사진번호 (PK)
	private int movieNo;	// 영화번호 (FK)
	private String photoName;	// 사진이름
	
	public MoviePhotoDto(int photoNo, int movieNo, String photoName) {
		super();
		this.photoNo = photoNo;
		this.movieNo = movieNo;
		this.photoName = photoName;
	}

	public MoviePhotoDto() {
		super();
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	@Override
	public String toString() {
		return "MoviePhotoDto [photoNo=" + photoNo + ", movieNo=" + movieNo + ", photoName=" + photoName + "]";
	}
	
}
