package com.movieyo.movie.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class MovieDto {

    private int movieNo; // 영화번호
    private int genreNo; // 장르번호
    private String genreName; // 장르이름
    private String movieTitle; // 영화제목    
    @DateTimeFormat(pattern = "yyyy")
    private Date prdtYear;	// 제작년도(yyyy 년도만 받음)
    private String nation;		// 제작국가    
    private String director;	// 제작감독
    private int runtime;		// 상영시간
    private String grade;		// 영화등급
    private int price;		// 영화가격
    private String registrant; // 영화등록 작성자
    private Date creDate; // 영화 등록일
    private int rate;		// 영화점수(추천시스템을 위함)
    private String movieStory;
    
    public MovieDto() {
		super();
	}

	public int getMovieNo() {
		return movieNo;
	}

	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}

	public int getGenreNo() {
		return genreNo;
	}

	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

	public String getMovieTitle() {
		return movieTitle;
	}

	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}

	public Date getPrdtYear() {
		return prdtYear;
	}

	public void setPrdtYear(Date prdtYear) {
		this.prdtYear = prdtYear;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRegistrant() {
		return registrant;
	}

	public void setRegistrant(String registrant) {
		this.registrant = registrant;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public String getMovieStory() {
		return movieStory;
	}

	public void setMovieStory(String movieStory) {
		this.movieStory = movieStory;
	}

	public MovieDto(int movieNo, int genreNo, String genreName, String movieTitle, Date prdtYear, String nation,
			String director, int runtime, String grade, int price, String registrant, Date creDate, int rate,
			String movieStory) {
		super();
		this.movieNo = movieNo;
		this.genreNo = genreNo;
		this.genreName = genreName;
		this.movieTitle = movieTitle;
		this.prdtYear = prdtYear;
		this.nation = nation;
		this.director = director;
		this.runtime = runtime;
		this.grade = grade;
		this.price = price;
		this.registrant = registrant;
		this.creDate = creDate;
		this.rate = rate;
		this.movieStory = movieStory;
	}

	@Override
	public String toString() {
		return "MovieDto [movieNo=" + movieNo + ", genreNo=" + genreNo + ", genreName=" + genreName + ", movieTitle="
				+ movieTitle + ", prdtYear=" + prdtYear + ", nation=" + nation + ", director=" + director + ", runtime="
				+ runtime + ", grade=" + grade + ", price=" + price + ", registrant=" + registrant + ", creDate="
				+ creDate + ", rate=" + rate + ", movieStory=" + movieStory + "]";
	}

    
}
