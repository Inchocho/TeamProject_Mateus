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
	<jsp:include page="../Header.jsp"/>
	<jsp:include page="../UserMyPageSideMenu.jsp"></jsp:include>

	<table>
		<tr>
			<th>영화제목</th><th>가격</th><th>구매일</th><th>신청일</th><th>상태</th>
		</tr>
		

	<c:forEach var="refundMap" items="${refundListMap}"> 
		<tr>			
			<td>${refundMap.movieTitle}</td>
			<td>
				${refundMap.moviePrice}
			</td>
			
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd hh:mm" 
					value = "${refundMap.buyDate}" />
			</td>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd hh:mm" 
				value="${refundMap.refundDate}"/>
			</td>
			<td>
				${refundMap.refundStatus}
			</td>			
		</tr>
	</c:forEach>
	
		
	</table>

</body>
</html>