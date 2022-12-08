<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
	
.titleContainer{
	border-bottom: 2px solid #252525;
	margin: 3px 3px 3px 0px;
	padding-right: 600px;
}

.userInfo {
	display: flex;
	align-items: center;
	height: 45px;
	border-bottom: 1px dashed #d1d1d1;
	margin: 2px 0px;
}

.p {
	width: 150px;
	height: 30px;
	margin: 0px 30px 0px 0px;
	font-size: 20px;
	margin-block: initial;
	height: 30px;
}

.input{
	width: 280px;
	height: 30px;
	position: relative;
	border: solid 1px #bfbfbf;
	border-radius: 4px;
	background: #fff;
}

.contContainer {
	width: 620px;
	padding: 10px 0 0 30px;
	margin: auto;
}

.detailFormDiv, .detailForm_top, .detailForm_bottom {
	display: flex;
	text-align: left;
}
.detailFormDiv {
	border: 1px solid black;
}

.curPageDiv{
	margin: 0px 0px 0px 200px;
	text-align: center;
	min-width: 600px;
}

.btn_area {
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	function pageMoveBeforeFnc(userNo){
		location.href = 'one.do?userNo=' + userNo;
	}
	
	 $(document).ready(function() {
	 	let message = "${msg}";
	    
	 	if (message != "") {
	    		alert(message);
	    }
	 	
	 	var pwC = /^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/;
	 	
		 $('#submitBtn').click(function () {
		 	 var submit = true;
			 
		 	 var passwordC = $('#passwordC').val();
			 var changePw = $('#changePw').val();
			 var changePwC = $('#changePwC').val();
			 
		 	 if (passwordC == "") {
				alert("비밀번호를 입력해주세요");
				$('#passwordC').focus();
				submit = false;
			 }else if (changePw == "") {
				alert("비밀번호를 입력해주세요");
				$('#changePw').focus();
				submit = false;
			}else if (changePwC == "") {
				alert("비밀번호를 입력해주세요");
				$('#changePwC').focus();
				submit = false;
			}else if (changePw != changePwC) {
				alert("비밀번호가 일치하지 않습니다.");
				$('#changePwC').focus();
				submit = false;
			}else if (!changePw.match(pwC)) {
				alert('비밀번호는 영문, 숫자, 특수문자 3개를 조합하여\n최소 8자리 이상이여야 합니다.');
				$('#changePw').focus();
				submit = false;
			}
		 	
		 	 return submit;
		  });
		 
// 		 $('#changePw').blur(function () {
// 			 var changePwC = $('#changePw').val();
			 
// 			 if (!changePwC.match(pwC)) {
// 				alert('비밀번호는 영문, 숫자, 특수문자 3개를 조합하여 최소 8자리 이상이여야 합니다.');
// 			}
// 		});
	  });

	
	
			
</script>
</head>
<body>
	
	<jsp:include page="../Header.jsp"/>
	<jsp:include page="../UserMyPageSideMenu.jsp"></jsp:include>
		<div class="titleContainer">
			<div class="curPageDiv">
					<h1>비밀번호 변경</h1>
			</div>
		</div>
	
		<div class="contContainer">

		<form action="./passwordUpdateCtr.do" method="post" id="submitForm">
		<div class="detailFormDiv">
		<div class="detailForm_top">		
			<input type="hidden" name='userNo' value='${userDto.userNo}' readonly="readonly"><br>
			<input type="hidden" name="adminCheck" value='${adminCheck}'>
			<input type="hidden" name='likeGenre' value='${likeGenre}'>
			<div style="width: 610px; margin-top: 13px; padding-left: 10px;">
			<div class="userInfo">
				<p class="p">현재 비밀번호</p>
				<input type="password" name="passwordC" id="passwordC" class="input">
			</div>
			<div class="userInfo">
				<p class="p">변경 비밀번호</p>
				<input type="password" name="password" id="changePw" class="input">				
			</div>
			<div class="userInfo">
				<p class="p">비밀번호 확인</p>
				<input type="password" id="changePwC" class="input">
			</div>
			</div>
			</div>
			</div>
			<!-- 비밀번호 변경확인 로직을 위한 hidden값 패스워드 -->
<%-- 			<input type="hidden" value="${userDto.password}" id="password"> --%>
			
			
			
			<input type='hidden' name='nickname' id='memberName'value='${userDto.nickname}'>
			<input type='hidden' name='userName' id='memberName'value='${userDto.userName}'>
			<input type='hidden' name='userAdmin' value="${userDto.userAdmin}">
			
			<div class="btn_area">
				<input type="submit" value="변경하기" id="submitBtn" class="body_btn_css">
				<input type="button" value="취소" onclick='pageMoveBeforeFnc(${userDto.userNo});' class="body_btn_css">
			</div>
			
		</form>
	</div>
</body>
</html>