<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>영화관리</title>


<script type="text/javascript">
// 	function pwUpdate() {
// 		location.href="./passwordUpdate.do?userNo=" + ${userDto.userNo};
</script>

</head>
	
<body>

	<jsp:include page="../Header.jsp" />
	<h1>영화관리</h1>
	
	첨부파일:
		<c:choose>
			<c:when test="${empty fileList}">
					첨부파일이 없습니다.<br>			
			</c:when>
		
			<c:otherwise>
				<c:forEach var="row" items="${fileList}">
					<input type="button" value="이미지" name="file">
					${row.ORIGINAL_FILE_NAME}(${row.FILE_SIZE}kb)<br>
					<img alt="image not found" src="<c:url value='/img/${row.STORED_FILE_NAME}'/>">
					<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	<form action='./update.do' method='get'>
		영화제목: <input type='text' name='movieTitle' 
			value='${movieDto.movieTitle}' readonly="readonly"><br>
		제작연도: <input type="text" name='prdtYear' value="${movieDto.prdtYear}"> <br> 
		국가 :	<input type="text" name="nation" value="${movieDto.nation}"> <br>
		감독 :	<input type="text" name="director" value="${movieDto.director}"> <br>
		장르 :	<input type="text" name="genre" value="장르(아직없음)"> <br>	
		상영시간 :	<input type="text" name="runtime" value="${movieDto.runtime}"> <br>	
		연령등급 :	<input type="text" name="grade" value="${movieDto.grade}"> <br>
		가격 :	<input type="text" name="price" value="${movieDto.price}"> <br>
		등록일 :	<input type="text" name="creDate" value="${movieDto.creDate}"> <br>
			
		<input type='submit' value='수정'>
		<input type="button" value="목록" onclick="">
		<input type="button" value="삭제" onclick="">					
	</form>
	
	영화내용
	<div style="border: 1px solid black; width: 400px;">
		라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라
		라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라
		라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라라
	</div>
	<jsp:include page="../Tail.jsp" />
</body>
</html>