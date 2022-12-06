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

.detailFormDiv, .detailForm_top, .detailForm_bottom {
	display: flex;
	text-align: left;
}

.contContainer {
	width: 620px;
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
.detailFormDiv {
	border: 1px solid black;
}

.p {
	width: 100px;
	height: 30px;
	margin: 0px 30px 0px 0px;
	font-size: 20px;
	margin-block: initial;
	height: 30px;
}

.userInfo {
	display: flex;
	align-items: center;
	height: 45px;
	border-bottom: 1px dashed #d1d1d1;
	margin: 2px 0px;
}

.btn_area {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
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
<div class="titleContainer">
<div class="curPageDiv">
	<c:choose>
		<c:when test='${adminCheck == 0 || userDto2.userAdmin == 1}'>	
			<h1>내정보</h1>
		</c:when>
		<c:otherwise>
			<h1>${userDto2.nickname}님의 회원정보</h1>
		</c:otherwise>
	</c:choose>
</div>
</div>
		
<div class="contContainer">
	<form action='./update.do' method='get'>
	<div class="detailFormDiv">
	<div class="detailForm_top">
		<input type="hidden" name="adminCheck" value='${adminCheck}'>
		<input type="hidden" name='userNo' value='${userDto2.userNo}'>
		<div style="width: 620px; margin-top: 13px;">
			<div class="userInfo">
				<p class="p">이름</p>
				<p class="p">${userDto2.userName}</p>
			</div>
			<div class="userInfo">
				<p class="p">가입일</p>
				<p class="p" style="width: 300px;"><fmt:formatDate value="${userDto2.userCreateDate}" pattern="yyyy년 MM월 dd일"/></p>
			</div>
			<div class="userInfo">
				<p class="p">생년월일</p>
				<p class="p" style="width: 300px;"><fmt:formatDate value="${userDto2.userBirth}" pattern="yyyy년 MM월 dd일"/></p>
			</div>
			<div class="userInfo">
				<p class="p">닉네임</p>
				<p class="p">${userDto2.nickname}</p>
			</div>
			<div class="userInfo">
				<p class="p">성별</p>
				<p class="p">${userDto2.gender}</p>
			</div>
		</div>
		</div>
		</div>
		<div class="btn_area">
			<input type='submit' value='회원정보 수정' class="body_btn_css">
				<c:if test='${adminCheck == 0 || userDto2.userAdmin == 1}'>
					<input type="button" value="비밀번호 변경"
					onclick="pwUpdate();" class="body_btn_css">
				</c:if>
			<a onclick="popUp()">
				<input type="button" value="회원탈퇴" class="body_btn_css">
			</a>
		</div>
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
</div>

	<jsp:include page="../Tail.jsp" />
</body>
</html>