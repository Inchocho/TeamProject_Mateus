<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt'%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c'%>	
<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function(){
			//id가 첫글자가 delete인 a태그를 누르면 기존 이벤트를 막고 deleteFileFnc함수가 실행됨
			//즉 delete_1,delete_2 모든 애들을 찾게된다			
			$("a[id ^= 'delete']").on('click', function(e) {	// 삭제 버튼
				e.preventDefault();
				deleteFileFnc($(this));
			});
	});
	
	//폼의 액션을 바꿈 함수호출할때마다(업데이트 작업 / 목록으로 작업/ 바로뒤로)
	//회원목록으로 이동(POST)
	function goListFnc(){
		$('#updateCtrForm').attr('action', './list.do').attr('method', 'get');
		$('#updateCtrForm').submit();
	}	
	
	//이전페이지로 이동(POST)
	function goPrevPageFnc(){
		$('#updateCtrForm').attr('action', './one.do').attr('method', 'get');
		$('#updateCtrForm').submit();
	}		
	
	function deleteFileFnc(obj){
		//현재 나의객체 this(a id=delete_1~~)의 parent() 부모요소를 remove() 제거
		//자바스크립트는 자식에서 부모로 찾아 갈 수 있음 즉 <div>를 만남 (div id=fileContent는 부모의 부모이므로 말짱)
		//구조 <div id='fileContent'><div><a태그></div></div>
		obj.parent().remove();
	}
	
	function addFileFnc() {
		var obj = $('#fileContent');
		var htmlStr = '';

		htmlStr += '<div>';
		htmlStr += '<input type="hidden" id="fileIdx" name="fileIdx"';	
		htmlStr += ' value=""/>';
		htmlStr += '<input type="file" id="file0" name="file0">';
		htmlStr += '<a href="#this" id="delete0">삭제</a>';
		htmlStr += '</div>'
		
		obj.html(htmlStr);
		
	}
		
		$("a[id ^= 'delete']").on('click', function(e) {	// 삭제 버튼
			e.preventDefault();
			deleteFileFnc($(this));
		});		
	}

	function pageMoveListFnc() {
		location.href = './list.do';
	}
	
	function pageMoveDeleteFnc(no){
		var url = "./deleteCtr.do?no=" + no;
		location.href = url;
	}
	
	function pageMoveBefore(no){
		var url = "./one.do?no=" + no;
		location.href = url;
	}

</script>

</head>
	
<body>

	<jsp:include page="../Header.jsp" />
	
	<h1>회원정보</h1>
	<form action='./updateCtr.do' method='post' id="updateCtrForm"
		enctype="multipart/form-data">
		<input type='hidden' name='no' value='${memberDto.no}' readonly><br>
		이름: <input type='text' name='name' id='memberName'
			value='${memberDto.name}' id='name'><br>
		이메일: <input type='text' name='email' 
			value='${memberDto.email}' id='email'><br>
			
		비밀번호: <input type="password" name="password" value=""><br>
		
		첨부파일:
		<div id='fileContent'>
			<div>
			
			<c:choose>
				<c:when test="${empty fileList}">
					<input type="hidden" id='fileIdx' name='fileIdx' value="">
					<input type="file" id='file0' name='file0'>
					<a href="#this" id="delete0"
						 onclick="addFileFnc();">삭제</a>
				</c:when>
				<c:otherwise>
					<c:forEach var="row" items="${fileList}" varStatus="obj">
					<input type="hidden" id="fileIdx_${obj.index}"
					name='fileIdx' value='${row.IDX}'>
					<img alt="image not found"
					src="<c:url value='/img/${row.STORED_FILE_NAME}'/>"/><br>
					${row.ORIGINAL_FILE_NAME} <input type="file" id="file_${obj.index}"
						 name="file_${obj.index}">
						 (${row.FILE_SIZE}kb)
						 <a href="#this" id="delete_${obj.index}">삭제</a><br>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
			</div>
		</div>
		
		가입일: <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss"
				 value="${memberDto.createDate}"/><br>						
		
		<input type='button' value='파일추가' onclick='addFileFnc();'>
		<input type='submit' value='저장' id='submitBtn'>
		<input type='button' value='삭제' 
			onclick='pageMoveDeleteFnc(${memberDto.no});'>
		<input type='button' value='회원목록으로 이동' id='memberListBtn' onclick='goListFnc();'>
		<input type='button' value='${memberDto.name}님 뒤로가기' id='prevPageBtn' onclick='goPrevPageFnc();'>	
		<!-- memberList목록에서 현재페이지,키워드,서치옵션을 들고가자 -->
		<input type="hidden" id="no" name="no" value="${memberDto.no}">
		<input type="hidden" id="curPage" name="curPage"
		   value="${memberMap.curPage}">
		<input type="hidden" name="keyword"
		   value="${memberMap.keyword}">
		<input type="hidden" name="searchOption"
		   value="${memberMap.searchOption}">    		
	</form>

	
	<jsp:include page="../Tail.jsp" />
</body>
</html>