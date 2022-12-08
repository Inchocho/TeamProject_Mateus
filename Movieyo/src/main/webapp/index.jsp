<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>무비요 인덱스 페이지</title>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

	window.onload = function(){
		location.href = "auth/login.do";
	};
</script>

</head>
<body>
	Hello Spring Projects..
	
	<form action="auth/login.do" id='simpleForm' method="get">
		<input type="button" value="로그인 화면으로 이동" 
			onclick="loginMoveFnc();">
	</form>
</body>
</html>
