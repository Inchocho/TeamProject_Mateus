<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

function admitRefund(index) {
		
		var refundCurPageObj = document.getElementById("refundCurPage");
		
		refundCurPageObj.value = document.getElementById("curPage").value;

		var str = "refundAdmit" + index;
		
		var refundAddFormObj = document.getElementById(str);
		
		refundAddFormObj.submit();		
	
}	
</script>
<title>환불목록</title>
</head>
<body>
	<jsp:include page="../Header.jsp"/>
	<jsp:include page="../UserMyPageSideMenu.jsp"></jsp:include>

	<table>
		<tr>
			<th>영화제목</th>
			<th>가격</th>
			<th>구매일</th>
			<th>신청일</th>
			<th>상태</th>
			<c:if test="${userDto.userAdmin == 1}">	<!-- 관리자가 유저환불내역을 허가함 -->
			<th>유저번호</th>	
			<th>환불허가</th>
			</c:if>
		</tr>
		

	<c:forEach var="refundMap" items="${refundListMap}" varStatus="status"> 
		<tr>			
			<td>${refundMap.movieTitle}</td>
			<td>
				${refundMap.moviePrice}
			</td>
			
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd" 
					value = "${refundMap.buyDate}" />
			</td>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd" 
				value="${refundMap.refundDate}"/>
			</td>
			<td>
				${refundMap.refundStatus}
			</td>
			<c:if test="${userDto.userAdmin == 1}">	<!-- 관리자가 유저환불내역을 허가함 -->
			<td>
				${refundMap.refundUserNo}
			</td>						
				<td>			
				<form id="refundAdmit${status.index}" action="../refund/updateRefund.do" method="POST">	
					<c:choose>
						<c:when test="${refundChk ==  0}">				
							<a href="#" onclick="admitRefund(${status.index});">					
								<input id='rBtnYes' type='button' value='수락'>					
							</a>
						</c:when>
						<c:otherwise>
							<input type="text" value="환불완료됨" readonly="readonly">
						</c:otherwise>
					</c:choose>
					<input type="hidden" name="refundNo" value="${refundMap.refundNo}">
					<input type="hidden" name="buyNo" value="${refundMap.buyNo}">
					<input type='hidden' name='movieNo' value="${refundMap.movieNo}">
					<input type='hidden' name='userNo' value="${refundMap.refundUserNo}">
					<input type="hidden" name="moviePrice" value="${refundMap.moviePrice}">
					<input type="hidden" id="refundCurPage" name="curPage" value="">
					<input type="hidden" name="keyword" value="${searchMap.keyword}">
					<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
					<input type="hidden" name="admit" value='1'>
				</form>								
				</td>
			</c:if>		
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
					<option value="REFUND_STATUS">구매상태</option>					
				</c:when>
				<c:when test="${searchMap.searchOption == 'MOVIE_TITLE'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE"<c:if test="${searchMap.searchOption eq 'MOVIE_TITLE'}">selected</c:if>>영화제목</option>
					<option value="REFUND_STATUS">구매상태</option>					
				</c:when>				
				<c:when test="${searchMap.searchOption == 'REFUND_STATUS'}">
					<option value="all">전체</option>
					<option value="MOVIE_TITLE">영화제목</option>					
					<option value="REFUND_STATUS"<c:if test="${searchMap.searchOption eq 'REFUND_STATUS'}">selected</c:if>>구매상태</option>
				</c:when>				
			</c:choose>
		</select>
		<input type='hidden' name='userNo' value="${userDto.userNo}">	
		
		<input type="text" name="keyword" value="${searchMap.keyword}" placeholder="검색">
		<input type="submit" value="검색">			
	</form>	
	
</body>
</html>