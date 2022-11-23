<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">

</script>
<title>구매내역</title>
</head>
<body>

	<table>
		<tr>
			<th>영화제목</th><th>가격</th><th>구매일</th><th>상태</th><th>환불상태</th>
		</tr>
		

<%-- 	<c:forEach var="i" items="${buyMap}">  --%>
		<tr>			
			<td>
				${buyMap.movieTitle}
			</td>
			<td>
				${buyMap.price}				
			</td>			
			<td>
				${buyMap.buyDate}
			</td>
			<td>
				${buyMap.buyStatus}
			</td>		
			<td>
				<c:choose>
					<c:when test="#">
						<input type='button' value='신청'>
					</c:when>
					<c:otherwise>
						불가
					</c:otherwise>				
				</c:choose>
			</td>			
		</tr>
<%-- 	</c:forEach> --%>
	
		
	</table>

</body>
</html>