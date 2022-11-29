<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>게시글 상세내용</title>



	


</script>

</head>
	
<body>

	<jsp:include page="../Header.jsp" />
	<h1>게시글</h1>
	
	
	<form id="frm" action='./updateBoard.do' method='post'>
		글번호: <input type="text" name="boardNo" value="${boardDto.boardNo}" readonly="readonly"><br>
		글제목: <input type='text' name='boardTitle' 
			value="${boardDto.boardTitle}"><br>
			
		글내용
   		<textarea name="boardContent" rows="20" placeholder=" 내용을 입력해 주세요.">${boardDto.boardContent}
   		</textarea><br>
		등록일 :	<input type="hidden" name="creDate" value="${boardDto.boardCredate}" readonly="readonly"> <br>
		<input type="text" name="modDate" value="${boardDto.boardModdate}"> <br>
		<input type='button' id="edit" value='수정' >
		<input type="button" value="목록" onclick="moveFnc()">
		<input type="button" value="삭제" onclick="deleteFnc(${boardDto.boardNo});">					
	</form>
	
	<jsp:include page="../Tail.jsp" />
</body>
</html>