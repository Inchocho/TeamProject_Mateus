<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시판리스트</title>

<style type="text/css">
table, tr, td, th {
	border: 1px solid black;
}

table {
	border-collapse: collapse;
	width: 1000px;
	height: 300px;
    background: #f8f8f8;
    margin: auto;
    border: 1px solid #e9e8e8;
    resize: none;
    padding: 8px;
    outline-color: #e6e6e6;
}
boardCredate{
 border-collapse: col
}
#searchFrm{
	margin-left: 552px;
}
</style>

<script type="text/javascript">
	function pageMoveBoardDetailFnc() {
		var boardDetailCurPageInputObj = document
				.getElementById('boardDetailCurPage');

		boardDetailCurPageInputObj.value = document.getElementById('curPage').value;

		// 		alert(boardDetailCurPageInputObj.value);

		var boardDetailFormObj = document.getElementById('boardDetailForm');

		boardDetailFormObj.submit();
	}
</script>

</head>

<body>

	<jsp:include page="../Header.jsp" />
	<jsp:include page="../UserMyPageSideMenu.jsp"></jsp:include>
	<h1>게시판</h1>

	<p>
		<a href="./add.do">글쓰기</a>
	</p>

	<table>
		<tr>
			<th class="boardNo">게시글번호</th>
			<th class="boardTitle">글제목</th>
			<th class="boardContent">내용</th>
			<th class="boardCredate">등록일</th>
			<th class="boardCount">조회수</th>
			
		</tr>

		<c:choose>
			<c:when test="${empty boardList}">
				<tr>
					<td colspan="10"
						style="width: 500px; height: 400px; font-weight: bold; text-align: center;">
						게시글이 존재하지 않습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="boardDto" items="${boardList}">
					<tr>
						<td>${boardDto.boardNo}</td>
						<td>
							<form id='boardDetailForm' action="./one.do" method="get">
								<a href='#' onclick="pageMoveBoardDetailFnc();">
									${boardDto.boardTitle} </a> 
									<input type="hidden" name="boardNo" value="${boardDto.boardNo}"> 
									<input type="hidden" id="boardDetailCurPage" name="curPage" value="">
									<input type="hidden" name="keyword" value="${searchMap.keyword}">
								<input type="hidden" name="searchOption"
									value="${searchMap.searchOption}">
							</form>
						</td>
						<td>${boardDto.boardContent}</td>
						<td class="boardCredate"><fmt:formatDate pattern="	yyyy-MM-dd hh:mm:ss"
								value="${boardDto.boardCredate}" /></td>
						<td class="boardCount">${boardDto.boardCount}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>
<form action="./boardList.do" method="post" id="searchFrm">
		<select id="searchOptionSel" name="searchOption">
			<c:choose>
				<c:when test="${searchMap.searchOption == 'all'}">
					<option value="all" selected="selected">글번호+글제목</option>
					<option value="boNo">글번호</option>
					<option value="title">제목</option>
				</c:when>
				<c:when test="${searchMap.searchOption == 'bNo'}">
					<option value="all">글번호+글제목</option>
					<option value="boNo" selected="selected">글번호</option>
					<option value="boTitle">글제목</option>
				</c:when>
				<c:when test="${searchMap.searchOption == 'boTitle'}">
					<option value="all">글번호+글제목</option>
					<option value="boNo" >글번호</option>
					<option value="boTitle" selected="selected">글제목</option>
				</c:when>
			</c:choose>
		</select>
		<input type="text"  name="keyword" value="${searchMap.keyword}" placeholder="검색">
	
		<input type="submit" value="검색">
	</form>


	<!-- jsp:include는 forward처럼 데이터를 유지시킨다 -->
	<jsp:include page="/WEB-INF/views/common/Paging.jsp"/>

	<form action="./boardList.do" id="pagingForm" method="post">
		<input type="hidden" id="curPage" name="curPage"
			value="${pagingMap.boardPaging.curPage}"> <input
			type="hidden" name="keyword" value="${searchMap.keyword}"> <input
			type="hidden" name="searchOption" value="${searchMap.searchOption}">
	</form>

	<jsp:include page="../Tail.jsp" />

</body>

</html>