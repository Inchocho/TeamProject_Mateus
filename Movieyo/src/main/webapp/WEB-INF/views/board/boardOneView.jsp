<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>${boardDto.boardTitle}</title>
<style type="text/css">
	textarea {
		width:700px;
		height:700px;
		margin-left :10px;
		resize: none;
		background: #f8f8f8;
	}
	#boardTab{
		width: 700px;
		height: 700px;
	}
	table, tr, th { 
	border: 2px solid gray; 
	} 
	#boardOneT{
		margin-left: 800px;
		color: #ff81ab;
	}
	#boardOneT:hover{
		cursor: pointer;
	}
	#frm{
		border-collapse: collapse;
		margin-left: 550px;
	}
	
	#bdCtt{
	font-size:20px;
	color: #ff81ab;
	}
	
	.boardsize input{
	width: 654px;
	}
	.click-btn{
    width: 150px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 20px;
    height: 55px;
    text-align:center;
    border: none;
    background-size: 300% 100%;

    border-radius: 50px;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
   }
   .click-btn:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
	}
	.click-btn::focus {
    outline: none;
	}
	.click-btn.color1 {
    background-image: linear-gradient(to right, #25aae1, #40e495, #30dd8a, #2bb673);
    box-shadow: 0 4px 15px 0 rgba(49, 196, 190, 0.75);
    }
    .click-btn.color2 {
    background-image: linear-gradient(to right, #f5ce62, #e43603, #fa7199, #e85a19);
    box-shadow: 0 4px 15px 0 rgba(229, 66, 10, 0.75);
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function deleteFnc(BoardNo){
		var url = "./deleteCtr.do?boardNo=" + boardNo;
		location.href = url;
	}
	
	function moveFnc(){
		var url = "./boardList.do?";
		location.href = url;
	}
	
	function moveBoardFnc(){
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
	<h1 id="boardOneT" onclick="moveBoardFnc()">무비요 게시판</h1>
	
	
<form id="frm" action='./updateCtr.do' method='post'>
	
		<table id="boardTab">
			<tbody class="boardsize">
				<tr>
					<td id="num">
					<label for="boardNo">글번호</label>&nbsp;<input type="text"   name="boardNo" style="" value="${boardDto.boardNo}" readonly="readonly"/><br>
					</td>
				</tr>
				<tr>
					<td id="writer">
					<label for="boardWriter">작성자</label>&nbsp;<input type="text"  name="boardWriter" value="${boardDto.userName}" readonly="readonly"/><br>
					</td>
				</tr>
				<tr >
					<td id="title">
					<label for="boardTitle">글제목</label>&nbsp;<input type='text' name='boardTitle' value="${boardDto.boardTitle}" readonly="readonly"/><br>
					</td>
				</tr>	
				<tr>
					<td id="content">
   			<label for="boardContent" id="bdCtt"></label>
   			 			<textarea name="boardContent" id="bC" rows="50" cols="40" placeholder=" 내용을 입력해 주세요." readonly="readonly">${boardDto.boardContent}</textarea>
   					</td>
				</tr>
			</tbody>	
   		</table>
   		<div class="my-3 p-3 bg-white rounded shadow-sm">
			<c:choose>
			<c:when test="${boardDto.next != 9999}">
			
<%-- 			<button type="button" class="btn btn-warning mr-3 mb-3" onclick="location.href='/board/one.do?boardNo=${boardDto.next}'"> <span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>다음글</button> --%>
				<a href="/board/one.do?boardNo=${move.next}&userName" style="color: black"> ${boardDto.nexttitle} </a>
			</c:when>
			
			<c:when test="${boardDto.next == 9999}">
			<button type="button" class="btn btn-warning mr-3 mb-3" disabled>다음글이 없습니다</button>
			</c:when>
			</c:choose>
			<br/>
			<c:choose>
			<c:when test="${boardDto.last != 9999}">
<%-- 			<button type="button" class="btn btn-info mr-3 " onclick="location.href='/board/one.do?boardNo=${boardDto.last}'"> <span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>이전글</button> --%>
			<a href="/board/one.do?boardNo=${boardDto.last}" style="color: black"> ${boardDto.lasttitle} </a>
			</c:when>
			
			<c:when test="${boardDto.last == 9999}">
			<button type="button" class="btn btn-info mr-3" disabled>이전글이 없습니다</button>
			</c:when>
			</c:choose>

		</div>
   		
		<input type='button' style="margin-left: 170px;" class="click-btn color1" value='게시물수정'  id="edit">
		<input type="button" style="margin-left: 10px;" class="click-btn color2" value="목록으로" onclick="moveFnc()">
		<input type="hidden" name="modDate" value="${boardDto.boardModdate}"> <br>
		<input type="hidden" name="creDate" value="${boardDto.boardCredate}"> <br>
	</form>
	
	<jsp:include page="../Tail.jsp" />
</body>
</html>