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
<title>환불목록</title>
</head>
<body>

	<table>
		<tr>
			<th>영화제목</th><th>가격</th><th>구매일</th><th>신청일</th><th>상태</th>
		</tr>
		

	<c:forEach var="refundDto" items="${refundList}"> 
		<tr>			
			<td>${refundDto.movieTitle}</td>
			<td>
				${refundDto.moviePrice}
			</td>
			
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd hh:mm" 
					value = "${refundDto.buyDate}" />
			</td>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd hh:mm" 
				value="${refundDto.refundDate}"/>
			</td>
			<td>
				${refundDto.refundStatus}
			</td>			
		</tr>
	</c:forEach>
	
		
	</table>

</body>
</html>