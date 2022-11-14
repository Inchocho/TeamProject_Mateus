<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	alert('성공적으로 처리했습니다');
	
	location.href = '/movieyo/user/one.do?no=' + ${userDto.getNo()};
</script>

</head>
<body>

</body>
</html>