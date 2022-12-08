<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>

<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>

<script type="text/javascript">
	
	function pageMoveBeforeFnc(userNo){
		location.href = 'one.do?userNo=' + userNo;
	}
	
</script>

<style type="text/css">
.titleContainer{
	border-bottom: 2px solid #252525;
	margin: 3px 3px 3px 0px;
	padding-right: 600px;
}

.curPageDiv {
	margin: 0px;
	text-align: center;
	min-width: 892px;
}

.contContainer {
	width: 600px;
	padding: 10px 0 0 30px;
	margin: auto;
}
.detailFormDiv {
	border: 1px solid black;
}

.detailFormDiv, .detailForm_top, .detailForm_bottom {
	display: flex;
	text-align: left;
}

.input{
	width: 280px;
	height: 30px;
	position: relative;
	border: solid 1px #bfbfbf;
	border-radius: 4px;
	background: #fff;
}
.userInfo {
	display: flex;
	align-items: center;
	height: 45px;
	border-bottom: 1px dashed #d1d1d1;
	margin: 2px 0px;
}

.p {
	width: 100px;
	height: 30px;
	margin: 0px 30px 0px 0px;
	font-size: 20px;
	margin-block: initial;
	height: 30px;
}
.btn_area {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
}


</style>
</head>
	
<body>

	<jsp:include page="../Header.jsp" />
	<jsp:include page="../UserMyPageSideMenu.jsp"></jsp:include>
	<div class="curPageDiv">
		<div class="titleContainer">
		<h1>회원정보 수정</h1>
		</div>
		
		<div class="contContainer">
			<form action='./updateCtr.do' method='post' enctype="multipart/form-data">
				<div class="detailFormDiv">
				<input type='hidden' name='adminCheck' value='${adminCheck}'>
				<input type="hidden" name='userNo' value='${userDto2.userNo}'>
				<input type="hidden" name="likeGenre" value="${likeGenre}">
				<div style="width: 750px; padding-left: 10px;">
				<div class="userInfo">
					<p class="p">이름</p>
					<input type='text' name='userName' readonly="readonly" class="input" value='${userDto2.userName}'><br>
				</div>
				
				<div class="userInfo">
					<p class="p">가입일</p>
				<input type="text" name='userCreateDate' readonly="readonly" class="input" value='<fmt:formatDate value="${userDto2.userCreateDate}" 
					pattern="yyyy-MM-dd hh:mm"/>'>
				</div>
				
				<div class="userInfo">
					<p class="p">생년월일</p>
				<input type="text" name='userBirth' readonly="readonly" class="input" value='<fmt:formatDate value="${userDto2.userBirth}" 
					pattern="yyyy-MM-dd"/>'>
				</div>
					
				<div class="userInfo">
					<p class="p">닉네임</p>
					<input type="text" name="nickname" class="input" value="${userDto2.nickname}"><br>
				</div>
				<!-- 체크방식으로 들어오던 성별 text타입으로 뿌려줌(수정이 막힘?) -->		
				<div class="userInfo">
					<p class="p">성별</p>
					<input type="text" name="gender" class="input" value="${userDto2.gender}"
				 	readonly="readonly">
				
		<%-- 		<c:if test="${userDto2.gender =='남'}"> --%>
		<!-- 			<input type="checkbox" name="gender" value="남" onclick="return false;" checked="checked">남 -->
		<!-- 			<input type="checkbox" name="gender" value="여" onclick="return false;">여 <br> -->
		<%-- 		</c:if> --%>
				
		<%-- 		<c:if test="${userDto2.gender == '여'}"> --%>
		<!-- 			<input type="checkbox" name="gender" value="남" onclick="return false;">남 -->
		<!-- 			<input type="checkbox" name="gender" value="여" onclick="return false;" checked="checked">여 <br> -->
		<%-- 		</c:if> --%>
		
		      		<c:if test="${userDto.userAdmin == 1}">
		   				<input type="hidden" value="${userDto2.userAdmin}" name='userAdmin'>
		   			</c:if>
		   			<br>
		   			</div>
		      	</div>
				</div>
				
				<div class="btn_area">
					<input type='submit' value='저장하기' class="body_btn_css">
				
					<input type='button' value='돌아가기' class="body_btn_css"
						onclick='pageMoveBeforeFnc(${userDto2.userNo});'>	
				</div>
			</form>
		</div>
<%-- 	<jsp:include page="../Tail.jsp" /> --%>
	</div>
</body>
</html>