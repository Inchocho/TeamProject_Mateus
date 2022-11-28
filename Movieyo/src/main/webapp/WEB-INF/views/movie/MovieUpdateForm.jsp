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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
// 	function pwUpdate() {
// 		location.href="./passwordUpdate.do?userNo=" + ${userDto.userNo};

	$(function () {
		$("#genreNo").val("${movieDto.genreNo}");
		
	});
	
	$(function (){
		$("#genreNo").click(function () {
			var optionVal = $("#genreNo option:checked").text();
			$("#genreName").val(optionVal);
		});
	});
</script>

</head>
	
<body>

	<jsp:include page="../Header.jsp" />
	<h1>영화수정</h1>
	
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
		<input type="hidden" name="movieNo" value="${movieDto.movieNo}"><br>
		영화제목: <input type='text' name='movieTitle' 
			value='${movieDto.movieTitle}'><br>
		제작연도 :<input type="text" value="<fmt:formatDate pattern="yyyy"
								value="${movieDto.prdtYear}"/>" name="prdtYear"><br>
		국가 :	<input type="text" name="nation" value="${movieDto.nation}"> <br>
		감독 :	<input type="text" name="director" value="${movieDto.director}"> <br>
		장르 :	
<!-- 		<input type="text" name="genre" value="장르(아직없음)"> <br> -->
		<select name="genreNo" id="genreNo">
		  <option value="1">애니메이션</option>
	      <option value="2">드라마</option>
	      <option value="3">코미디</option>
	      <option value="4">다큐멘터리</option>
	      <option value="5">범죄</option>
	      <option value="6">성인물(에로)</option>
	      <option value="7">SF</option>
	      <option value="8">멜로/로맨스</option>
	      <option value="9">어드벤처</option>
	      <option value="10">공포(호러)</option>
	      <option value="11">스릴러</option>
	      <option value="12">기타</option>
	    </select> <br>
	    장르명 : <input type="text" name="genreName" value="${movieDto.genreName}" id="genreName"><br>
		상영시간 :	<input type="text" name="runtime" value="${movieDto.runtime}"> <br>	
		연령등급 :	<input type="text" name="grade" value="${movieDto.grade}"> <br>
		가격 :	<input type="number" name="price" step="1000" value="${movieDto.price}"> <br>
		등록일 :	<fmt:formatDate pattern="yyyy-MM-dd"
								value="${movieDto.creDate}"/> <br>
			
		영화내용 <br>
		<textarea name="movieStory" style="width: 800px; height: 400px;">${movieDto.movieStory}</textarea>
		<input type='submit' value='저장하기'>
		<input type="button" value="취소" onclick="">
	</form>
	
	<jsp:include page="../Tail.jsp" />
</body>
</html>