<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	 		<li><a href="/Movieyo/user/userMpoint.do" class="menulist">Mpay</a></li>
	 		<li><a href="/Movieyo/cart/list.do" class="menulist">장바구니</a></li>
	 		<li><a href="/Movieyo/buy/list.do?userNo=${userDto.userNo}" class="menulist">구매내역</a></li>
	 		<li><a href="/Movieyo/refund/list.do?userNo=${userDto.userNo}" class="menulist">환불내역</a></li>
	 		<li><a href="#" class="menulist">내가평가한 영화</a></li>
	 	</ul>
	   </div>
	</div>
</body>
</html>