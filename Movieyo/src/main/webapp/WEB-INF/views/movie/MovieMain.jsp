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
	img{
	width: 200px;
	height: 350px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	
	<h1>내가 메인이다</h1>
	
			
	<c:forEach var="row" items="${fileList}" varStatus="status">
		<img alt="image not found" src="<c:url value='/image/${row.get(0).STORED_FILE_NAME}'/>">
					
		<c:set var="movieDto" value="${movieList[status.index]}"/>
			${movieDto.movieTitle}
			${movieDto.genreName}
	
	</c:forEach>
	
	<jsp:include page="../Tail.jsp" />
	
</body>
</html>