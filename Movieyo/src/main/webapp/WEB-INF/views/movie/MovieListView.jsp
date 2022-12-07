<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>영화목록관리</title>

<style type="text/css">
table,tr, td, th{
		border: 1px solid black;
}
td{
	height: 50px;
}
table {
		border-collapse: collapse;
}
.curPageDiv{
	margin: 0px 0px 0px 200px;
	text-align: center;
	min-width: 600px;
}
.titleContainer{
	border-bottom: 2px solid #252525;
	margin: 3px 3px 3px 0px;
}

.contContainer{
    width: 800px;
    padding: 10px 0 0 30px;
    margin: auto;
    font-size: 20px;
}
.contContainer table{
	width: 800px;
	text-align: center;
}
  
#ul li {
  list-style-type: none;
  float: left;
  margin-left: 10px;
  }
 
th {
	background-color: gray;
}
.buy_btn_css{
	height: 30px;
	font-size: 15px;
    background: #201919;
    color: #ff81ab;
    border-radius: 8px;
    margin: 10px;
}
.buy_btn_css:hover {
	background-color: rgba(135, 206, 235, 0.3);
	cursor: pointer;
}
.title_con{
	width: 800px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: auto;
}
.title_con_sales{
	font-size: 18px;
	align-self: flex-end;
}
.title_con_sales span span{
	font-weight: bold;
}
.salesView{
	border-right: 2px dotted;
    padding-right: 10px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

function pageMoveMovieDetailFnc(index) {
	var movieDatailCurPageObj = document.getElementById("movieDatailCurPage");
	
	movieDatailCurPageObj.value = document.getElementById("curPage").value;
	
	var formId = "movieDetailForm" + index;
	
	var movieDetailFormObj = document.getElementById(formId);
	
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
		
	<!-- 관리자의 경우 수입 총액을 보여줌 -->

	<div class="curPageDiv">
	
	<div class="titleContainer">
		<div class="title_con">
			<div class="title_con_title">
				<h1>관리자 영화목록 관리</h1>
			</div>
		</div>
	</div>
		
	<div class="contContainer">
		<input type="hidden" value="${userDto.userNo}">
	<table>
		<tr>
			<th>영화번호</th>
			<th>영화제목</th>
			<th>영화장르</th>
			<th>영화감독</th>
			<th>등록자</th>
			<th>등록일</th>	
		</tr>	
		
		<c:if test="${not empty movieList}">
		
		<c:forEach var="movieDto" items="${movieList}" varStatus="status">
		<tr>
			<td>
				${movieDto.movieNo}
			</td>
			<td>
				<form id="movieDetailForm${status.index}" action="./one.do" method="get">					
					<a href="#" onclick="pageMoveMovieDetailFnc(${status.index});">
						${movieDto.movieTitle}
					</a>
					<input type="hidden" name="movieNo" value="${movieDto.movieNo}">
					<input type="hidden" id="movieDatailCurPage" name="curPage" value="">
					<input type="hidden" name="keyword" value="${searchMap.keyword}">
					<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
				</form>
			</td>			
			<td>${movieDto.genreName}</td>
			<td>
				${movieDto.director}
			</td>
			<td>
				${movieDto.registrant}
			</td>
			
			<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${movieDto.creDate}" /></td>
		</tr>
		</c:forEach>
	
		</c:if>
		
		<c:if test="${empty movieList}">
			<tr>
				<td colspan="6" id="tdId">영화가 존재하지 않습니다</td>
			</tr>		
		</c:if>
	</table>

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
		<button type="button" onclick="movieAdd();">영화등록</button>
	</form>
		
	</div>
	</div>
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
	
</body>
</html>