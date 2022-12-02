<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<style type="text/css">
	textarea {
		width:600px;
		height:600px;
		margin-left :10px;
		resize: none;
		background: #f8f8f8;
	}
	#boardTab{
		width: 700px;
		height: 700px;
	}
	table, tr, td, th { 
	border: 1px solid black; 
	} 
	#boardOneT{
		margin-left: 800px;
	}
	#frm{
		border-collapse: collapse;
		border: 1px solid #e9e8e8;;
		margin-left: 500px;
	}
	.boardsize{
		border: 1px solid black;
　　	}
	#num{
		margin-left: 10px;	
	}
	
</style>
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
			frm.action = "updateCtr.do";
			frm.submit();
		});
	});
</script>

</head>
	
<body>

	<jsp:include page="../Header.jsp" />
	<h1 id="boardOneT">게시글</h1>
	
	
<form id="frm" action='./updateCtr.do' method='post'>
	
		<table id="boardTab">
			<tbody class="boardsize">
				<tr>
					<td id="num">
					<label for="boardNo">글번호</label>&nbsp;<input type="text" name="boardNo" style="" value="${boardDto.boardNo}" readonly="readonly"/><br>
					</td>
				</tr>
				<tr>
					<td id="writer">
					<label for="boardWriter">작성자</label>&nbsp;<input type="text" name="boardWriter" value="${boardDto.userName}" readonly="readonly"/><br>
					</td>
				</tr>
				<tr >
					<td id="title">
					<label for="boardTitle">글제목</label>&nbsp;<input type='text' name='boardTitle' value="${boardDto.boardTitle}" readonly="readonly"/><br>
					</td>
				</tr>	
				<tr>
					<td id="content">
   			<label for="boardContent">글내용</label>&nbsp;<br>
   			 			<textarea name="boardContent" rows="20" cols="40" placeholder=" 내용을 입력해 주세요." readonly="readonly">${boardDto.boardContent}</textarea>
   					</td>
				</tr>
			</tbody>	
   		</table>
   		
		<input type='button' style="margin-left: 260px;" value='게시물수정'  id="edit">
		<input type="button" style="margin-left: 10px;" value="목록" onclick="moveFnc()">
		<input type="hidden" name="modDate" value="${boardDto.boardModdate}"> <br>
		<input type="hidden" name="creDate" value="${boardDto.boardCredate}"> <br>
	</form>
	
	<jsp:include page="../Tail.jsp" />
</body>
</html>