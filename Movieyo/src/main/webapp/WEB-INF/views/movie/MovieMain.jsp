<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비요</title>
<style>
img {
	width: 200px;
	height: 350px;
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


	<div style="display: flex;">
		<c:forEach var="row" items="${fileList}" varStatus="status">
			<c:set var="movieDto" value="${movieList[status.index]}" />
			<div style="margin: 10px;" onclick="movePageMovieDtail(${movieDto.movieNo});">
				<div>
					<img alt="image not found"
						src="<c:url value='/image/${row.get(0).STORED_FILE_NAME}'/>">
				</div>
				<div>
					${movieDto.movieTitle}<br> ${movieDto.genreName}
				</div>
			</div>
		</c:forEach>
	</div>
	<jsp:include page="../Tail.jsp" />

</body>
</html>