<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
	#div{
	border: 1px solid black;
	width: 250px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	
	<div id="div">
		<h1>비밀번호 변경</h1><br>
		<form action="./passwordUpdateCtr.do?no=${userDto.no}" method="post">
			<input type="password" placeholder="현재비밀번호:"><br>
			<input type="password" name="password" placeholder="변경할 비밀번호:"><br>
			<input type="password" placeholder="비밀번호 확인:"><br>
			
			<input type="submit" value="변경하기">
			<input type="button" value="취소">
		</form>
	</div>
</body>
</html>