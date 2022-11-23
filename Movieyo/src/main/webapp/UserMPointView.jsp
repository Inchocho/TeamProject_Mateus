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
	min-width: 600px;
}
.mpayAttribute{
	color: #F08080;
	font-weight: bold;
	margin-right: 150px;
}
.userMpointDiv{
	display: flex;
    flex-direction: column;
    align-items: center;
}
table, tr, td, th, .userMpointTd {
	border: 2px solid black;
}
table {
	border-collapse: collapse;
}
.userMpointTd{
	width: 150px;
	height: 100px;
	font-weight: bold;
}
#userMpointInfo{
	font-size: 36px;
	font-weight: bold;
}
#chargeForm{
	width: 330px;
}

</style>
</head>
	
<body>

<jsp:include page="/WEB-INF/views/Header.jsp" />
<jsp:include page="/WEB-INF/views/UserMyPageSideMenu.jsp"></jsp:include>
<div class="userMpayContainer">
	<h1>Mpay</h1>
	<div class="userMpointDiv">
		<h2 class="mpayAttribute">Movieyo Point</h2>
		<table>
			<tr>
				<td class="userMpointTd">보유 Mpoint</td>
				<td class="userMpointTd" id="userMpointInfo">10000</td>
<%-- 				${userMpointDto.mpoint} --%>
			</tr>
		</table>
	</div>
	<div class="userMpointDiv">
		<h2 class="mpayAttribute" style="margin-right: 270px;">충전</h2>
		
	<form action='./chargeMpoint.do' method='post' id="chargeForm">
		<span class="userMpointTd">충전할 금액</span>
		<input type="text" maxlength="10" onkeyup="inputNumberFormat(this);" placeholder="충전하실 금액을 입력하세요" style="height: 20px;"/> 원
		<input type="button" value="+5,000 원">
	</form>

	</div>
</div>
<jsp:include page="/WEB-INF/views/Tail.jsp" />
</body>
</html>