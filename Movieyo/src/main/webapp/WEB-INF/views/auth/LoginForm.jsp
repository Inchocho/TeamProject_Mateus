<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>로그인</title>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<script type="text/javascript">
// function findPw() {
// 	location.href = '../UserFindpw.do';
// }



$(function () {
$('#emailInp').keyup(function () {

	var emailC = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	
	var emailInp = $('#emailInp').val();
	
	if (emailInp.match(emailC)) {
			$('#emailText').css('display','none');
	}else {
// 		alert('asd');
		$('#emailText').css('display','block');
	}
});

});







</script>

<style type="text/css">
a{
	color: red;
}

#emailText, #passwordText {
	display: none;
	color: red;
/* 	height: 1px; */
}

.w3-content, .w3-auto {
    margin-left: auto;
    margin-right: auto;
}

</style>
</head>

<body>
	<h2>로그인</h2>
	
	<form action="./loginCtr.do" method="post">
		이메일<br>
		<input type="text" name="email" id="emailInp"><br>
			<a id="emailText">정확하지 않은 이메일입니다.</a><br>
		암호<br>
		<input type="password" name="password"><br>
			<a id="passwordText">비밀번호를 입력해주세요.</a><br>
				<input type="submit" value="로그인">
		
	</form>
		<a href="../user/UserFindpw.do">비밀번호를 잊으셨나요?</a>
		<br>
		<button type="button" onclick="location.href ='../user/add.do'">새 계정 만들기</button>
		
</body>

</html>