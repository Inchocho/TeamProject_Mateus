<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보 상세조회</title>
<style type="text/css">
table, tr, td, th {
	border: 1px solid black;
}

table {
	border-collapse: collapse;
}

#tdId {
	width: 500px;
	height: 500px;
	text-align: center;
	font-weight: bolder;
}

.curPageDiv{
	margin: 0px 0px 0px 200px;
	text-align: center;
	min-width: 600px;
}
.titleContainer{
	border-bottom: 2px solid #252525;
	margin: 3px 3px 3px 0px;
	padding-right: 400px;
}

.contContainer{
    width: 600px;
    padding: 10px 0 0 30px;
    margin: auto;
}

#ul li {
	list-style-type: none;
	float: left;
	margin-left: 10px;
}

th {
	background-color: gray;
}
</style>

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
<div class="curPageDiv">
<div class="titleContainer">
	<c:choose>
		<c:when test='${adminCheck == 0 || userDto2.userAdmin == 1}'>	
			<h1>내정보</h1>
		</c:when>
		<c:otherwise>
			<h1>${userDto2.nickname}님의 회원정보</h1>
		</c:otherwise>
	</c:choose>
</div>
		
<div class="contContainer">
	<form action='./update.do' method='get'>
		<input type="hidden" name="adminCheck" value='${adminCheck}'>
		<input type="hidden" name='userNo' value='${userDto2.userNo}'>
		이름: <input type='text' name='userName' id='memberName'
			value='${userDto2.userName}' readonly="readonly"><br>
		가입일: <input type="text" name='userCreateDate' value='<fmt:formatDate value="${userDto2.userCreateDate}" 
			pattern="yyyy년 MM월 dd일"/>'><br>
		생년월일: <input type='text' name='userBirth' value='<fmt:formatDate value="${userDto2.userBirth}" 
			pattern="yyyy년 MM월 dd일 "/>'>	<br>
		닉네임:<input type="text" name="nickname" value="${userDto2.nickname}"
		readonly="readonly"><br>
		성별:<input type="text" name="gender" value="${userDto2.gender}"
		 readonly="readonly"><br>
<%-- 		선호장르: <input type="text" value="${userDto2.genreNo}"> --%>
		작성글 갯수: 	<a href="#">작성글바로가기</a>		<br>
			
		<input type='submit' value='회원정보 수정'>
			<c:if test='${adminCheck == 0 || userDto2.userAdmin == 1}'>
				<input type="button" value="비밀번호 변경"
				onclick="pwUpdate();">
			</c:if>
		<a onclick="popUp()">
			<input type="button" value="회원탈퇴">
		</a>
<%-- 		 <a href='./deleteCtr.do?no=${userDto.no}'>회원탈퇴</a><br> --%>
					
	</form>
	<form name="frmMother" method="POST">
		<input type="hidden" value="${userDto.password}" id="password">		
		<input type="hidden" name="passwordChk" value="">
		<input type='hidden' name='userName' id='memberName'value='${userDto2.userName}'><br>
		<input type="hidden" name='userCreateDate' value='<fmt:formatDate value="${userDto2.userCreateDate}" 
			pattern="yyyy년 MM월 dd일"/>'>
		<input type='hidden' name='userBirth' value='<fmt:formatDate value="${userDto2.userBirth}" 
			pattern="yyyy년 MM월 dd일 "/>'>		
		<input type="hidden" name="nickname" value="${userDto2.nickname}">
		<input type="hidden" name="gender" value="${userDto2.gender}">		
		<input type='hidden' name='userAdmin' value="${userDto2.userAdmin}">
	</form>
</div></div>
	<jsp:include page="../Tail.jsp" />
</body>
</html>