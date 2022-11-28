<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function buyAdd() {
		location.href = '../buy/addBuy.do'
	}
</script>
<title>구매내역</title>
</head>
<body>
	<jsp:include page="../Header.jsp"/>
	<jsp:include page="../UserMyPageSideMenu.jsp"></jsp:include>

	<table>
		<tr>
			<th>영화제목</th><th>가격</th><th>구매일</th><th>상태</th><th>환불상태</th>
		</tr>
		

	<c:forEach var="buyMap" items="${buyListMap}"> 
		<tr>			
			<td>
				${buyMap.movieTitle}
			</td>
			<td>
				${buyMap.moviePrice}				
			</td>			
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd"
				value = "${buyMap.buyDate}"/>
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
	</c:forEach>
	
		
	</table>
	
	<!-- jsp:include는 forward처럼 데이터를 유지시킨다 -->
	<jsp:include page="/WEB-INF/views/common/Paging.jsp"/>
	
	<form action="./list.do" id="pagingForm" method="post">
		<input type="hidden" id="curPage" name="curPage"
			value="${pagingMap.moviePaging.curPage}">	
	    <input type="hidden"  name="userNo" value="${userDto.userNo}">			
		<input type="hidden"  name="keyword" value="${searchMap.keyword}">
		<input type="hidden"  name="searchOption" value="${searchMap.searchOption}">
	</form>		
	
	<form action="./list.do" method="post">
		<select name="searchOption">
			<c:choose>
				<c:when test="${searchMap.searchOption == 'all'}">
					<option value="all"<c:if test="${searchMap.searchOption eq 'all'}">selected</c:if>>전체</option>
					<option value="MOVIE_TITLE">영화제목</option>
					<option value="BUY_STATUS">환불상태</option>					
				</c:when>
				<c:when test="${searchMap.searchOption == 'MOVIE_TITLE'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE"<c:if test="${searchMap.searchOption eq 'MOVIE_TITLE'}">selected</c:if>>영화제목</option>
					<option value="BUY_STATUS">환불상태</option>					
				</c:when>				
				<c:when test="${searchMap.searchOption == 'BUY_STATUS'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE">영화제목</option>					
					<option value="BUY_STATUS"<c:if test="${searchMap.searchOption eq 'BUY_STATUS'}">selected</c:if>>환불상태</option>
				</c:when>				
			</c:choose>
		</select>
		<input type='hidden' name='userNo' value="${userDto.userNo}">	
		
		<input type="text" name="keyword" value="${searchMap.keyword}" placeholder="검색">
		<input type="submit" value="검색">			
		<button type="button" onclick="buyAdd();">구매내역등록</button>
	</form>	

</body>
</html>