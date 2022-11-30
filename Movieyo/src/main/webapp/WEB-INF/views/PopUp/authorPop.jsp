<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>

</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<script type="text/javascript">
	function sendIt(){
		var password = $('#password').val();
// 		alert(a);
// 		$('.submitbtn').click(function () {
			var changePw = $('#changePw').val();
			var changePwC = $('#changePwC').val();
			
			if (password != changePw) {
				alert("비밀번호를 확인해주세요");
			}else if (changePw != changePwC) {
				alert("비밀번호를 확인해주세요");
			}else {
				alert("회원탈퇴가 처리되었습니다.");
				opener.frmMother.action = "./deleteCtr.do?userNo=" + ${userNo};
				opener.frmMother.passwordChk.value = changePw.value;
				opener.frmMother.submit();
				self.close();
// 				formId.submit();

// 				window.opener.location.reload();
// 				self.close();
			}
// 		});
		
	}
	
	function cancel() {
		self.close();
	}


	
</script>
</head>
<body>
	<h1>회원탈퇴</h1>
	${userDto.nickname}님 정말로 탈퇴하시겠습니까?<br>
	
	<input type="hidden" value="${userDto.password}" id="password"><br>
	<input type="text" value="" placeholder="비밀번호:" id="changePw"><br>
	<input type="text" value="" placeholder="비밀번호 확인:" id="changePwC"><br>
	<input type="button" onclick="sendIt();" value="삭제">
	<input type="button" value="취소" onclick="cancel();">
	
</body>
</html>