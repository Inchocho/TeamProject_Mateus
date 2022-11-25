<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>movieyo</title>
  <style type="text/css">
   .container {
      width : 70%;
      
    }
    textarea {
      background: #f8f8f8;
      border: 1px solid #e9e8e8;
      resize: none;
      
      outline-color: #e6e6e6;
    }
   
  </style>
 
</head>
<body>
	<jsp:include page="../Header.jsp" />
	<jsp:include page="../UserMyPageSideMenu.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
  $(document).ready(function(){
    let formCheck = function() {
      let form = document.getElementById("form");
      if(form.title.value=="") {
        alert("제목을 입력해 주세요.");
        form.title.focus();
        return false;
      }
      if(form.content.value=="") {
        alert("내용을 입력해 주세요.");
        form.content.focus();
        return false;
      }
      return true;
    }
    
//     $("#writeNewBtn").on("click", function(){
//       location.href="<c:url value='/board/boardList.do'/>";
//     });
    
    $("#writeBtn").on("click", function(){
      let form = $("#form");
      form.attr("action", "<c:url value='/board/boardList.do'/>");
      form.attr("method", "post");
      if(formCheck())
        form.submit();
    });
    $("#listBtn").on("click", function(){
        location.href="<c:url value='/board/boardList.do'/>";
      });
    
  });
</script>
<div class="container">
  <h2 class="writing-header">게시판</h2>
  <form id="form" class="frm" action="./addCtr.do" method="post">
  <select name="boardHead" id="head">
  	<option value="free">자유게시판</option>
  	<option value="question">Q&A</option>
  </select><br>
	<input type="text" name='userNo' value='${userDto.userNo}'>
    제목<br><input name="boardTitle" type="text" value="${boardDto.boardTitle}" placeholder="제목을 입력해 주세요."><br>
    	
    내용입력<br><textarea rows="20" cols="100" name="boardContent"  placeholder="내용을 입력하세요."></textarea><br>

 
    <c:if test="${mode ne 'new'}">
      <button type="submit" id="writeNewBtn" class="btn-write">글쓰기</button>
    </c:if>
    <c:if test="${boardDto.boardNo eq boardNo}">
      <button type="button" id="modifyBtn" class="btn-modify">수정</button>
      <button type="button" id="removeBtn" class="btn-remove">삭제</button>
    </c:if>
    <button type="button" id="listBtn" class="btn-list">목록</button>
  </form>
</div>

<jsp:include page="../Tail.jsp" />
</body>
</html>