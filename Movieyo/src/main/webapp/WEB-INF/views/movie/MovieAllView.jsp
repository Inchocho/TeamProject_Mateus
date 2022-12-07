<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>무비요</title>
<style>
img {
	width: 170px;
    height: 250px;
}

html:lang(ko) {
    font-family: RobotoInCjk, "Noto Sans KR", "Apple SD Gothic Neo", "Nanum Gothic", "Malgun Gothic", sans-serif;
}

.titleContainer{
	width: 1330px;
    margin: 0px auto;
}
.contContainer{
	width: 1330px;
    margin: 0px auto;
}
.con_curList{
    margin: 0px;
}
.con_movieList{
    list-style: none;
	display: flex;
    flex-wrap: wrap;
    margin: 0px;
    padding: 0px;
}
.con_movie{
	margin: 10px;
}
.con_movie:hover{
	opacity: 0.3;
	cursor: pointer;
}
.title{
font-size: 16px;
font-weight: 800;
color: #292a32;
}
.info{
color: #292a32;
font-size: 14px;
font-weight: 400;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	function movePageMovieDtail(movieNo) {
		var url = "./detail.do?movieNo=" + movieNo;
		location.href = url;
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp" />

<div style="width:100%" class="curPageDiv">
<div class="movie_list_container">
	<div class="titleContainer">
		<h1>전체영화목록</h1>
	</div>
	<div class="contContainer">
		<div class="con_curList">
			<ul class="con_movieList" id="con_movieList_1">
			<c:forEach var="fileList" items="${fileList}" varStatus="status">
			<c:set var="movieDto" value="${movieList[status.index]}" />
				<li class="con_movie" onclick="movePageMovieDtail(${movieDto.movieNo});">
					<div>
						<img alt="image not found"
							src="<c:url value='/image/${fileList.STORED_FILE_NAME}'/>">
					</div>
					<div>
						 <a class="title">${movieDto.movieTitle}</a><br>
						 <a class="info"><fmt:formatDate pattern="yyyy"
									value="${movieDto.prdtYear}"/> ・ ${movieDto.nation}</a><br>
						 <a class="info">${movieDto.genreName}</a>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
</div>

</div>
	<jsp:include page="../Tail.jsp" />

</body>
</html>