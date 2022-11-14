<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보 수정</title>

<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</script>

<script type="text/javascript">
	
	function pageMoveBeforeFnc(no){
		location.href = 'one.do?no=' + no;
	}
	
</script>

</head>
	
<body>

<%-- 	<jsp:include page="../Header.jsp" /> --%>
	
	<h1>회원정보 수정</h1>
	<form action='./updateCtr.do' method='post' 
		enctype="multipart/form-data">
		<input type="hidden" name='no' value='${userDto.no}'>
		이름: <input type='text' name='name' id='memberName'
			value='${userDto.name}'><br>
		
		가입일: <fmt:formatDate value="${requestScope.userDto.createDate}" 
			pattern="yyyy-MM-dd hh:mm"/><br>
		
		생년월일: <fmt:formatDate value="${requestScope.userDto.birthdate}" 
			pattern="yyyy-MM-dd"/><br>
			
		닉네임: <input type="text" name="nickname" value="${userDto.nickname}"><br>		
		성별:
		<c:if test="${userDto.gender =='남'}">
			<input type="checkbox" name="gender" value="남" onclick="return false;" checked="checked">남
			<input type="checkbox" name="gender" value="여" onclick="return false;">여 <br>
		</c:if>
		
		<c:if test="${userDto.gender == '여'}">
			<input type="checkbox" name="gender" value="남" onclick="return false;">남
			<input type="checkbox" name="gender" value="여" onclick="return false;" checked="checked">여 <br>
		</c:if>
      	
		
		<input type='submit' value='저장하기'>
	
		<input type='button' value='돌아가기' 
			onclick='pageMoveBeforeFnc(${userDto.no});'>	
		
	</form>
	
	
<%-- 	<jsp:include page="../Tail.jsp" /> --%>
</body>
</html>