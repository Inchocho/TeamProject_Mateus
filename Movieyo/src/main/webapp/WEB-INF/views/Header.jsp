<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<c:if test="${userDto.userAdmin eq 1}">
<style type="text/css">
.header_container{
	position: relative;
	padding-bottom: 162px;
}
</style>
</c:if>
<c:if test="${userDto.userAdmin eq 0}">
<style type="text/css">
.header_container{
	position: relative;
	padding-bottom: 81px;
}
</style>
</c:if>
<style type="text/css">
body {
	margin: 0px;
}
.header_fix{
	position: fixed;
	width: -webkit-fill-available;;
	top: 0px;
	z-index: 30;
}
.headerDiv{
	background-color: #201919;
	height: 80px;
	border-bottom: 1px solid snow;
}
.ulFlexBox {
	display: flex;
	list-style: none;
	padding: 5px;
	align-items: center;
	min-width: 1000px;
	margin: 0px;
	background-color: inherit;
	height: 70px;
}
#adminHeaderUl{
	justify-content: flex-end;
}
#mainLogo{
	color: #ff81ab;
	font-weight: bold;
	font-style: oblique;
	width: 150px;
	margin: 0px;
	display: block;
    font-size: 45px;
	text-decoration: none;
}
.searchBox{
	margin: 0 auto 0 auto;
	min-width: 250px;
	display: flex;
}
.searchBox form{
	display: flex;
}
.searchBox input{
	height: 50px;
	border: 1px solid snow;
    color: #ff81ab;
    font-size: 16px;
}
.user_info_box{
	color: white;
    padding-right: 20px;
    min-width: 320px;
    align-items: center;
    display: flex;
    justify-content: flex-end;
}
.header_btn{
	height: 70px;
    background: inherit;
    color: snow;
    font-size: 20px;
    border: none;
}
.header_btn:hover {
	background-color: rgba(135, 206, 235, 0.3);
	cursor: pointer;
}
.body_btn_css{
	height: 50px;
    background: #201919;
    color: #ff81ab;
    font-size: 20px;
    border-radius: 8px;
    margin: 10px;
}
.body_btn_css:hover {
	background-color: rgba(135, 206, 235, 0.3);
	cursor: pointer;
}

.body_userDetail_btn_css{
    height: 35px;
    width: auto;
    background: #201919;
    color: #ff81ab;
    font-size: 20px;
    border-radius: 8px;
    margin: 0;
}
.body_userDetail_btn_css:hover {
	background-color: rgba(135, 206, 235, 0.3);
	cursor: pointer;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	function movieAdd() {
		location.href = '/Movieyo/movie/addMovie.do';
	}

	function movieList() {
		location.href = '/Movieyo/movie/list.do';
	}
	
	function myInfo() {
		location.href = '/Movieyo/user/one.do?userNo=' + ${userDto.userNo};
	}
	
	function refund(){
		location.href = '/Movieyo/refund/list.do?userNo=' + ${userDto.userNo};
	}
	
	function userList() {
		location.href = '/Movieyo/user/list.do';
	}
	function buyList() {
		location.href = '/Movieyo/buy/list.do';
	}
	
	function logout() {
		location.href = '/Movieyo/user/logout.do';
	}
	
	function movePageMainFnc() {
		location.href = '/Movieyo/movie/main.do';
	}
	function movePageAllFnc() {
		location.href = '/Movieyo/movie/AllList.do';
	}
	function moveBoardFnc() {
		location.href = '/Movieyo/board/boardList.do';
	}
	var htmlTag = document.getElementsByTagName("html").item(0);
	$(window).scroll(function() {
		$('.header_fix').css('left',0-$(this).scrollLeft());
	});
</script>
</head>
<div class="header_container">
<div class="header_fix">
<div class="headerDiv">
	<ul class="ulFlexBox">
		<li style="display: flex; align-items: center;">
			<a id="mainLogo" href="#" onclick="movePageMainFnc();">무비요</a>
			<input type="button" value="순위" onclick="movePageMainFnc();" class="header_btn">
			<input type="button" value="작품전체" onclick="movePageAllFnc();" class="header_btn">
<!-- 			<!-- 유저로그인시 --> -->
<%-- 			<c:if test="${userDto.userAdmin ne 1}"> --%>
<!-- 			<input type="button" value="추천작품" onclick="movePageMainFnc();" class="header_btn"> -->
<%-- 			</c:if> --%>
		</li>
		<li style="margin-left: 50px; "><input type="button" value="게시판" class="header_btn" onclick="moveBoardFnc();"></li>
		<li class="searchBox">
		<form action="/Movieyo/movie/search.do" method="post">
			<input type="submit" value="검색" class="header_btn">
			<input type="search" name="keyword" value="${searchMap.keyword}" placeholder="영화를 검색해보세요" style="color: black;">
			<input type="hidden" name="searchOption" value="MOVIE_TITLE">				
		</form>
		</li>
		<li class="user_info_box">
		<c:if test="${userDto.userAdmin eq 1}">${adminLabel}</c:if>${userDto.nickname} 님　
			<input type="button" value="내정보" onclick="myInfo();" class="header_btn">
			<input type="button" value="로그아웃" onclick="logout();" class="header_btn">
		</li>
	</ul>
</div>
<!-- 관리자로그인시 -->
<c:if test="${userDto.userAdmin eq 1}">
<div class="headerDiv">
	<ul class="ulFlexBox" id="adminHeaderUl">
		<li>
			<input type="button" value="영화등록" onclick="movieAdd();" class="header_btn">
		</li>
		<li>
			<input type="button" value="영화관리" onclick="movieList();" class="header_btn">
		</li>
		<li>
			<input type="button" value="회원관리" onclick="userList();" class="header_btn">
		</li>
		<li>
			<input type="button" value="환불관리" onclick="refund();" class="header_btn">
		</li>
		<li style="padding-right: 20px;">
			<input type="button" value="매출관리" onclick="buyList();" class="header_btn">
		</li>
	</ul>
</div>
</c:if>
</div>
</div>