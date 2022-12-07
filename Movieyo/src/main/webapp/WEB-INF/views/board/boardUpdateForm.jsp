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
		}
	table, tr, th {
		border: 2px solid gray;
		}
	#boardTab{
		width: 700px;
		height: 700px;
		text-align: left;
		}
			
	#boardTwoT{
		color: #ff81ab;
		}	
	
	.boardsize2 input{
		width: 640px;
	}
	#num{
		margin-left: 10px;	
	}
	#buctt{
		font-size:20px;
	}	
	.btn-click{
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
   .btn-click:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
	}
	.btn-click::focus {
    outline: none;
	}
	.btn-click.color1 {
    background-image: linear-gradient(to right, #25aae1, #40e495, #30dd8a, #2bb673);
    box-shadow: 0 4px 15px 0 rgba(49, 196, 190, 0.75);
    }
    .btn-click.color2 {
    background-image: linear-gradient(to right, #f5ce62, #e43603, #fa7199, #e85a19);
    box-shadow: 0 4px 15px 0 rgba(229, 66, 10, 0.75);
    }
    .btn-click.color3 {
        background-image: linear-gradient(to right, #ed6ea0, #ec8c69, #f7186a , #FBB03B);
    box-shadow: 0 4px 15px 0 rgba(236, 116, 149, 0.75);
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
		var url = "./boardList.do?";
		location.href = url;
	}
	 function pageMoveDeleteFnc(boardNo){
	      var url = "./deleteCtr.do?boardNo=" + boardNo;
	      location.href = url;
	}
	 $(document).ready(function() {
	        $('.BuTitle').on('keyup', function() {
	      
	            if($(this).val().length > 40) {
	                $(this).val($(this).val().substring(0, 40));
	            
	            }
	        });
	    });
	
	
</script>
</head>
<body>
<jsp:include page="../Header.jsp" />
<div class="curPageDiv">
<div class="titleContainer">
	<h1 id="boardTwoT">게시글 수정</h1>
</div>
<div class="contContainer">
	<form id="fromT" action='./updateCtr.do' method="post">
		<table id="boardTab" >
			<tbody class="boardsize2">
				<tr>
					<td>
					<label for="boardNo">글번호</label>&nbsp;<input type="text"  name="boardNo" value="${boardDto.boardNo}" readonly="readonly"/><br>
					</td>
				</tr>
				<tr>
					<td id="writer">
					<label for="boardWriter">작성자</label>&nbsp;<input type="text" name="userName" value="${boardDto.userName}" readonly="readonly"/><br>
					</td>
				</tr>
				<tr>
					<td>
					<label for="boardTitle">글제목</label>&nbsp;<input type='text' class="BuTitle" name='boardTitle' value="${boardDto.boardTitle}"/><br>
					</td>
				</tr>	
				<tr>
					<td>
<!--    			<label for="boardContent" id="buctt">글내용</label>&nbsp;<br> -->
   			<textarea name="boardContent" rows="20" cols="30" placeholder=" 내용을 입력해 주세요.">${boardDto.boardContent}</textarea>
   					</td>
				</tr>
			</tbody>	
   		</table>
   		
		<input type='submit' style="margin-left: 100px;" class="btn-click color1" value='수정' >
		<input type="button" style="margin-left: 10px;" class="btn-click color2" value="목록" onclick="moveFnc()">
		<input type="button" style="margin-left: 10px;" class="btn-click color3" value="삭제" onclick="pageMoveDeleteFnc(${boardDto.boardNo});">					
		<input type="hidden" name="modDate" value="${boardDto.boardModdate}">
		<input type="hidden" name="creDate" value="${boardDto.boardCredate}">
<input type="hidden" name="userNo" value="${boardDto.userNo}">
<input type="hidden" id="boardDetailCurPage" name="curPage" value="${prevMap.curPage}">
<input type="hidden" name="keyword" value="${prevMap.keyword}">
<input type="hidden" name="searchOption" value="${prevMap.searchOption}">
	</form>
</div></div>
	<jsp:include page="../Tail.jsp" />
</body>
</html>