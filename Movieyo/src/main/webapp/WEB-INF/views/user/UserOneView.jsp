<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보 상세조회</title>


<script type="text/javascript">
	function pwUpdate() {
		location.href="./passwordUpdate.do?no=" + ${userDto.no};
	}
	function popUp() {
		let popUrl = "/user/windowBasic1PopUp";
		let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl, "작가 찾기",popOption);
	}
	
</script>

</head>
	
<body>

<%-- 	<jsp:include page="../Header.jsp" /> --%>
	
<!-- 	<img alt="이미지 경로 테스트 실패"  -->
<%-- 		src="<c:url value='/resources/img/jquery_error.jpg'/>"> --%>
<!-- 	<img alt="이미지 경로 테스트 실패"  -->
<!-- 		src='/springHome/resources/img/jquery_error.jpg'> -->
	
	<h1>내정보</h1>
	<form action='./update.do' method='get'>
		<input type="hidden" name='no' value='${userDto.no}'>
<%-- 		<input type="text" name="gender" value="${userDto.gender}"> --%>
<!-- 		번호: <input type="text" name='no' -->
<%-- 			value='${userDto.no}' readonly="readonly"><br> --%>
		이름: <input type='text' name='name' id='memberName'
			value='${userDto.name}' readonly="readonly"><br>
		가입일: <fmt:formatDate value="${userDto.createDate}" 
			pattern="yyyy년 MM월 dd일 "/><br>
		생년월일: <fmt:formatDate value="${userDto.birthdate}" 
			pattern="yyyy년 MM월 dd일 "/><br>
		닉네임:<input type="text" name="nickname" value="${userDto.nickname}"
		readonly="readonly"><br>
		선호장르: <br>
		작성글 갯수: 	<a href="#">작성글바로가기</a>		<br>
			
		<input type='submit' value='회원정보 수정'>
		<input type="button" value="비밀번호 변경"
		onclick="pwUpdate();">
		<a onclick="popUp()">회원탈퇴</a>
<%-- 		 <a href='./deleteCtr.do?no=${userDto.no}'>회원탈퇴</a><br> --%>
					
	</form>
	
</body>
</html>