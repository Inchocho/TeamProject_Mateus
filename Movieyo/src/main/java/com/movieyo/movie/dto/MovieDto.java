package com.movieyo.movie.dto;

public class MovieDto {

    private int movieNo; // 영화번호
    private String movieTitle; // 영화제목    
    private String prdtYear;	// 제작년도(yyyy 년도만 받음)
    private String nation;		// 제작국가    
    private String director;	// 제작감독
    private String runtime;		// 상영시간
    private String grade;		// 영화등급
    private int price;		// 영화가격
    private int rate;		// 영화점수(추천시스템을 위함)
    
	public MovieDto(int movieNo, String movieTitle, String prdtYear, String nation, String director, String runtime,
			String grade, int price, int rate) {
		super();
		this.movieNo = movieNo;
		this.movieTitle = movieTitle;
		this.prdtYear = prdtYear;
		this.nation = nation;
		this.director = director;
		this.runtime = runtime;
		this.grade = grade;
		this.price = price;
		this.rate = rate;
	}
	
	public MovieDto() {
		super();
	}

	public int getMovieNo() {
		return movieNo;
	}
	public void setMovieNo(int movieNo) {
		this.movieNo = movieNo;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getPrdtYear() {
		return prdtYear;
	}
	public void setPrdtYear(String prdtYear) {
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
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
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
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}

	@Override
	public String toString() {
		return "MovieDto [movieNo=" + movieNo + ", movieTitle=" + movieTitle + ", prdtYear=" + prdtYear + ", nation="
				+ nation + ", director=" + director + ", runtime=" + runtime + ", grade=" + grade + ", price=" + price
				+ ", rate=" + rate + "]";
	}
    
}
