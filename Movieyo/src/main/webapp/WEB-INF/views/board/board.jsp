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

    .TexaAre {
    width: 500px;
    padding: 5px;
	background: #f8f8f8;
    border: 1px solid #e9e8e8;
    resize: none;
    outline-color: #e6e6e6;
    }

   .BTitle{
    width: 500px;
  	padding: 5px;
   }
  

   .btn-write{
    width: 140px;
    font-size: 16px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
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
   .btn-write:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
	}
	.btn-write::focus {
    outline: none;
	}
	.btn-write.color-1 {
    background-image: linear-gradient(to right, #25aae1, #40e495, #30dd8a, #2bb673);
    box-shadow: 0 4px 15px 0 rgba(49, 196, 190, 0.75);
    }
    .btn-write.color-2 {
    background-image: linear-gradient(to right, #f5ce62, #e43603, #fa7199, #e85a19);
    box-shadow: 0 4px 15px 0 rgba(229, 66, 10, 0.75);
    }
    .btn-write.color-3 {
        background-image: linear-gradient(to right, #ed6ea0, #ec8c69, #f7186a , #FBB03B);
    box-shadow: 0 4px 15px 0 rgba(236, 116, 149, 0.75);
}
.curPageDiv{
	margin: 0px 0px 0px 30px;
	text-align: center;
	min-width: 600px;
}
.titleContainer{
	border-bottom: 2px solid #252525;
	margin: 0px auto;
}
.contContainer{
	width: 630px;
    margin: 20px auto 0px auto;
    font-size: 20px;
}
.titleContainer h1{
	padding-right: 400px;
}
.cont_form_cont{
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	padding-bottom: 20px;
    border-bottom: 1px dashed #d1d1d1;
}
.title_selbox_area{
	display: flex;
	margin: 10px 0px;
	width: 180px;
}
.title_con_area{
	display: flex;
	align-items: center;
	justify-content: space-between;
    width: 600px;
}
.cont_area{
	display: flex;
	align-items: flex-start;
	justify-content: space-between;
    width: 600px;
    margin-top: 20px;
}
#Ti, #Con, .BoH{
	margin: 0px auto;
}
.con_form_btn{
	display: flex;
    margin: 30px 0px 5px 70px;
    justify-content: space-between;
}
.frm{
	display: flex;
	flex-direction: column;
	border: 1px solid black;
    padding: 15px;
}
  </style>
 
</head>
<body>
	<jsp:include page="../Header.jsp" />

<div class="curPageDiv">
<div class="titleContainer">
  <h1>게시글 작성</h1>
</div>
<div class="contContainer">
  <form id="form" class="frm" action="./addCtr.do" method="post">
	<input type="hidden" name="boardNo" value='00'>
	<input type="hidden" name='userNo' value='${userDto.userNo}'>
	<div class="cont_form_cont">
		<div class="title_selbox_area">
			<label for="boardHed" class="BoH"> 말머리 </label>
			<select name="boardHead" id="boardHed" style="font-size: 18px;">
		  		<option value="notice">공지사항</option>
		  		<option value="Questions">문의사항</option>
		  	</select>
		</div>
		<div class="title_con_area">
			<label for="boardNo" id="Ti"> 제목 </label>
			<input type="text" class="BTitle" name='boardTitle' id="boardTitle" style="" value="${boardDto.boardTitle}" />
		</div>
		<div class="cont_area">
		    <label for="boardContent" id="Con">글내용</label>
		   	<textarea id="boardContent" name="boardContent" class="TexaAre" rows="40" cols="100" ></textarea>
		</div>
	</div>
	<div class="con_form_btn">
      <button type="submit" id="writeNewBtn" class="btn-write color-1">작성하기</button>&nbsp;
      <button type="button" id="listBtn" class="btn-write color-2">목록으로</button>&nbsp;
      <button type="button" id="cancelBtn" class="btn-write color-3">작성취소</button>
	</div>
  </form>

    </div>
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
   
    $(document).ready(function() {
        $('.BTitle').on('keyup', function() {
      
            if($(this).val().length > 40) {
                $(this).val($(this).val().substring(0, 40));
            
            }
        });
    });
 
</script>
<jsp:include page="../Tail.jsp" />
</body>
</html>