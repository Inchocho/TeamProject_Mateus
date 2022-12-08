<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>
.body_btn_css{
	height: 50px;
    background: #201919;
    color: #ff81ab;
    font-size: 20px;
    border-radius: 8px;
    margin: 10px;
}

.titleContainer{
	border-bottom: 2px solid #252525;
	margin: 3px 3px 3px 0px;
	padding-right: 400px;
}

.userInfo {
	display: flex;
	align-items: center;
	height: 45px;
	border-bottom: 1px dashed #d1d1d1;
	margin: 2px 0px;
}

.p {
	width: 180px;
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
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<script type="text/javascript">
	function sendIt(){
// 		var password = $('#password').val();
// 		alert(a);
// 		$('.submitbtn').click(function () {
// 			var changePw = $('#changePw').val();
// 			var changePwC = $('#changePwC').val();
			
// 			if (password != changePw) {
// 				alert("비밀번호를 확인해주세요");
// 			}else if (changePw != changePwC) {
// 				alert("비밀번호를 확인해주세요");
// 			}else {
// 				alert("회원탈퇴가 처리되었습니다.");
				opener.frmMother.action = "./deleteCtr.do?userNo=" + ${userDto2.userNo};
				opener.frmMother.passwordChk.value = changePw.value;
				opener.frmMother.submit();
				self.close();
// 				formId.submit();

// 				window.opener.location.reload();
// 				self.close();
// 			}
// 		});
		
	}
	
	function cancel() {
		self.close();
	}


	
</script>
</head>
<body>
	<div class="titleContainer">
	<h1>회원탈퇴</h1>
	</div>
	
	${userDto2.userNo}
	${userDto2.nickname}님 정말로 탈퇴하시겠습니까?<br>
<%-- 	<input type="hidden" value="${userDto2.password}" id="password"><br> --%>
	<div style="width: 400px;">
		<div class="userInfo">
			<p class="p">비밀번호</p>
			<input type="text" value="" id="changePw" class="input" name="password">
		</div>
		
		<div class="userInfo">
			<p class="p">비밀번호 확인</p>
			<input type="text" value="" id="changePwC" class="input">
		</div>
	</div>
	
	<input type="button" onclick="sendIt();" value="탈퇴" class="body_btn_css">
	<input type="button" value="취소" onclick="cancel();" class="body_btn_css">
	
</body>
</html>