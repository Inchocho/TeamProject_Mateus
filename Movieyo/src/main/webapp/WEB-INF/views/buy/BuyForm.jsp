<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix='c' %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역추가</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<jsp:include page="../Header.jsp"/>
	
	<form action="./addCtr.do" method="post" id='submitForm'>		
		구매번호:	<input type="text" name='buyNo'><br>
		영화번호: <input type="text" name='movieNo'><br>
		유저번호: <input type="text" name='userNo' value='${userDto.userNo}'><br>
		구매일자: <input type="text" name='buyDate'><br>
		구매상태: <input type='text' name='buyStatus'><br>
		<input type='submit' value='추가' id='submitBtn'>				
	</form>	

</body>
</html>