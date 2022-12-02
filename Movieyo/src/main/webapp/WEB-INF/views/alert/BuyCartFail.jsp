<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
var conF = confirm("　　　　　　　Mpoint 잔액이 부족합니다.\n　　　　　　　Mpay로 이동하시겠습니까?\n　　　　　　　확인▶Mpay　취소▶장바구니");
if (conF == true) {
	location.href = '/Movieyo/user/userMpoint.do';
}else{
	location.href = '/Movieyo/cart/list.do';
}
</script>
<meta charset="UTF-8">

<title>잔액부족</title>

</head>

<body>

</body>

</html>