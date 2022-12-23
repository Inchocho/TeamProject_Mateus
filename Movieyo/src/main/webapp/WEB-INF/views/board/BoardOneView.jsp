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
		width:700px;
		height:700px;
		margin-left :10px;
		resize: none;
		background: #f8f8f8;
	}
	#boardTab{
		width: 700px;
		height: 700px;
		text-align: left;
	}
	table, tr, th { 
	border: 2px solid gray; 
	} 
	#frm{
		border-collapse: collapse;
	}

	#bdCtt{
	font-size:20px;
	}
	
	.boardsize input{
	width: 640px;
	
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
.curPageDiv{
	margin: 0px 0px 0px 30px;
	text-align: center;
	min-width: 730px;
}
.titleContainer{
	border-bottom: 2px solid #252525;
	margin: 0px auto;
}
.contContainer{
	width: 730px;
    margin: 20px auto 0px auto;
    font-size: 20px;
}
.titleContainer h1{
	padding-right: 570px;
	min-width: 180px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">
	function moveFnc(){
		var url = "/Movieyo/board/boardList.do";
		$("#frm").attr("action", url);
		$("#frm").submit();
	}
	$(document).ready(function() {
		$("#edit").on("click", function(){
			var frm = $("#frm")[0];
			frm.action = "update.do";
			frm.submit();
		});
	});
</script>

</head>
	
<body>
<jsp:include page="../Header.jsp" />
<div class="curPageDiv">
<div class="titleContainer">
	<h1>게시글 상세</h1>
</div>
<div class="contContainer">
	<form id="frm" action='./update.do' method="get">
		<table id="boardTab">
			<tbody class="boardsize">
				<tr>
					<td id="num">
					<label for="boardNo">글번호</label>&nbsp;<input type="text"   name="boardNo" style="" value="${boardDto.boardNo}" readonly="readonly"/><br>
					</td>
				</tr>
				<tr>
					<td id="writer">
					<label for="boardWriter">작성자</label>&nbsp;<input type="text"   name="userName" value="${boardDto.userName}" readonly="readonly"/><br>
					</td>
				</tr>
				<tr >
					<td id="title">
					<label for="boardTitle">글제목</label>&nbsp;<input type='text'  name='boardTitle' value="${boardDto.boardTitle}" readonly="readonly"/><br>
					</td>
				</tr>	
				<tr>
					<td id="content">
<!--    			<label for="boardContent" id="bdCtt">글내용</label><br> -->
   			 			<textarea name="boardContent" id="bC" rows="50" cols="40" placeholder=" 내용을 입력해 주세요." readonly="readonly">${boardDto.boardContent}</textarea>
   					</td>
				</tr>
			</tbody>	
   		</table>
   		<c:choose>
   		<c:when test="${userDto.userAdmin eq 0}">
   		<c:if test="${userDto.userNo == boardDto.userNo}">
		<input type='button' style="margin-left: 30px;" class="click-btn color1" value='게시물수정'  id="edit">
   		</c:if>
   		</c:when>
   		<c:when test="${userDto.userAdmin eq 1}">
		<input type='button' style="margin-left: 30px;" class="click-btn color1" value='게시물수정'  id="edit">
   		</c:when>
   		</c:choose>
		<input type="button" style="margin-left: 10px;" class="click-btn color2" value="목록으로" onclick="moveFnc()">
		<input type="hidden" name="modDate" value="${boardDto.boardModdate}">
		<input type="hidden" name="creDate" value="${boardDto.boardCredate}">
<input type="hidden" id="boardDetailCurPage" name="curPage" value="${prevMap.curPage}">
<input type="hidden" name="keyword" value="${prevMap.keyword}">
<input type="hidden" name="searchOption" value="${prevMap.searchOption}">
	</form>
</div>
</div>
	<jsp:include page="../Tail.jsp" />
</body>
</html>