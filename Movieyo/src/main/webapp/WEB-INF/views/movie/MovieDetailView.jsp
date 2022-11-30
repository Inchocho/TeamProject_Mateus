<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>영화관리</title>

<style type="text/css">
img{
 width: 250px;
 height: 360px;

}

</style>

<script type="text/javascript">

</script>

</head>
	
<body>

	<jsp:include page="../Header.jsp" />
	<h1>영화관리</h1>
		<c:choose>
			<c:when test="${empty fileList}">
					첨부파일이 없습니다.<br>			
			</c:when>
		
			<c:otherwise>
				<c:forEach var="row" items="${fileList}">
<!-- 					<input type="button" value="이미지" name="file"> -->
<%-- 					${row.ORIGINAL_FILE_NAME}(${row.FILE_SIZE}kb)<br> --%>
					<img alt="image not found" src="<c:url value='/image/${row.STORED_FILE_NAME}'/>">
					<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	<form id="detailForm">
	<input type="hidden" name="userNo" value="${userDto.userNo}">
		영화번호: <input type="text" name="movieNo" value="${movieDto.movieNo}" readonly="readonly"><br>
	
		영화제목: <input type='text' name='movieTitle' 
			value='${movieDto.movieTitle}' readonly="readonly"><br>
<%-- 		제작연도: <input type="text" name='prdtYear' value="${movieDto.prdtYear}" readonly="readonly"> <br>  --%>
		
		제작연도 :	<fmt:formatDate pattern="yyyy" var="prdtYear"
								value="${movieDto.prdtYear}"/>
								${prdtYear}년<br>
		국가 :	<input type="text" name="nation" value="${movieDto.nation}" readonly="readonly"> <br>
		감독 :	<input type="text" name="director" value="${movieDto.director}" readonly="readonly"> <br>
		장르 :	<input type="text" name="genreName" value="${movieDto.genreName}" readonly="readonly"> <br>	
		상영시간 :	<input type="text" name="runtime" value="${movieDto.runtime}" readonly="readonly"> <br>	
		연령등급 :	<input type="text" name="grade" value="${movieDto.grade}" readonly="readonly"> <br>
		가격 :	<input type="text" name="price" value="${movieDto.price}" readonly="readonly"> <br>
		등록일 :	<fmt:formatDate pattern="yyyy-MM-dd"
								value="${movieDto.creDate}"/> <br>
		영화내용<br>
		<textarea name="movieStory" style="width: 800px; height: 400px;" readonly="readonly">${movieDto.movieStory}</textarea>
		<br>
		<input type="button" value='구매' onclick="buyMoviePopFnc();">
		<input type="button" value="장바구니" onclick="inCartMoviePopFnc();">
	</form>
<%-- 	<jsp:include page="/WEB-INF/views/PopUp/CartBuyPop.jsp"></jsp:include> --%>
<%-- 	<jsp:include page="/WEB-INF/views/PopUp/CartBuyPop.jsp"></jsp:include> --%>
	<jsp:include page="../Tail.jsp" />
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
function buyMovieFnc() {
	
}
function inCartMovieFnc() {
	
}
</script>
</html>