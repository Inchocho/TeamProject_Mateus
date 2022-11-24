<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시판</title>

<style type="text/css">
table, tr, td, th{
	border: 1px solid black;
}

table{
	border-collapse: collapse;
}

</style>

<script type="text/javascript">
	function pageMoveBoardDetailFnc() {
		var boardDetailCurPageInputObj 
			= document.getElementById('boardDetailCurPage');
		
		boardDetailCurPageInputObj.value = 
			document.getElementById('curPage').value;
		
// 		alert(boardDetailCurPageInputObj.value);
		
		var boardDetailFormObj = document.getElementById('boardDetailForm');
		
		boardDetailFormObj.submit();
	}
</script>

</head>

<body>
	
	<jsp:include page="../Header.jsp" />
	<h1>회원목록</h1>
	
	<p>
		<a href="./board.do">글쓰기</a>
	</p>
	
	<form action="./board/list.do" method="post">
		<select name="searchOption">
			<c:choose>
				<c:when test="${searchMap.searchOption == 'all'}">
					<option value="all" selected="selected">번호+제목+내용</option>
					<option value="boardNo">번호</option>
					<option value="boardTitle">제목</option>
					<option value="boardContent">내용</option>
				</c:when>
				<c:when test="${searchMap.searchOption == 'title'}">
					<option value="all">번호+제목+내용</option>
					<option value="boardTitle" selected="selected">제목</option>
					<option value="boardContent">내용</option>
				</c:when>
				<c:when test="${searchMap.searchOption == 'content'}">
					<option value="all">이름+이메일</option>
					<option value="boardTitle">제목</option>
					<option value="boardContent" selected="selected">내용</option>
				</c:when>
			</c:choose>
		</select>
		
		<input type="text" name="keyword" value="${searchMap.keyword}" 
			placeholder="게시글 검색">
			
		<input type="submit" value="검색">
	
	</form>
	
	
	<table>
		<tr>
					<th class="boardNo">번호</th>
					<th class="boardTitle">제목</th>
					<th class="boardContent">내용</th>
					<th class="boardCredate">등록일</th>
					<th class="boardCount">조회수</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty memberList}">
				<tr>
					<td colspan="10" 
						style="width: 500px; height: 400px; 
						font-weight: bold; text-align: center;">
						게시글이 존재하지 않습니다
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="memberDto" items="${memberList}"> 
		<tr>			
			<td>${boardDto.boardNo}</td>
			<td>
				<form id='boardDetailForm' action="./board.do" method="get">
					<a href='#' onclick="pageMoveBoardDetailFnc();">
						${memberDto.boardTitle}
					</a>
					<input type="hidden" name="boardNo" value="${boardDto.boardNo}">
					<input type="hidden" id="boardDetailCurPage" 
						name="curPage" value="">
					<input type="hidden" name="keyword" 
						value="${searchMap.keyword}">
					<input type="hidden" name="searchOption" 
						value="${searchMap.searchOption}">
				</form>
			</td>
			<td>${boardDto.boardTitle}</td>
			<td>
				<fmt:formatDate pattern="yyyy-MM-dd hh:mm" 
				value="${boardDto.createDate}"/>
			</td>
			<td>
				<a href='./deleteCtr.do?no=${boardDto.boardNo}'>[삭제]</a>
			</td>
		</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</table>

	

	<form action="./list.do" id="pagingForm" method="post">
		<input type="hidden" id="curPage" name="curPage"
			value="${pagingMap.memberPaging.curPage}">
		<input type="hidden" name="keyword" value="${searchMap.keyword}">
		<input type="hidden" name="searchOption" 
			value="${searchMap.searchOption}">
	</form>

	<jsp:include page="../Tail.jsp" />
	
</body>

</html>