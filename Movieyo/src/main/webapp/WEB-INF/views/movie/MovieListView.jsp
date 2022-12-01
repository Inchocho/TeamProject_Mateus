<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>영화목록</title>

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

/* header { */
/*   position: fixed; */
/*   top: 0; */
/*   left: 0; */
/*   right: 0; */
/*   } */
  
#ul li {
  list-style-type: none;
  float: left;
  margin-left: 10px;
  }
 
th {
	background-color: gray;
} 

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
	<h1 style="height: 50px; padding-top: 50px; border: 1px solid gray;">영화관리</h1>
	
	<table>
		<tr>
			<th>번호</th><th>영화제목</th><th>장르</th><th>감독</th><th>작성자</th><th>등록일</th>
		</tr>
		<c:if test="${not empty movieList}">
		<c:forEach var="movieDto" items="${movieList}" varStatus="status">
		<tr>
			<td>${movieDto.movieNo}</td>
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
		
	
	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
	
</body>

</html>