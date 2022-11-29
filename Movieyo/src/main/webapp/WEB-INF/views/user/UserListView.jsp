<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원관리</title>

<style type="text/css">
table, tr, td, th {
	border: 1px solid black;
}

table {
	border-collapse: collapse;
}
</style>

<script type="text/javascript">
	
</script>

</head>

<body>

	<jsp:include page="/WEB-INF/views/Header.jsp" />
	<h1>회원관리</h1>


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
		</select> <input type="text" name="keyword" value="${searchMap.keyword}"
			placeholder="회원이름 검색"> <input type="submit" value="검색">

	</form>


	<table>
		<tr>
			<th>아이디</th>
			<th>닉네임</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>캐쉬</th>
			<th>수정 및 관리</th>
		</tr>

		<c:choose>
			<c:when test="${empty userList}">
				<tr>
					<td colspan="5"
						style="width: 500px; height: 400px; font-weight: bold; text-align: center;">
						회원이 존재하지 않습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="userDto" items="${userList}">


					<tr>
						<td>${userDto.email}</td>
						<td>${userDto.nickname}</td>
						<td>${userDto.userName}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${userDto.userBirth}" /></td>
						<td>${userDto.gender}</td>
						<td>${userDto.userCash}</td>
						<td>
							<form id='userDetailForm' action="./one.do" method="get">
								<input type="hidden" name="userNo" value="${userDto.userNo}">
								<input type="submit" value="상세">
							</form>
						</td>

					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>

	<jsp:include page="/WEB-INF/views/common/Paging.jsp" />

	<form action="./list.do" id="pagingForm" method="post">
		<input type="hidden" id="curPage" name="curPage"
			value="${pagingMap.memberPaging.curPage}"> <input
			type="hidden" name="keyword" value="${searchMap.keyword}"> <input
			type="hidden" name="searchOption" value="${searchMap.searchOption}">
	</form>

	<jsp:include page="/WEB-INF/views/Tail.jsp" />

</body>

</html>