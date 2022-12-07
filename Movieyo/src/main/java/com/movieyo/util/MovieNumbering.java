package com.movieyo.util;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class MovieNumbering {
	
	private static int movieNo = 0;
	
	public static String getMovieNo() {
		
		LocalTime now = LocalTime.now();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HHmmss");
		
		String formatedNow = now.format(formatter);
		
		movieNo++;
		
		String movie = "영화번호";
		
		movie = formatedNow + movie + movieNo;
		
		return movie;
	}
}
