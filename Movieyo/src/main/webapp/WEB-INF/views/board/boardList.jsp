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
	
	table-layout:pixed;
	border-collapse: collapse;
	width: 1500px;
	height: 600px;
	margin: auto;
    border: 1px solid #e9e8e8;
    resize: none;
    padding: 8px;
    outline-color: #e6e6e6;
    text-align: center;
}
.bodyCl{
	background-color: #ffffff;
}
boardCredate{
 border-collapse: col
}
#searchFrm{
	margin-left: 200px;
}
.bddiv{	
 
}
#boardWrt{
	margin-left: 1570px;
	text-decoration: none;
   	color:black;
    padding:10px 20px 10px 20px;
   	display:inline-block;
   	border-radius: 10px;
}
#boardM{
	margin:auto;
	padding: 20px;
	
}
.selectDel{
	margin-left: 1600px;
}
.searchCl{

}
.write{
	
}
#searchOptionSel{

}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
	function pageMoveBoardDetailFnc(boardNo) {
		var boardDetailCurPageInputObj = document
				.getElementById('boardDetailCurPage');

		boardDetailCurPageInputObj.value = document.getElementById('curPage').value;

		// 		alert(boardDetailCurPageInputObj.value);
		var formId = 'boardDetailForm' + boardNo;
		var boardDetailFormObj = document.getElementById(formId);

		boardDetailFormObj.submit();
	}
	
	$(document).ready(function() {
        // 모두선택 클릭 시
        $("input:checkbox[name='checkAll']").click(function() {
            if($("input:checkbox[name='checkAll']").is(":checked") == true) {
                $("input:checkbox[name='chk']").prop("checked", true);
            } else {
                $("input:checkbox[name='chk']").prop("checked", false);
            }
        });

        // 체크박스 클릭 시
        $("input:checkbox[name='chk']").click(function() {
            var allCnt = $("input:checkbox[name='chk']").length;         // chk 전체갯수
            var selCnt = $("inupt:checkbox[name='chk']:checked").length; // chk 선택갯수

            if(allCnt != selCnt) {
                $("input:checkbox[name='chkAll']").prop("checked", false);
            }
        });
    });
// 	$(document).on('click', '#delete', function() {	// 삭제버튼 클릭 시 
// 		var checkBoxArr = [];

// 		$(".chk:checked").each(function(i,e){
// 		 var boardNo = $(this).val();
// 		  	checkBoxArr.push(boardNo);
			
// 		});
// 		location.href="boardList.do?boardNo="+boardNo;
// 	});
	function selectDelete(){
		var checkBoxArr = []; 
		
		$("input:checkbox[name='chk']:checked").each(function(i,e) {
			checkBoxArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
		});
		
// 		alert(checkBoxArr);
		
		$.ajax({
			type  : "post",
			url   : "./listDeleteCtr.do",
			data: {
				checkBoxArr : checkBoxArr     // 체크박스의 seq 값을 가지고 있음.
			},
			success: function(result){
				alert("게시물 삭제를 성공하였습니다.");
				location.reload();
			}
		});
		
	}
	 
	
	

	


	
	

</script>
</head>

<body class="bodyCl">

	<jsp:include page="../Header.jsp" />
	
	<h1 id="boardM" style="padding-left: 900px;">게시판</h1>

	<div class="bddiv">
	<table>
		<tr>
			<th>
			<input type="checkbox" name="checkAll"  id="allCheckBox" />
			</th>
			<th class="boardHead">말머리</th>
			<th class="boardNo">게시글번호</th>
			<th class="boardTitle">글제목</th>
			<th class="boardContent">게시글내용</th>
			<th class="boardWriter">작성자</th>
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
						<td><input name="chk" type="checkbox"  id="selChk" value="${boardDto.BOARD_NO}"/></td>
						<td>${boardDto.BOARD_HEAD}</td>
						<td>${boardDto.BOARD_NO}</td>
						<td>
							<form id='boardDetailForm${boardDto.BOARD_NO}' action="./one.do" method="get">
								<a href='#' onclick="pageMoveBoardDetailFnc(${boardDto.BOARD_NO});">
									${boardDto.BOARD_TITLE} </a> 
									<input type="hidden" name="boardNo" value="${boardDto.BOARD_NO}"> 
									<input type="hidden" name="userName" value="${boardDto.USER_NAME}"> 
									<input type="hidden" id="boardDetailCurPage" name="curPage" value="">
									<input type="hidden" name="keyword" value="${searchMap.keyword}">
								<input type="hidden" name="searchOption"
									value="${searchMap.searchOption}">
							</form>
						</td>
						
						<td>${boardDto.BOARD_CONTENT}</td>
						<td class="boardWriter">${boardDto.USER_NAME}</td>
						<td class="boardCredate"><fmt:formatDate pattern="	yyyy-MM-dd "
								value="${boardDto.BOARD_CREDATE}" /></td>
						<td class="boardCount">${boardDto.BOARD_COUNT}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>
	</div>
	<br>
		
			
		
		
		
	<form action="./boardList.do" method="post" id="searchFrm">
		<div class="searchCl"> 
		<select id="searchOptionSel" name="searchOption">
			<c:choose>
				<c:when test="${searchMap.searchOption == 'all'}">
					<option value="all" selected="selected">글번호+글제목</option>
					<option value="BOARD_NO">글번호</option>
					<option value="BOARD_TITLE">제목</option>
				</c:when>
				<c:when test="${searchMap.searchOption == 'bNo'}">
					<option value="all">글번호+글제목</option>
					<option value="BOARD_NO" selected="selected">글번호</option>
					<option value="BOARD_TITLE">글제목</option>
				</c:when>
				<c:when test="${searchMap.searchOption == 'boTitle'}">
					<option value="all">글번호+글제목</option>
					<option value="BOARD_NO" >글번호</option>
					<option value="BOARD_TITLE" selected="selected">글제목</option>
				</c:when>
			</c:choose>
		</select>
	
		<input type="text"  name="keyword" value="${searchMap.keyword}" placeholder="검색">
		<input type="submit" value="검색">
		<button class="selectDelete_btn" style="margin-left: 1000px;" id="delete" onclick="selectDelete();" value="${boardDto.BOARD_NO}">선택삭제 </button>
			<a href="./add.do" class="write" style="margin-left: 10px; text-decoration: none; " >글쓰기</a>
		</div>
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