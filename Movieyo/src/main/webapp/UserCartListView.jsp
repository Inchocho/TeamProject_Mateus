<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Moviyo</title>

<style type="text/css">
	table, tr, td, th{
		border:1px solid black; 
	}
	
	table {
		border-collapse: collapse;
	}
	#tdId{
	width: 500px;
	height: 500px;
	text-align: center;
	font-weight: bolder;
	}
	
	#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
.curPageDiv{
	margin-left: 200px;
}
.titleContainer{
	border-bottom: 2px solid #252525;
	margin: 3px 3px 3px 0px;
}
.titleContainer h1{
	margin-left: 30px;
}
.contContainer{
    width: 600px;
    margin: 10px 0 0 30px;
}
.contContainer table{
	width: 600px;
}
  
#ul li {
  list-style-type: none;
  float: left;
  margin-left: 10px;
  }
 
th {
	background-color: gray;
} 
.cartSelectInfo, .csiCkBox, .csiCkBoxView{
	display: flex;
}
.cartSelectInfo{
	flex-direction: column;
	align-items: center;
}
.csiCkBox{
	align-items: center;
}
.csiCkBoxView{
	flex-direction: column;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>

<script type="text/javascript">
	function pageMoveMovieDetailFnc() {
		var movieDatailCurPageObj = document.getElementById("movieDatailCurPage");
		
		movieDatailCurPageObj.value = document.getElementById("curPage").value;
		
		var movieDetailFormObj = document.getElementById("movieDetailForm");
		
		movieDetailFormObj.submit();
		
	}
	
	function movieAdd() {
		location.href = '../movie/addMovie.do'
	}
</script>
</head>

<body>
	<header>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	</header>
	<jsp:include page="/WEB-INF/views/UserMyPageSideMenu.jsp"></jsp:include>
	<div class="curPageDiv">
	
	<div class="titleContainer">
		<h1>장바구니</h1>
	</div>
		
	<form action="buyCartSelect.do">
		<!-- contContainer 다넣기? -->
	</form>
	<div class="contContainer">
	<table>
		<tr>
			<th>영화제목</th><th>가격</th><th>담은날짜</th><th>선택</th>
		</tr>
		<c:if test="true">
		<c:forEach var="userCartDto" items="${cartList}">
		</c:forEach>
		<tr>
			<td>${cartDto.movieTitle}1</td>
			<td>${cartDto.moviePrice}1</td>
			<td>${cartDto.inCartDate}1</td>
			<td><input type="checkbox"></td>
		</tr>
			
		</c:if>
		<c:if test="${empty cartList}">
			<tr>
				<td colspan="4" id="tdId">장바구니가 비었습니다</td>
			</tr>		
		</c:if>
	</table>
	<div style="display: flex; flex-direction: row-reverse;"><div class="cartSelectInfo">
		<div class="csiCkBox">
			<div class="csiCkBoxView"><span>선택한항목</span><span>가격합계</span></div><div>전체선택체크박스</div>
		</div>
		<div>구매버튼</div>
	</div></div>
	<!-- jsp:include는 forward처럼 데이터를 유지시킨다 -->
	<jsp:include page="/WEB-INF/views/common/Paging.jsp"/>
	
	<form action="./list.do" id="pagingForm" method="post">
		<input type="hidden" id="curPage" name="curPage"
			value="${pagingMap.moviePaging.curPage}">	
		<input type="hidden"  name="keyword" value="${searchMap.keyword}">
		<input type="hidden"  name="searchOption" value="${searchMap.searchOption}">
	</form>
	
	<form action="./list.do" method="post">
		<select name="searchOption">
			<c:choose>
				<c:when test="true">
					<option value="all"<c:if test="${searchMap.searchOption eq 'all'}">selected</c:if>>감독+제목</option>
					<option value="MOVIE_DIRECTOR">감독</option>
					<option value="MOVIE_TITLE">제목</option>					
				</c:when>
				<c:when test="${searchMap.searchOption == 'all'}">
					<option value="all"<c:if test="${searchMap.searchOption eq 'all'}">selected</c:if>>감독+제목</option>
					<option value="MOVIE_DIRECTOR">감독</option>
					<option value="MOVIE_TITLE">제목</option>					
				</c:when>
				<c:when test="${searchMap.searchOption == 'MOVIE_DIRECTOR'}">
					<option value="all">감독+제목</option>
					<option value="MOVIE_DIRECTOR"<c:if test="${searchMap.searchOption eq 'MOVIE_DIRECTOR'}">selected</c:if>>감독</option>
					<option value="MOVIE_TITLE">제목</option>					
				</c:when>				
				<c:when test="${searchMap.searchOption == 'MOVIE_TITLE'}">
					<option value="all">감독+제목</option>
					<option value="MOVIE_DIRECTOR">감독</option>
					<option value="MOVIE_TITLE"<c:if test="${searchMap.searchOption eq 'MOVIE_TITLE'}">selected</c:if>>제목</option>
				</c:when>				
			</c:choose>
		</select>
		
		<input type="text" name="keyword" value="${searchMap.keyword}" placeholder="검색">
		<input type="submit" value="검색">
	</form>
		
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
	
</body>

</html>