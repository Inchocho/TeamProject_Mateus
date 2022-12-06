package com.movieyo.movie.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.movie.dao.MovieDao;
import com.movieyo.movie.dto.MovieDto;
import com.movieyo.util.FileUtils;

@Service
public class MovieServiceImpl implements MovieService{
	
	private static final Logger log
		= LoggerFactory.getLogger(MovieServiceImpl.class);

	@Autowired
	public MovieDao movieDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public void movieInsertOne(MovieDto movieDto, MultipartHttpServletRequest mulRequest) throws Exception {
		// TODO Auto-generated method stub
		movieDao.movieInsertOne(movieDto, mulRequest);
		
		Iterator<String> iterator = mulRequest.getFileNames();
		MultipartFile multipartFile = null;
		
		while(iterator.hasNext()) {
			multipartFile = mulRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
				log.debug("-------- file start --------");
				
				log.debug("name : {}", multipartFile.getName());
				log.debug("fileName : {}", multipartFile.getOriginalFilename());
				log.debug("size : {}", multipartFile.getSize());
				
				log.debug("-------- file end --------\n");
			}
		}	// while end
		
		//10.18파일 업로드에 들어가는 memberDto.getNo를 처리하기위해 생성후 조회하는 쿼리를  수행
		//int parentSeq = memberDao.getMemberNo();
		
		//mapper에서 generateKey를 통해 getNo를 얻어옴
		int parentSeq = movieDto.getMovieNo();
			
		List<Map<String, Object>> list
		= fileUtils.parseInsertFileInfo(parentSeq
			, mulRequest);
		
		//다수의 동시 업로드를 처리하기 위해 list를 사용함 - 기존 단건 업로드시 Map형식으로 작성하면 끝
		for (int i = 0; i < list.size(); i++) {
			movieDao.insertFile(list.get(i));
		}		
	}

	@Override
	public int movieSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return movieDao.movieSelectTotalCount(searchOption, keyword);
	}

	@Override
	public List<MovieDto> movieSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		// movieNo를 뽑을 쿼리 
		
		return movieDao.movieSelectList(searchOption, keyword, start, end);
	}

	@Override
	public Map<String, Object> movieSelectOne(int movieNo) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MovieDto movieDto = movieDao.movieSelectOne(movieNo);
		
		resultMap.put("movieDto", movieDto);
		
		List<Map<String, Object>> fileList = movieDao.fileselectList(movieNo);
		resultMap.put("fileList", fileList);
		
		return resultMap;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int movieUpdateOne(MovieDto movieDto, MultipartHttpServletRequest multipartHttpServletRequest, int fileIdx) throws Exception {
		// TODO Auto-generated method stub
		int resultNum = 0;
		
		try {
			resultNum = movieDao.movieUpdateOne(movieDto);
			
			
			int parentSeq = movieDto.getMovieNo();
			//해당번호에 맞는 저장된 파일명이 tempFileMap에 담김
			Map<String, Object> tempFileMap = movieDao.fileSelectStoredFileName(parentSeq);
			
			movieDao.fileDelete(parentSeq);
			
			List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(parentSeq, multipartHttpServletRequest);
			
			System.out.println(tempFileMap);
			
			if (list.isEmpty() == false) {
				System.out.println("여기를 타니? --- 1");
				System.out.println(list + "널인지 확인");
				System.out.println(tempFileMap + "널인지 확인");
				//해당번호에 셀렉트된 파일이 있으면?
				if (tempFileMap != null) {
					System.out.println("여기를 타니? --- 2");
					
					//파일을 지움 <-- 여기서 무조건 파일이 지워짐					
//					movieDao.fileDelete(parentSeq);
					
					//삭제만 처리하고 변경은 막기위해 예외처리
//					throw new Exception();
					
					//기존의 파일이 존재하는데 새로운 파일로 변경하는 경우
					fileUtils.parseUpdateFileInfo(tempFileMap);
				}
				
				for (Map<String, Object> map : list) {
					movieDao.insertFile(map);
				}
			}else if(fileIdx == -1){
				//영화번호에 해당하는 업로드된 파일(물리적인 파일명)이 있는경우
				if (tempFileMap != null) {
					movieDao.fileDelete(parentSeq);
					fileUtils.parseUpdateFileInfo(tempFileMap);
				}
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
	
	return resultNum;
		
			}

	@Override
	public void movieDeleteOne(int movieNo) {
		// TODO Auto-generated method stub
		
		movieDao.movieDeleteOne(movieNo);
	}

	@Override
	public List<Integer> movieNoSelect(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return movieDao.movieNoSelect(searchOption, keyword);
	}

	@Override
	public Map<String, Object> moviefileOne(int movieNo2) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, Object>> fileList = movieDao.fileselectList(movieNo2);
		
		
		resultMap.put("fileList", fileList);
		
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> genreSelect(int userNo) {
		// TODO Auto-generated method stub
		return movieDao.genreSelect(userNo);
	}

	
}
