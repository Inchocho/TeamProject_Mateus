<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>게시글</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">
	function deleteFnc(BoardNo){
		var url = "./deleteCtr.do?boardNo=" + boardNo;
		location.href = url;
	}
	
	function moveFnc(){
		var url = "./boardList.do?";
		location.href = url;
	}
	
// 	function moveEditFnc(){
// 		var url = "./updateBoard.do?boardNo=" + ${boardDto.boardNo}
// 		+ "&boardTitle=" + ${boardDto.boardTitle} + "&boardContent="
// 		+ ${boardDto.boardContent};
// 		location.href = url;
// 	}	
	$(document).ready(function() {
		$("#edit").on("click", function(){
			var frm = $("#frm")[0];
			frm.action = "updateBoard.do";
			frm.submit();
		});
	});
</script>

</head>
	
<body>

	<jsp:include page="../Header.jsp" />
	<h1>게시글</h1>
	
	
	<form action='./boardList.do' id="frm" method='post'>
		글번호: <input type="text" name="boardNo" value="${boardDto.boardNo}" readonly="readonly"><br>
	
		글제목: <input type='text' name='boardTitle' 
			value="${boardDto.boardTitle}" readonly="readonly"><br>
			
		글내용
   		<textarea name="boardContent" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>${boardDto.boardContent}
   		</textarea><br>
		등록일 :	<input type="text" name="creDate" value="${boardDto.boardCredate}" readonly="readonly"> <br>
		<input type='submit' value='123'>
		<input type='button' value='수정' id="edit" >
		<input type="button" value="목록" onclick="moveFnc();">
		<input type="button" value="삭제" onclick="deleteFnc(${boardDto.boardNo});">					
	</form>
	
	<jsp:include page="../Tail.jsp" />
</body>
</html>