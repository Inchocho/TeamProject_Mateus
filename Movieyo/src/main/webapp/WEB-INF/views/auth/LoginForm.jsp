<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>로그인</title>

<script type="text/javascript">
function findPw() {
	location.href = '../userFindpw.do';
}

</script>

<style type="text/css">
a{
	color: red;
}

</style>
</head>

<body>
	<h2>사용자 로그인</h2>
	
	<form action="./loginCtr.do" method="post">
		이메일:	<input type="text" name="email"><br>
		암호:		<input type="password" name="password"><br>
				<input type="submit" value="로그인">
		
	</form>
	
		<a href="findPw();">비밀번호를 잊으셨나요?</a>
		
		<br>
		
		<button type="button" onclick="location.href ='../user/add.do'">새 계정 만들기</button>
		
</body>

</html>