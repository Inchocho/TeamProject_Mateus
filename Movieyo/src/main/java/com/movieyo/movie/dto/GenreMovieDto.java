package com.movieyo.movie.dto;

public class GenreMovieDto {

	private int genreMovieNo;	//장르영화번호 PK
	private int movieNo;		//영화번호 FK
	private int genreNo;		//장르번호 FK
	
	public GenreMovieDto(int genreMovieNo, int movieNo, int genreNo) {
		super();
		this.genreMovieNo = genreMovieNo;
		this.movieNo = movieNo;
		this.genreNo = genreNo;
	}

	public GenreMovieDto() {
		super();
	}

	public int getGenreMovieNo() {
		return genreMovieNo;
	}

	public void setGenreMovieNo(int genreMovieNo) {
		this.genreMovieNo = genreMovieNo;
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

	@Override
	public String toString() {
		return "GenreMovieDto [genreMovieNo=" + genreMovieNo + ", movieNo=" + movieNo + ", genreNo=" + genreNo + "]";
	}
	
}
