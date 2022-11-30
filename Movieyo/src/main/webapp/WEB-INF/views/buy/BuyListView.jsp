<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>
</head>
<body>
	<jsp:include page="../Header.jsp"/>
	<jsp:include page="../UserMyPageSideMenu.jsp"></jsp:include>

	<table>
		<tr>
			<th>영화제목</th><th>가격</th><th>구매일</th><th>상태</th>
			<c:if test='${userDto.userAdmin == 1}'>
				<th>구매자</th>
				<th>회원번호</th>	
				<th>구매번호</th>			
			</c:if>			
			<th>환불</th>
		</tr>
		

	<c:forEach var="buyMap" items="${buyListMap}" varStatus="status">		
		<tr>			
			<td>
				${buyMap.movieTitle}
			</td>
			<td>
				${buyMap.moviePrice}원				
			</td>			
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd"
				value = "${buyMap.buyDate}"/>
			</td>
			<td id='status'>
				${buyMap.buyStatus}
			</td>			
			<c:if test='${userDto.userAdmin == 1}'>
				<td>${buyMap.userNickName}</td>
				<td>${buyMap.buyUserNo}</td>
				<td>${buyMap.buyNo}</td>
			</c:if>	
			<td>
			<form id="refundAddFrom" action="../refund/addRefund.do" method="GET">					
				<input type="submit" name='refundSubmitBtn' id='refundSubmit' value="환불하기">					
				<input type="hidden" name="buyNo" value="${buyMap.buyNo}">
				<input type='hidden' name='userNo' value="${buyMap.buyUserNo}">
				<input type="hidden" id="buyCurPage" name="curPage" value="">
				<input type="hidden" name="keyword" value="${searchMap.keyword}">
				<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
			</form>						
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
					<option value="USER_NICKNAME">구매자</option>					
				</c:when>
				<c:when test="${searchMap.searchOption == 'MOVIE_TITLE'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE"<c:if test="${searchMap.searchOption eq 'MOVIE_TITLE'}">selected</c:if>>영화제목</option>
					<option value="BUY_STATUS">환불상태</option>		
					<option value="USER_NICKNAME">구매자</option>								
				</c:when>				
				<c:when test="${searchMap.searchOption == 'BUY_STATUS'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE">영화제목</option>					
					<option value="BUY_STATUS"<c:if test="${searchMap.searchOption eq 'BUY_STATUS'}">selected</c:if>>환불상태</option>
					<option value="USER_NICKNAME">구매자</option>
				</c:when>
				<c:when test="${searchMap.searchOption == 'USER_NICKNAME'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE">영화제목</option>
					<option value="BUY_STATUS">환불상태</option>					
					<option value="USER_NICKNAME"<c:if test="${searchMap.searchOption eq 'USER_NICKNAME'}">selected</c:if>>구매자</option>
				</c:when>	
			</c:choose>
		</select>
		<input type='hidden' name='userNo' value="${userDto.userNo}">	
		
		<input type="text" name="keyword" value="${searchMap.keyword}" placeholder="검색">
		<input type="submit" value="검색">			
	</form>	
	
	<input type="button" name="abcd" id="abcd" value="제이쿼리">

</body>
<script type="text/javascript">

</script>
</html>