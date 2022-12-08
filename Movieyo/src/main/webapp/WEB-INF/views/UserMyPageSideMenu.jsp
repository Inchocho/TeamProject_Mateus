<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.userMenuDiv{
	float: left;
	height: 1000px;
	width: 200px;
	text-align: center;
	background-color: gray;
}
.userMenuContainer{
	text-align: left;
	margin: 10px;
	background-color: white;
}
.userMenuFlexBox{
	display: flex;
	list-style: none;
	padding: 5px;
	margin: 0px;
	flex-direction: column;
	line-height: 40px;
}
.menulist{
	color: black;
	text-decoration: none;
}
.menulist:hover {
	background-color: skyblue;
}

</style>
</head>
<body>
	<!-- 크기,위치 잡을 div -->
	<div class="userMenuDiv">
	   <!-- 메뉴들어갈 div -->
	   <div class="userMenuContainer">
	 	<ul class="userMenuFlexBox">
	 		<li><a href="/Movieyo/user/one.do?userNo=${userDto.userNo}" class="menulist">내정보</a></li>
	 		<c:if test="${userDto.userAdmin eq 0}">
	 		<li><a href="/Movieyo/user/userMpoint.do" class="menulist">Mpay</a></li>
	 		<li><a href="/Movieyo/cart/list.do" class="menulist">장바구니</a></li>
	 		<li><a href="/Movieyo/buy/list.do?userNo=${userDto.userNo}" class="menulist">구매내역</a></li>
	 		<li><a href="/Movieyo/refund/list.do?userNo=${userDto.userNo}" class="menulist">환불내역</a></li>
	 		</c:if>
	 		<c:if test="${userDto.userAdmin eq 1}">
	 		<li><a href="/Movieyo/movie/addMovie.do" class="menulist"></a></li>
	 		<li><a href="/Movieyo/movie/list.do" class="menulist">영화관리</a></li>
	 		<li><a href="/Movieyo/user/list.do" class="menulist">회원관리</a></li>
	 		<li><a href="/Movieyo/refund/list.do?userNo=${userDto.userNo}" class="menulist">환불관리</a></li>
	 		<li><a href="/Movieyo/buy/list.do?userNo=${userDto.userNo}" class="menulist">매출관리</a></li>
	 		</c:if>
	 	</ul>
	   </div>
	</div>
</body>
</html>