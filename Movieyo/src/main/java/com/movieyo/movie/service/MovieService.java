package com.movieyo.movie.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.movie.dto.MovieDto;

public interface MovieService {

	void movieInsertOne(MovieDto movieDto, MultipartHttpServletRequest mulRequest) throws Exception;

}
