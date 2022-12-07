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
table, tr, td, th{
	border:1px solid black; 
}
td{
	height: 50px;
}
table {
	border-collapse: collapse;
}
.curPageDiv{
	margin: 0px 0px 0px 30px;
	text-align: center;
	min-width: 1000px;
}
.titleContainer{
	border-bottom: 2px solid #252525;
	margin: 0px auto;
	padding-right: 850px;
}
.contContainer{
	width: 1000px;
    margin: 40px auto 0px auto;
    font-size: 20px;
}
.contContainer table{
	width: 1000px;
	border: 1px solid #e9e8e8;
    table-layout: fixed;
    padding: 8px;
    outline-color: #e6e6e6;
    text-align: center;
    margin: 20px 0px;
}

.contContainer table th{
	background-color: 	#F8DFE6;
}

.bddiv{
	display: flex;
	flex-direction: column;
}
.btn_area{
	display: flex;
	justify-content: flex-end;
}
#searchOptionSel{
	background-color : #00ff7f;
 	text-align:center;
	width: 200px;
  	padding: 10px;
}

.bdSearch{
	background-color : #D8F6CE;
	width: 300px;
  	padding: 10px;
}
.write_btn{
    width: 100px;
    font-size: 16px;
    font-weight: 600;
    color: #000000;
    cursor: pointer;
    margin: 5px;
    height: 55px;
    text-align:center;
    border: none;
    background-size: 300% 100%;
    border-radius: 50px;
    transition: all .4s ease-in-out;
   }
   .write_btn:hover {
    background-position: 100% 0;
    transition: all .4s ease-in-out;
	}
	.write_btn::focus {
    outline: none;
	}
	.write_btn.color {
    background-image: linear-gradient(to right, #25aae1, #40e495, #30dd8a, #2bb673);
    box-shadow: 0 4px 15px 0 rgba(49, 196, 190, 0.75);
    }
    .write_btn.color2 {
    background-image: linear-gradient(to right, #fc6076, #ff9a44, #ef9d43, #e75516);
    box-shadow: 0 4px 15px 0 rgba(252, 104, 110, 0.75);
}
	.write_btn.color3 {
    background-image: linear-gradient(to right, #009245, #FCEE21, #00A8C5, #D9E021);
    box-shadow: 0 4px 15px 0 rgba(83, 176, 57, 0.75);
}
	#ckBox{
	    accent-color:#F1948A;
		width: 30px;
		height: 40px;
	}
	#selChk{
		accent-color:#F1948A;
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
	function selectDelete(){
		var checkBoxArr = []; 
		
		$("input:checkbox[name='chk']:checked").each(function(i,e) {
			checkBoxArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
		});
		
		
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

<body>
<jsp:include page="../Header.jsp" />

<div class="curPageDiv">
<div class="titleContainer">
	<h1>게시판</h1>
</div>
<div class="contContainer">
<div class="bddiv">
	<div class="btn_area">
		<c:if test="${userDto.userAdmin eq 1}">
		<button class="write_btn color2" style="" id="delete" onclick="selectDelete();">선택삭제 </button>
		</c:if>
		<button type="button" class="write_btn color" onclick="location.href='./add.do'">글쓰기</button><br>
	</div>
	<table>
		<tr id="tableT">
		<c:if test="${userDto.userAdmin eq 1}">
			<th id="ckBox">
			<input type="checkbox" name="checkAll"  id="allCheckBox" />
			</th>
		</c:if>
			<th>말머리</th>
			<th>번호</th>
			<th style="width: 400px;">제목</th>
			<th>작성자</th>
			<th style="width: 120px;">등록일</th>
			<th style="width: 120px;">수정일</th>
			<th>조회수</th>
			
		</tr>
		<c:choose>
			<c:when test="${empty boardList}">
				<tr>
					<td colspan="7"
						style="height: 400px; font-weight: bold; text-align: center;">
						게시글이 존재하지 않습니다</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="boardDto" items="${boardList}">
					<tr id="hideTr">
						<c:if test="${userDto.userAdmin eq 1}">
						<td><input name="chk" type="checkbox"  id="selChk" value="${boardDto.BOARD_NO}"/></td>
						</c:if>
						<td>${boardDto.BOARD_HEAD}</td>
						<td>${boardDto.BOARD_NO}</td>
						<td>
							<form id='boardDetailForm${boardDto.BOARD_NO}' action="./one.do" method="get">
								<a href='#' onclick="pageMoveBoardDetailFnc(${boardDto.BOARD_NO});">
									${boardDto.BOARD_TITLE} </a> 
									<input type="hidden" name="boardNo" value="${boardDto.BOARD_NO}"> 
									<input type="hidden" name="userName" value="${boardDto.USER_NAME}"> 
									<input type="hidden" id="boardDetailCurPage" name="curPage" value="${pagingMap.commonPaging.curPage}">
									<input type="hidden" name="keyword" value="${searchMap.keyword}">
									<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
							</form>
						</td>
						
						<td class="boardWriter">${boardDto.USER_NAME}</td>
						<td class="boardCredate"><fmt:formatDate pattern="	yyyy-MM-dd "
								value="${boardDto.BOARD_CREDATE}" /></td>
						<td class="boardCredate"><fmt:formatDate pattern="	yyyy-MM-dd "
								value="${boardDto.BOARD_MODDATE}" /></td>
						<td class="boardCount">${boardDto.BOARD_COUNT}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>
	</div>
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
	
		<input type="text"  name="keyword" class="bdSearch" value="${searchMap.keyword}" placeholder="검색" >
		<input type="submit" class="write_btn color3" value="검색">
		</div>
	</form>
	<jsp:include page="/WEB-INF/views/common/CommonPaging.jsp"/>
	
</div>
</div>

	<form action="./boardList.do" id="pagingForm" method="post">
		<input type="hidden" id="curPage" name="curPage"
			value="${pagingMap.commonPaging.curPage}"> 
			<input type="hidden" name="keyword" value="${searchMap.keyword}"> 
			<input type="hidden" name="searchOption" value="${searchMap.searchOption}">
	</form>

	<jsp:include page="../Tail.jsp" />

</body>

</html>