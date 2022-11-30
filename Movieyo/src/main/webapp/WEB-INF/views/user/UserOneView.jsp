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
		location.href="./passwordUpdate.do?userNo=" + ${userDto2.userNo};
	}
	function popUp() {
		let popUrl = "/Movieyo/user/authorPop.do?userNo=" + ${userDto2.userNo};
		let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl, "작가 찾기",popOption);
	}
	
</script>

</head>
	
<body>

	<jsp:include page="../Header.jsp" />
	<jsp:include page="../UserMyPageSideMenu.jsp"></jsp:include>
	<h1>내정보</h1>
	<form action='./update.do' method='get'>
		<input type="hidden" name='userNo' value='${userDto2.userNo}'>
<%-- 		<input type="text" name="gender" value="${userDto.gender}"> --%>
<!-- 		번호: <input type="text" name='no' -->
<%-- 			value='${userDto.no}' readonly="readonly"><br> --%>
		이름: <input type='text' name='userName' id='memberName'
			value='${userDto2.userName}' readonly="readonly"><br>
		가입일: <fmt:formatDate value="${userDto2.userCreateDate}" 
			pattern="yyyy년 MM월 dd일 "/><br>
		생년월일: <fmt:formatDate value="${userDto2.userBirth}" 
			pattern="yyyy년 MM월 dd일 "/><br>
		닉네임:<input type="text" name="nickname" value="${userDto2.nickname}"
		readonly="readonly"><br>
<%-- 		선호장르: <input type="text" value="${userDto2.genreNo}"> --%>
		작성글 갯수: 	<a href="#">작성글바로가기</a>		<br>
			
		<input type='submit' value='회원정보 수정'>
		<input type="button" value="비밀번호 변경"
		onclick="pwUpdate();">
		<a onclick="popUp()">회원탈퇴</a>
		<input type="text" value="${userDto2.password}">
<%-- 		 <a href='./deleteCtr.do?no=${userDto.no}'>회원탈퇴</a><br> --%>
					
	</form>
	<form name="frmMother" method="POST">
		<input type="hidden" value="${userDto.password}" id="password">
		<input type="hidden" name="passwordChk" value="">
	</form>
	<jsp:include page="../Tail.jsp" />
</body>
</html>