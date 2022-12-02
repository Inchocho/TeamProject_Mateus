<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시글 작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <style type="text/css">
  	.writing-header{
  	margin-left: 600px;
  	}
   	.container{
   	margin-left: 250px;
   	}
    .TexaAre {
    width: 600px;
    padding: 5px;
	background: #f8f8f8;
    border: 1px solid #e9e8e8;
    resize: none;
    outline-color: #e6e6e6;
    }
   .frm{
   margin-left:400px;
   width: 700px;
   height: 1000px;
   }
   .BTitle{
    width: 600px;
  	padding: 5px;
   }
   #Ti{
   text-align: 
   }
  </style>
 
</head>
<body>
	<jsp:include page="../Header.jsp" />


<div class="container" >
  <h1 class="writing-header">게시글 작성</h1>
  <form id="form" class="frm" action="./addCtr.do" method="post">
 
	<div>
	<input type="hidden" name="boardNo" value='00'>
	<input type="hidden" name='userNo' value='${userDto.userNo}'>
	<select name="boardHead" id="head">
  		<option value="공지사항">공지사항</option>
  		<option value="문의사항">문의사항</option>
  	</select><br>
	<label for="boardNo" id="Ti" >제목</label>&nbsp;<br><input type="text" class="BTitle" name="boardTitle" style="" value="${boardDto.boardTitle}" placeholder="제목을 입력해 주세요."/><br>
    	
    <label for="boardContent" id="Con">글내용</label>&nbsp;<br>
   			 			<textarea name="boardContent" class="TexaAre" rows="40" cols="100"  placeholder="내용을 입력해 주세요." >${boardDto.boardContent}</textarea>
    <br>
    </div>
      <button type="submit" id="writeNewBtn" class="btn-write">글쓰기</button>&nbsp;
      <button type="button" id="listBtn" class="btn-list">목록으로</button>&nbsp;
      <button type="button" id="cancelBtn" class="btn-modify">작성취소</button>
      

  </form>
</div>
<script>

    
    $("#writeNewBtn").bind("click", function(e){
    	var boardTitle = $("#boardTitle").val();
    	var boardContent = $("#boardContent").val();
    	if(boardTitle == ""){
	    	e.preventDefault();
    		  	alert("제목을 입력해주세요");
    			$("#boardTitle").focus();
    		  }else if(boardContent == ""){
	    	e.preventDefault();
    		  	alert("내용을 입력해주세요");
    			$("#boardContent").focus();
    			
    		  }
    });
    
    $("#writeBtn").on("click", function(e){
      let form = $("#form");
      e.preventDefault();
      form.attr("action", "<c:url value='/board/boardList.do'/>");
      form.attr("method", "post");
      
      if(formCheck())
          form.submit();
     	 });
      
    
    $("#listBtn").on("click", function(){
        location.href="<c:url value='/board/boardList.do'/>?page=${page}&pageSize=${pageSize}";
      });
    $("#cancelBtn").on("click", function(){
        location.href="<c:url value='/board/add.do'/>";
      });
   
    
 
</script>
<jsp:include page="../Tail.jsp" />
</body>
</html>