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
	<h1>영화수정</h1>
	
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
	
	<form action='./updateCtr.do' method='post'>
		영화번호 : <input type="text" name="movieNo" value="${movieDto.movieNo}">
		영화제목: <input type='text' name='movieTitle' 
			value='${movieDto.movieTitle}'><br>
		제작연도: <input type="text" name='prdtYear' value="${movieDto.prdtYear}"> <br> 
		국가 :	<input type="text" name="nation" value="${movieDto.nation}"> <br>
		감독 :	<input type="text" name="director" value="${movieDto.director}"> <br>
		장르 :	<input type="text" name="genre" value="장르(아직없음)"> <br>	
		상영시간 :	<input type="text" name="runtime" value="${movieDto.runtime}"> <br>	
		연령등급 :	<input type="text" name="grade" value="${movieDto.grade}"> <br>
		가격 :	<input type="number" name="price" step="1000" value="${movieDto.price}"> <br>
		등록일 :	<input type="text" name="creDate" value="${movieDto.creDate}"> <br>
			
		영화내용 <br>
		<textarea style="width: 400px; height: 400px;">ㅂㅈㄷㅂㅈㄷㅂㅈㄷㅂㅈㄷㅂㅈㄷㅂㅈㄷㅂㅈㄷㅂㅈㄷㅂㅈㄷㅂㅈㄷㅂㅈㄷㅂㅈㄷㅂㅈㄷㅂㅈㄷ</textarea>
		<input type='submit' value='저장하기'>
		<input type="button" value="취소" onclick="">
	</form>
	
	<jsp:include page="../Tail.jsp" />
</body>
</html>