<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원목록</title>

<style type="text/css">
table, tr, td, th{
	border: 1px solid black;
}

table{
	border-collapse: collapse;
}

</style>

<script type="text/javascript">
	function pageMoveMemberDetailFnc() {
		var memberDetailCurPageInputObj 
			= document.getElementById('memberDetailCurPage');
		
		memberDetailCurPageInputObj.value = 
			document.getElementById('curPage').value;
		
// 		alert(memberDetailCurPageInputObj.value);
		
		var memberDetailFormObj = document.getElementById('memberDetailForm');
		
		memberDetailFormObj.submit();
	}
</script>

</head>

<body>
	
	<jsp:include page="/WEB-INF/views/Header.jsp"/>
	<h1>회원목록</h1>
	
	<p>
		<a href="./add.do">신규 회원 추가</a>
	</p>
	
	<form action="./list.do" method="post">
		<select name="searchOption">
			<c:choose>
				<c:when test="${searchMap.searchOption == 'all'}">
					<option value="all" selected="selected">이름+이메일</option>
					<option value="name">이름</option>
					<option value="email">이메일</option>
				</c:when>
				<c:when test="${searchMap.searchOption == 'name'}">
					<option value="all">이름+이메일</option>
					<option value="name" selected="selected">이름</option>
					<option value="email">이메일</option>
				</c:when>
				<c:when test="${searchMap.searchOption == 'email'}">
					<option value="all">이름+이메일</option>
					<option value="name">이름</option>
					<option value="email" selected="selected">이메일</option>
				</c:when>
			</c:choose>
		</select>
		
		<input type="text" name="keyword" value="${searchMap.keyword}" 
			placeholder="회원이름 검색">
			
		<input type="submit" value="검색">
	
	</form>
	
	
	<table>
		<tr>
			<th>번호</th><th>이름</th><th>이메일</th><th>가입일</th><th></th>
		</tr>
		
		<c:choose>
			<c:when test="${empty memberList}">
				<tr>
					<td colspan="5" 
						style="width: 500px; height: 400px; 
						font-weight: bold; text-align: center;">
						회원이 존재하지 않습니다
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="memberDto" items="${memberList}"> 
		<tr>			
			<td>${memberDto.no}</td>
			<td>
				<form id='memberDetailForm' action="./one.do" method="get">
					<a href='#' onclick="pageMoveMemberDetailFnc();">
						${memberDto.name}
					</a>
					<input type="hidden" name="no" value="${memberDto.no}">
					<input type="hidden" id="memberDetailCurPage" 
						name="curPage" value="">
					<input type="hidden" name="keyword" 
						value="${searchMap.keyword}">
					<input type="hidden" name="searchOption" 
						value="${searchMap.searchOption}">
				</form>
			</td>
			<td>${memberDto.email}</td>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd hh:mm" 
				value="${memberDto.createDate}"/>
			</td>
			<td>
				<a href='./deleteCtr.do?no=${memberDto.no}'>[삭제]</a>
			</td>
		</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</table>

	<jsp:include page="/WEB-INF/views/common/Paging.jsp"/>

	<form action="./list.do" id="pagingForm" method="post">
		<input type="hidden" id="curPage" name="curPage"
			value="${pagingMap.memberPaging.curPage}">
		<input type="hidden" name="keyword" value="${searchMap.keyword}">
		<input type="hidden" name="searchOption" 
			value="${searchMap.searchOption}">
	</form>

	<jsp:include page="/WEB-INF/views/Tail.jsp"/>
	
</body>

</html>