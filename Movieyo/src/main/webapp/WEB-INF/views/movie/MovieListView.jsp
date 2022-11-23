<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	   <table>
	      <tr>
	         <th>번호</th><th>영화제목</th><th>장르</th><th>감독</th><th>작성자</th><th>등록일</th>
	      </tr>
	      <c:forEach var="movieDto" items="${movieList}">
	      <tr>
	         <td>${movieDto.movieNo}</td>
	         <td>
	         	<form id='movieDetailForm' action="./one.do" method="get">
					<a href='#' onclick="pageMoveDetailFnc();">
						${movieDto.movieTitle}
					</a>
				<input type="hidden" name="movieNo" value="${movieDto.movieNo}">
				</form>
	         </td>
	         <td>
	         	${movieDto.movieTitle}
	         </td>
	         <td>
	         	${movieDto.genre}
	         </td>
	         <td>
	         	${movieDto.email}
	         </td>
	         <td>
	         	${movieDto.email}
	         </td>
	         <td>
	         	${movieDto.email}
	         </td>	         	         	         	         
	 
	         <td>
	            <a href='./deleteCtr.do?no=${memberDto.no}'>[삭제]</a>   
	         </td>
	      </tr>
	      </c:forEach>
	   </table> 
</body>
</html>