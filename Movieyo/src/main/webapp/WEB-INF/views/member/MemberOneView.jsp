<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보 상세조회</title>

<script type="text/javascript" src="/springHome/resources/js/jquery-3.6.1.js">
</script>

<script type="text/javascript">
	$(document).ready(function () {
		$('#memberName').css('background-color', '#E7E7E7');
	});
	
	function pageMoveListFnc() {
		$('#memberPageMoveListForm').submit();
	}
	
</script>

</head>
	
<body>

	<jsp:include page="../Header.jsp" />
	
<!-- 	<img alt="이미지 경로 테스트 실패"  -->
<%-- 		src="<c:url value='/resources/img/jquery_error.jpg'/>"> --%>
<!-- 	<img alt="이미지 경로 테스트 실패"  -->
<!-- 		src='/springHome/resources/img/jquery_error.jpg'> -->
	
	<h1>회원정보 상세</h1>
	<form action='./update.do' method='get'>
		<input type="hidden" name='no' value='${memberDto.no}'>
		이름: <input type='text' name='name' id='memberName'
			value='${memberDto.name}' readonly="readonly"><br>
		이메일: <input type='text' name='email' 
			value='${memberDto.email}' disabled="disabled"><br>
		
		첨부파일:
		<c:choose>
			<c:when test="${empty fileList}">
				첨부파일이 없습니다.<br>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="row" items="${fileList}">
					<input type="button" value="이미지" name="file">
					${row.ORIGINAL_FILE_NAME}(${row.FILE_SIZE}kb)<br>
					<img alt="image not found" 
						src="<c:url 
						value='/img/${row.STORED_FILE_NAME}'/>"/>
						<br>
				</c:forEach>
			</c:otherwise>	
		</c:choose>
			
		가입일: <fmt:formatDate value="${requestScope.memberDto.createDate}" 
			pattern="yyyy년MM월dd일 "/><br>
		<input type='submit' value='수정하기'>
		<input type='button' value='이전페이지' onclick='pageMoveListFnc();'>	
	</form>
	
	<jsp:include page="../Tail.jsp" />
	
	<!-- 이전(리스트) 화면으로 이동시 관리할 데이터 -->
	<form id='memberPageMoveListForm' action="./list.do" method="get">
		<input type="hidden" name="curPage" value="${prevMap.curPage}">
		<input type="hidden" name="keyword" 
			value="${prevMap.keyword}">
		<input type="hidden" name="searchOption" 
					value="${prevMap.searchOption}">
	</form>
</body>
</html>