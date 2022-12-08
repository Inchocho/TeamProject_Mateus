package com.movieyo.user.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.movieyo.user.dao.UserDao;
import com.movieyo.user.dto.UserDto;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	public UserDao userDao;
	
	@Override
	public UserDto userExist(String email, String password) {
		// TODO Auto-generated method stub
		return userDao.userExist(email, password);
	}

	@Override
	public void userInsertOne(UserDto userDto) throws Exception {
		// TODO Auto-generated method stub
		userDao.userInsertOne(userDto);
	}
	
	@Override
	public Map<String, Object> userSelectOne(int userNo) {
		// TODO Auto-generated method stub
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		UserDto userDto = userDao.userSelectOne(userNo);
		resultMap.put("userDto", userDto);
		
		
		return resultMap;
	}

	@Override
	public void userUpdateOne(UserDto userDto) {
		// TODO Auto-generated method stub
		userDao.userUpdateOne(userDto);
	}

	@Override
	public void passwordUpdate(UserDto userDto) {
		// TODO Auto-generated method stub
		userDao.passwordUpdate(userDto);
	}

	@Override
	public void userDeleteOne(int userNo) {
		// TODO Auto-generated method stub
		userDao.userDeleteOne(userNo);
	}

	


		//비밀번호찾기
		@Override
		public void userFindPw(HttpServletResponse response, UserDto userDto) throws Exception {
			response.setContentType("text/html;charset=utf-8");
			
			UserDto ck = userDao.readMember(userDto.getEmail());
			
			PrintWriter out = response.getWriter();
			// 가입된 아이디가 없으면
//			if(userDao.idCheck(userDto.getEmail()) == 0) {
//				out.print("등록되지 않은 아이디입니다.");
//				out.close();
//			}
			// 가입된 이메일이 아니면
			if(!userDto.getEmail().equals(ck.getEmail())) {
				out.print("등록되지 않은 이메일입니다.");
				out.close();
			}else {
				// 임시 비밀번호 생성
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				userDto.setPassword(pw);
				// 비밀번호 변경
				userDao.updatePw(userDto);
				// 비밀번호 변경 메일 발송
				userDto.setUserName(ck.getUserName());
				sendEmail(userDto, "findpw");

				out.print("이메일로 임시 비밀번호를 발송하였습니다.");
				out.close();
			}
		}
		
		//비밀번호 찾기 이메일발송
				@Override
				public void sendEmail(UserDto userDto, String div) throws Exception {
					// Mail Server 설정
					String charSet = "utf-8";
					String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
					String hostSMTPid = "네이버아이디";	// 11월 15일 20시 수정
					String hostSMTPpwd = "네이버비밀번호";

					// 보내는 사람 EMail, 제목, 내용
					String fromEmail = "네이버아이디@naver.com";
					String fromName = "이영빈";
					String subject = "";
					String msg = "";

					if(div.equals("findpw")) {
						subject = "무비요 임시 비밀번호 입니다.";
						msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
						msg += "<h3 style='color: blue;'>";
						msg += userDto.getUserName() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
						msg += "<p>임시 비밀번호 : ";
						msg += userDto.getPassword() + "</p></div>";
					}

					// 받는 사람 E-Mail 주소
					String mail = userDto.getEmail();
					try {
						HtmlEmail email = new HtmlEmail();
						email.setDebug(true);
						email.setCharset(charSet);
						email.setSSL(true);
						email.setHostName(hostSMTP);
						email.setSmtpPort(587); //네이버 이용시 587

						
						email.setAuthentication(hostSMTPid, hostSMTPpwd);
						email.setTLS(true);
						email.addTo(mail, charSet);
						email.setFrom(fromEmail, fromName, charSet);
						email.setSubject(subject);
						email.setHtmlMsg(msg);
//						Properties props = new Properties();
//				        props.put("mail.smtp.user", email);
//				        props.put("mail.smtp.host", hostSMTP);
//				        props.put("mail.smtp.port", 587);
//				        props.put("mail.smtp.starttls.enable", "true");
//				        props.put("mail.smtp.auth", "true");
//				        props.put("mail.smtp.socketFactory.port", 587);
//				        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//				        props.put("mail.smtp.socketFactory.fallback", "false");

						email.send();
						
						
					} catch (Exception e) {
						System.out.println("메일발송 실패 : " + e);
					}
				}

		@Override
		public int userSelectTotalCount(String searchOption, String keyword) {
			// TODO Auto-generated method stub
			return userDao.userSelectTotalCount(searchOption, keyword);
		}

		@Override
		public List<UserDto> userSelectList(String searchOption, String keyword, int start, int end) {
			// TODO Auto-generated method stub
			return userDao.userSelectList(searchOption, keyword, start, end);
		}

		@Override
		public void userGenre(int checkNum, int userNo) {
			// TODO Auto-generated method stub
			userDao.userGenre(checkNum, userNo);
		}

		@Override
		public UserDto chargeMpointCtr(UserDto userDto, int afterMpoint) {
			// TODO Auto-generated method stub
			UserDto userDtoNew= userDao.chargeMpointCtr(userDto,afterMpoint);
			
			return userDtoNew;
		}

		@Override
		public int userBuyMovie(int userNo, int moviePrice) {
			// TODO Auto-generated method stub
			
			return userDao.userBuyMovie(userNo, moviePrice);
		}

		@Override
		public int userCurrentCash(int userNo) {
			// TODO Auto-generated method stub
			return userDao.userCurrentCash(userNo);
		}

		@Override
		public void userGenreDelete(int userNo) {
			// TODO Auto-generated method stub
			userDao.userGenreDelete(userNo);
		}

		@Override
		public void userRefundDelete(int userNo) {
			// TODO Auto-generated method stub
			userDao.userRefundDelete(userNo);
		}

				
				
}
