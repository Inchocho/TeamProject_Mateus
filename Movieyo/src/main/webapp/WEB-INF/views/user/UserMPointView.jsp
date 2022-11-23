<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>회원정보 상세조회</title>


<script type="text/javascript">


	
</script>
<style type="text/css">
.userMpayContainer{
	text-align: center;
}
</style>
</head>
	
<body>

	<jsp:include page="../Header.jsp" />
	<jsp:include page="../UserMyPageSideMenu.jsp"></jsp:include>
	<div class="userMpayContainer">
	<h1>Mpay</h1>
	<form action='./chargeMpoint.do' method='post'>
		<input>
	</form>
	</div>
	<jsp:include page="../Tail.jsp" />
</body>
</html>