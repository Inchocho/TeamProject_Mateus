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
	width: 250px;
	height: 370px;
}

html:lang(ko) {
    font-family: RobotoInCjk, "Noto Sans KR", "Apple SD Gothic Neo", "Nanum Gothic", "Malgun Gothic", sans-serif;
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

	<h1>내가 메인이다</h1>
<div style="width:100%">
	<div style="width: 1500px; margin-left: 270px;">
	<div style="display: flex; flex-wrap: wrap;">
		<c:forEach var="row" items="${fileList}" varStatus="status">
			<c:set var="movieDto" value="${movieList[status.index]}" />
			<div style="margin: 10px;" onclick="movePageMovieDtail(${movieDto.movieNo});">
				<div>
					<img alt="image not found"
						src="<c:url value='/image/${row.get(0).STORED_FILE_NAME}'/>">
				</div>
				<div>
					 <a class="title">${movieDto.movieTitle}</a><br>
					 <a class="info"><fmt:formatDate pattern="yyyy"
								value="${movieDto.prdtYear}"/> ・ ${movieDto.nation}</a><br>
					 <a class="info">${movieDto.genreName}</a>
				</div>
			</div>
		</c:forEach>
	</div>
</div>	
</div>
	<jsp:include page="../Tail.jsp" />

</body>
</html>