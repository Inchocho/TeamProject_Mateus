<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>게시글 상세내용</title>
<style type="text/css">
	textarea {
		width:600px;
		height:600px;
		margin-left :10px;
		resize: none;
		background: #f8f8f8;
	}
	table, tr, td, th {
		border: 1px solid black;
		}
	#boardTab{
		width: 700px;
		height: 700px;
		}
			
	#boardTwoT{
		margin-left: 800px;
		}	
	#from2{
		border-collapse: collapse;
		border: 1px solid #e9e8e8;;
		margin-left: 500px;
	}
	.boardsize2 tr td{
		border: 1px solid black;
　　	}
	#num{
		margin-left: 10px;	
	}	
		
</style>

<script type="text/javascript">
	function moveFnc(){
		var url = "./boardList.do?";
		location.href = url;
	}
	 function pageMoveDeleteFnc(boardNo){
	      var url = "./deleteCtr.do?boardNo=" + boardNo;
	      location.href = url;
	}

	
	
</script>
	




</head>
	
<body>

	<jsp:include page="../Header.jsp" />
	<h1 id="boardTwoT">게시글수정</h1>
	
	
	<form id="from2" action='./updateCtr.do' method='post'>
	
		<table id="boardTab" >
			<tbody class="boardsize2">
				<tr>
					<td>
					<label for="boardNo">글번호</label>&nbsp;<input type="text" name="boardNo" value="${boardDto.boardNo}" readonly="readonly"/><br>
					</td>
				</tr>
				<tr>
					<td id="writer">
					<label for="boardWriter">작성자</label>&nbsp;<input type="text" name="boardWriter" value="${boardWriter}" readonly="readonly"/><br>
					</td>
				</tr>
				<tr>
					<td>
					<label for="boardTitle">글제목</label>&nbsp;<input type='text' name='boardTitle' value="${boardDto.boardTitle}"/><br>
					</td>
				</tr>	
				<tr>
					<td>
   			<label for="boardContent">글내용</label>&nbsp;<br>
   			<textarea name="boardContent" rows="20" cols="30" placeholder=" 내용을 입력해 주세요.">${boardDto.boardContent}</textarea>
   					</td>
				</tr>
			</tbody>	
   		</table>
   		
		<input type='submit' style="margin-left: 260px;" value='수정' >
		<input type="button" style="margin-left: 10px;" value="목록" onclick="moveFnc()">
		<input type="button" style="margin-left: 10px;" value="삭제" onclick="pageMoveDeleteFnc(${boardDto.boardNo});">					
		<input type="hidden" name="modDate" value="${boardDto.boardModdate}"> <br>
		<input type="hidden" name="creDate" value="${boardDto.boardCredate}"> <br>
	</form>
	
	<jsp:include page="../Tail.jsp" />
</body>
</html>